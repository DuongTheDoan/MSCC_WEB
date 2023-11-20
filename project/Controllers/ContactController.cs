using Microsoft.AspNetCore.Mvc;

namespace project.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
