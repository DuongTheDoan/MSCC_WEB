using Microsoft.AspNetCore.Mvc;

using project.Models;//nhin thay cac file class trong thu muc Models
using BC = BCrypt.Net.BCrypt; //thu vien ma hoa password
using X.PagedList;//thu vien phan trang

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class UsersController : Controller
    {
        //khai bao doi tuong thao tac csdl
        public MyDbContext db = new MyDbContext();
        public IActionResult Index()
        {
            return Redirect("/Admin/Users/Read");
        }
        public IActionResult Read(int? page)
        {
            //số bản ghi trên một trang
            int pageSize = 4;
            //số trang
            int pageNumber = page ?? 1;
            List<ItemUser> users = db.Users.OrderByDescending(item=>item.Id).ToList();
            return View("Read",users.ToPagedList(pageNumber,pageSize));
        }
        //update
        public IActionResult Update(int id)
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Users/UpdatePost/" + id;
            //lay một bản ghi tương ứng với id truyền vào
            ItemUser record = db.Users.FirstOrDefault(item => item.Id == id);
            return View("CreateUpdate",record);
        }
        //update - sau khi ấn nút submit
        [HttpPost]
        public IActionResult UpdatePost(int id, IFormCollection fc) 
        {
            string _Name = fc["Name"].ToString().Trim();
            string _Email = fc["Email"].ToString().Trim();
            string _Password = fc["Password"].ToString();            
            //lay một bản ghi tương ứng với id truyền vào
            ItemUser record = db.Users.FirstOrDefault(item => item.Id == id);
            if (record != null)
            {
                //kiểm tra xem email này đã tồn tại trong table Users chưa, nếu chưa thì mới cho update
                ItemUser record_check = db.Users.FirstOrDefault(item => item.Id != id && item.Email == _Email);
                if (record_check == null)
                {
                    record.Name = _Name;
                    record.Email = _Email;
                    //nếu password không rỗng thì update password
                    if (!String.IsNullOrEmpty(_Password))
                    {
                        //mã hóa password
                        _Password = BC.HashPassword(_Password);
                        record.Password = _Password;
                    }
                    //cập nhật lại dữ liệu
                    db.Update(record);
                    db.SaveChanges();
                }
                else
                    return Redirect("/Admin/Users/Update/" + id + "?notify=email-exists");
            }
            return Redirect("/Admin/Users/Read");
        }
        //create
        public IActionResult Create()
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Users/CreatePost";
            return View("CreateUpdate");
        }
        //update - sau khi ấn nút submit
        [HttpPost]
        public IActionResult CreatePost(IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            string _Email = fc["Email"].ToString().Trim();
            string _Password = fc["Password"].ToString();
            //mã hóa password
            _Password = BC.HashPassword(_Password);
            //kiểm tra trong csdl xem đã tồn tại email chưa, nếu chưa thì mới update
            ItemUser record_check = db.Users.FirstOrDefault(item=>item.Email == _Email);
            if(record_check == null)
            {
                ItemUser record = new ItemUser();
                record.Name = _Name;
                record.Email = _Email;
                record.Password = _Password;
                //cập nhật lại dữ liệu
                db.Users.Add(record);
                db.SaveChanges();
            }
            else
                return Redirect("/Admin/Users/Create?notify=email-exists");
            return Redirect("/Admin/Users/Read");
        }
        //delete
        public IActionResult Delete(int id)
        {
            //lay một bản ghi tương ứng với id truyền vào
            ItemUser record = db.Users.FirstOrDefault(item => item.Id == id);
            //xoa ban ghi
            if (record != null)
            {
                db.Users.Remove(record);
                db.SaveChanges();
            }
            return Redirect("/Admin/Users/Read");
        }
    }
}
