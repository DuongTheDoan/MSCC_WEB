using Microsoft.AspNetCore.Mvc;
using project.Models; //nhin thay cac file .cs trong folder Models
using System.Data;//su dung DataTable
using X.PagedList; //phan trang
using project.Areas.Admin.Attributes; //nhin thay cac file .cs trong folder Attributes

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    //Kiem tra login
    [CheckLogin]
    public class OrdersController : Controller
    {
        public MyDbContext db = new MyDbContext();
        public IActionResult Index(int? page)
        {
            //lay trang  hien tai
            /*
             page ?? 1
                neu page khac null thi _CurrentPage = page
                neu page = null thi _CurrentPage = 1
             */
            int _CurrentPage = page ?? 1;
            //dinh nghia so ban ghi tren mot trang
            int _RecordPerPage = 20;
            //lay tat ca cac ban ghi trong table News
            List<ItemOrder> listRecord = db.Orders.OrderByDescending(item => item.Id).ToList();
            //truyen gia tri ra view co phan trang
            //return Content(HttpContext.Session.GetString("id"));
            return View("Index", listRecord.ToPagedList(_CurrentPage, _RecordPerPage));
        }
        //chi tiet san pham
        public IActionResult Detail(int? id)
        {
            int _OrderId = id ?? 0;
            ViewBag.OrderId = _OrderId;
            //lay danh sach cac san pham thuoc don hang
            List<ItemOrderDetail> _ListRecord = db.OrdersDetail.Where(tbl => tbl.OrderId == _OrderId).ToList();
            return View("Detail", _ListRecord);
        }
        //giao hang
        public IActionResult Delivery(int? id)
        {
            int _OrderId = id ?? 0;
            ItemOrder record = db.Orders.Where(tbl => tbl.Id == _OrderId).FirstOrDefault();
            if (record != null)
            {
                record.Status = 1;
                //cap nhat du lieu
                db.SaveChanges();
            }
            return Redirect("/Admin/Orders");
        }
    }
}
