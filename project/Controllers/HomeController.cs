using Microsoft.AspNetCore.Mvc;

namespace project.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
            //di chuyển đến trang admin
            //return Redirect("/Admin");
        }
    }
}
