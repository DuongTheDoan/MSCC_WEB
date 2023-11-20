using Microsoft.AspNetCore.Mvc;
using BCrypt.Net;
using project.Areas.Admin.Attributes;//de nhin thay CheckLogin.cs

namespace project.Areas.Admin.Controllers
{
    //phải đặt tag sau ở trong các controller của Area = Admin
    [Area("Admin")]
    //kiểm tra đăng nhập
    [CheckLogin]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            //string passwordHash = BCrypt.Net.BCrypt.HashPassword("123");
            //return Content(passwordHash);
            return View();
        }
    }
}
