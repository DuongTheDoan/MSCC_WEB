using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

//su dung doi tuong thao tac IFormCollection
using Microsoft.AspNetCore.Http;
//nhin thay cac file .cs ben trong folder Models
using project.Models;
using Microsoft.EntityFrameworkCore;
//phan trang
using X.PagedList;
//nhin thay file CheckLogin.cs trong thu muc Attributes
using project.Areas.Admin.Attributes;
//doi tuong thao tac file
using System.IO;

namespace project.Areas.Admin.Controllers
{
    //Khai bao dong sau de nhan biet tren url day la Area Admin
    [Area("Admin")]
    //kiem tra login
    //[CheckLogin]
    public class AdvController : Controller
    {
        //khai bao bien toan cuc de thao tac csdl (de su dung trong tat ca cac ham)
        public MyDbContext db = new MyDbContext();
        public IActionResult Index()
        {
            return RedirectToAction("Read");
        }
        public IActionResult Read(int? page)
        {            
            //quy dinh so ban ghi tren mot trang
            int _RecordPerPage = 20;
            //lay bien page truyen tu url
            int _CurrentPage = page ?? 1;
            //lay tat ca cac ban ghi trong bang Adv
            List<ItemAdv> _ListRecord = db.Adv.OrderByDescending(item => item.Id).ToList();
            //return Content(_ListRecord.Count.ToString());
            //truyen gia tri ra view co phan trang
            return View("Read", _ListRecord.ToPagedList(_CurrentPage, _RecordPerPage));
        }
        public IActionResult update(int? id)
        {
            int _id = id ?? 0;
            //lay mot ban ghi
            ItemAdv record = db.Adv.Where(item => item.Id == _id).FirstOrDefault();
            //goi view, truyen du lieu ra view
            return View("CreateUpdate", record);
        }
        [HttpPost]
        public IActionResult Update(IFormCollection fc, int? id)
        {
            string _Name = fc["Name"].ToString().Trim();
            int _Position = Convert.ToInt32(fc["Position"].ToString().Trim());
            //---
            int _id = id ?? 0;
            //lay ban ghi tuong ung voi id truyen vao
            var record = db.Adv.Where(item => item.Id == _id).FirstOrDefault();
            //update ban ghi
            record.Name = _Name;
            record.Position = _Position;
            //---
            //lay thong tin o the file co type="file"
            string _FileName = "";
            try
            {
                //lay ten file
                _FileName = Request.Form.Files[0].FileName;
            }
            catch {; }
            if (!String.IsNullOrEmpty(_FileName))
            {
                //xoa anh cu
                if (record.Photo != null && System.IO.File.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo)))
                {
                    System.IO.File.Delete(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo));
                }
                //upload anh moi
                //lay thoi gian gan vao ten file -> tranh cac file co ten trung ten voi file se upload
                var timestap = DateTime.Now.ToFileTime();
                _FileName = timestap + "_" + _FileName;
                //lay duong dan cua file
                string _Path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Adv", _FileName);
                //upload file
                using (var stream = new FileStream(_Path, FileMode.Create))
                {
                    Request.Form.Files[0].CopyTo(stream);
                }
                //update gia tri vao cot Photo trong csdl
                record.Photo = _FileName;
            }
            //---
            //cap nhat ban ghi
            db.SaveChanges();
            //---
            return Redirect("/Admin/Adv");
        }
        //create
        public IActionResult Create()
        {
            return View("CreateUpdate");
        }
        [HttpPost]
        public IActionResult Create(IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            int _Position = Convert.ToInt32(fc["Position"].ToString().Trim());
            //---
            //lay ban ghi tuong ung voi id truyen vao
            ItemAdv record = new ItemAdv();
            //update ban ghi
            record.Name = _Name;
            record.Position = _Position;
            //---
            //lay thong tin o the file co type="file"
            string _FileName = "";
            try
            {
                //lay ten file
                _FileName = Request.Form.Files[0].FileName;
            }
            catch {; }
            if (!String.IsNullOrEmpty(_FileName))
            {
                //upload anh moi
                //lay thoi gian gan vao ten file -> tranh cac file co ten trung ten voi file se upload
                var timestap = DateTime.Now.ToFileTime();
                _FileName = timestap + "_" + _FileName;
                //lay duong dan cua file
                string _Path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Upload/Adv", _FileName);
                //upload file
                using (var stream = new FileStream(_Path, FileMode.Create))
                {
                    Request.Form.Files[0].CopyTo(stream);
                }
            }
            //update gia tri vao cot Photo trong csdl
            record.Photo = _FileName;

            //---
            //tham ban ghi vao csdl
            db.Adv.Add(record);
            //cap nhat ban ghi
            db.SaveChanges();
            //---
            return Redirect("/Admin/Adv");
        }
        //xoa ban ghi
        public IActionResult Delete(int? id)
        {
            int _id = id ?? 0;
            //lay ban ghi tuong ung voi id truyen vao
            var record = db.Adv.Where(item => item.Id == _id).FirstOrDefault();
            //xoa anh
            if (record.Photo != null && System.IO.File.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo)))
            {
                System.IO.File.Delete(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", "Adv", record.Photo));
            }
            //xoa ban ghi
            db.Adv.Remove(record);
            //cap nhat csdl
            db.SaveChanges();
            return Redirect("/Admin/Adv");
        }
    }
}
