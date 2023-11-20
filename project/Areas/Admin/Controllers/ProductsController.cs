using Microsoft.AspNetCore.Mvc;

using project.Models;//nhin thay thu muc Models
using X.PagedList;//phan trang
using project.Areas.Admin.Attributes;//de nhin thay file CheckLogin.cs

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductsController : Controller
    {
        public MyDbContext db = new MyDbContext();
        public IActionResult Index()
        {
            return Redirect("/Admin/Products/Read");
        }
        public IActionResult Read(int? page)
        {
            //số bản ghi trên một trang
            int pageSize = 4;
            //số trang
            int pageNumber = page ?? 1;
            List<ItemProduct> list_record = db.Products.OrderByDescending(item => item.Id).ToList();
            return View("Read", list_record.ToPagedList(pageNumber, pageSize));
        }
        //update
        public IActionResult Update(int id)
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Products/UpdatePost/" + id;
            //lay một bản ghi tương ứng với id truyền vào
            ItemProduct record = db.Products.FirstOrDefault(item => item.Id == id);
            return View("CreateUpdate", record);
        }
        //update Post
        [HttpPost]
        public IActionResult UpdatePost(int id, IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            double _Price = Convert.ToDouble(fc["Price"].ToString());
            double _Discount = Convert.ToDouble(fc["Discount"].ToString());
            int _Hot = !String.IsNullOrEmpty(fc["Hot"]) ? 1 : 0;
            string _Description = fc["Description"].ToString().Trim();
            string _Content = fc["Content"].ToString().Trim();
            //lấy record tương ứng với id truyền vào để update dữ liệu
            ItemProduct record = db.Products.Where(item=>item.Id == id).FirstOrDefault();
            if (record != null)
            {                
                record.Name = _Name;
                record.Price = _Price;
                record.Discount = _Discount;
                record.Hot = _Hot;
                record.Description = _Description;
                record.Content = _Content;
                //kiểm tra nếu ảnh thay đổi thì update ảnh
                try
                {
                    if (!String.IsNullOrEmpty(Request.Form.Files[0].FileName))
                    {
                        string _Photo = DateTime.Now.ToFileTime() + "_" + Request.Form.Files[0].FileName;
                        //return Content(_Photo);
                        string _Path = Path.Combine("wwwroot/Upload/Products/", _Photo);
                        //upload file
                        using (var stream = new FileStream(_Path, FileMode.Create))
                        {
                            Request.Form.Files[0].CopyTo(stream);
                        }
                        //cập nhật lại trường Photo của talbe Products
                        record.Photo = _Photo;
                    }
                }
                catch {; }
                //cập nhật sự thay đổi
                db.Update(record);
                db.SaveChanges();
            }
            //update categories
            var categories = fc["Categories"];
            //xóa các bản ghi tương ứng với ProductId trong bảng CategoriesProducts để update lại bản ghi mới
            var list_categories_products = db.CategoriesProducts.Where(item=>item.ProductId == id);
            foreach(var item in list_categories_products)
            {
                db.Remove(item);                
            }
            //cap nhat csdl
            db.SaveChanges();
            //duyệt các phần tử của biến categories
            foreach (var category_id in categories)
            {
                var record_category_product = new ItemCategoryProduct();
                record_category_product.CategoryId = Convert.ToInt32(category_id);
                record_category_product.ProductId = id;
                //them ban ghi
                db.CategoriesProducts.Add(record_category_product);
                //cap nhat csdl
                db.SaveChanges();
            }
            //---
            //update tags
            var tags = fc["Tags"];
            //xóa các bản ghi tương ứng với ProductId trong bảng TagsProducts để update lại bản ghi mới
            var list_tags_products = db.TagsProducts.Where(item => item.ProductId == id);
            foreach (var item in list_tags_products)
            {
                db.Remove(item);
            }
            //cap nhat csdl
            db.SaveChanges();
            //duyệt các phần tử của biến tags
            foreach (var category_id in tags)
            {
                var record_tag_product = new ItemTagProduct();
                record_tag_product.TagId = Convert.ToInt32(category_id);
                record_tag_product.ProductId = id;
                //them ban ghi
                db.TagsProducts.Add(record_tag_product);
                //cap nhat csdl
                db.SaveChanges();
            }
            //---
            //return Content("ok");
            return Redirect("/Admin/Products/Read");
        }
        //create
        public IActionResult Create()
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Products/CreatePost";
            return View("CreateUpdate");
        }
        [HttpPost]
        public IActionResult CreatePost(IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            double _Price = Convert.ToDouble(fc["Price"].ToString());
            double _Discount = Convert.ToDouble(fc["Discount"].ToString());
            int _Hot = !String.IsNullOrEmpty(fc["Hot"]) ? 1 : 0;
            string _Description = fc["Description"].ToString().Trim();
            string _Content = fc["Content"].ToString().Trim();
            //tạo record
            ItemProduct record = new ItemProduct();
            record.Name = _Name;
            record.Price = _Price;
            record.Discount = _Discount;
            record.Hot = _Hot;
            record.Description = _Description;
            record.Content = _Content;
            //kiểm tra nếu ảnh thay đổi thì update ảnh
            try
            {
                if (!String.IsNullOrEmpty(Request.Form.Files[0].FileName))
                {
                    string _Photo = DateTime.Now.ToFileTime() + "_" + Request.Form.Files[0].FileName;
                    //return Content(_Photo);
                    string _Path = Path.Combine("wwwroot/Upload/Products/", _Photo);
                    //upload file
                    using (var stream = new FileStream(_Path, FileMode.Create))
                    {
                        Request.Form.Files[0].CopyTo(stream);
                    }
                    //cập nhật lại trường Photo của talbe Products
                    record.Photo = _Photo;
                }
            }
            catch {; }
            //cập nhật sự thay đổi
            db.Products.Add(record);
            db.SaveChanges();
            //update categories
            var categories = fc["Categories"];            
            //cap nhat csdl
            db.SaveChanges();
            //duyệt các phần tử của biến categories
            foreach (var category_id in categories)
            {
                var record_category_product = new ItemCategoryProduct();
                record_category_product.CategoryId = Convert.ToInt32(category_id);
                record_category_product.ProductId = record.Id;//id vừa mới insert bên trên
                //them ban ghi
                db.CategoriesProducts.Add(record_category_product);
                //cap nhat csdl
                db.SaveChanges();
            }
            //---
            //update tags
            var tags = fc["Tags"];
            //cap nhat csdl
            db.SaveChanges();
            //duyệt các phần tử của biến tags
            foreach (var category_id in tags)
            {
                var record_tag_product = new ItemTagProduct();
                record_tag_product.TagId = Convert.ToInt32(category_id);
                record_tag_product.ProductId = record.Id;//id vừa mới insert bên trên
                //them ban ghi
                db.TagsProducts.Add(record_tag_product);
                //cap nhat csdl
                db.SaveChanges();
            }
            //---
            //return Content("ok");
            return Redirect("/Admin/Products/Read");
        }
        public IActionResult Delete(int id)
        {
            //lấy record tương ứng với id truyền vào để xóa dữ liệu
            ItemProduct record = db.Products.Where(item => item.Id == id).FirstOrDefault();
            if (record != null)
            {                
                db.Products.Remove(record);
                db.SaveChanges();
            }
            return Redirect("/Admin/Products/Read");
        }
    }
}
