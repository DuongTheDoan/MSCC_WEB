using Microsoft.AspNetCore.Mvc;

using project.Models;//nhin thay thu muc Models
using X.PagedList;//phan trang
using System.Data;//DataTable
using System.Text.Json;//AddJsonFile
using Microsoft.Data.SqlClient;//SqlConnection, DataAdapter, DataSet, DataCommand
using project.Areas.Admin.Attributes;//de nhin thay file CheckLogin.cs

namespace project.Areas.Admin.Controllers
{
    //trong Area Admin phai co tag sau
    [Area("Admin")]
    //kiem tra user dang nhap
    [CheckLogin]
    public class CategoriesController : Controller
    {
        //tạo biến lưu chuỗi kết nối
        string strConnectionString;
        //Định nghĩa hàm tạo: là hàm sẽ tự động được triệu gọi khi class này hoạt động
        public CategoriesController()
        {
            //tạo đối tượng để đọc các thông số trong file appsettings.json
            var config = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            this.strConnectionString = config.GetConnectionString("MyConnectionString").ToString();
        }
        public IActionResult Index()
        {
            return Redirect("/Admin/Categories/Read");
        }
        public IActionResult Read(int? page)
        {
            //sử dụng ADO để truyền câu truy vấn sql và lấy kết quả trả về
            //Tạo đối tượng DataTable để đổi dữ liệu từ kết quả truy vấn
            DataTable dtCategories = new DataTable();
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                //Tạo đối tượng DataAdapter để truyền câu lệnh sql và lấy kết quả trả về
                SqlDataAdapter da = new SqlDataAdapter("select * from Categories where ParentId = 0 order by Id desc", conn);
                //Fill dữ liệu từ da vào DataTable
                da.Fill(dtCategories);
            }
            //---
            //do thư viện X.PagedList sử dụng List để phân trang, vì vậy cần chuyển đổi DataTable có tên là dtCategories sang List
            //tạo đối tượng List để lưu dữ liệu từ dtCategories chuyển sang
            List<ItemCategory> listCategory = new List<ItemCategory>();
            //duyệt các row của dtCategories và tạo các row List để add vào List
            foreach (DataRow item in dtCategories.Rows)
            {
                listCategory.Add(new ItemCategory() { Id = Convert.ToInt32(item["id"]), ParentId = Convert.ToInt32(item["ParentId"]), Name = item["Name"].ToString(), DisplayHomePage = Convert.ToInt32(item["DisplayHomePage"]) });
            }
            //---
            //Sử dụng X.PagedList để phân trang
            int pageSize = 4;
            int pageNumber = page ?? 1;
            //---
            return View("Read", listCategory.ToPagedList(pageNumber, pageSize));
        }
        //update
        public IActionResult Update(int id)
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Categories/UpdatePost/" + id;
            //tao doi tuong DataTable de fill du lieu tu DataAdapter
            DataTable dtCategory = new DataTable();
            //lay một bản ghi tương ứng với id truyền vào
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from Categories where Id = " + id, conn);
                //fill du lieu tu da vao dtCategory
                da.Fill(dtCategory);
            }
            //ban ghi cua dtCategory la mot table chua 1 row (do truy van o tren chi tra ve 1 row)
            return View("CreateUpdate", dtCategory);
        }
        //update - sau khi ấn nút submit
        [HttpPost]
        public IActionResult UpdatePost(int id, IFormCollection fc)
        {
            //su dung doi tuong IFormCollection de lay du lieu theo kieu POST
            string _Name = fc["Name"].ToString().Trim();
            //su dung doi tuong Request de lay du lieu theo kieu POST
            int _ParentId = Convert.ToInt32(Request.Form["ParentId"]);
            int _DisplayHomePage = !String.IsNullOrEmpty(Request.Form["DisplayHomePage"]) ? 1 : 0;
            //---
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                //chu y: voi Update, Create phai Open connection
                conn.Open();
                SqlCommand cmd = new SqlCommand("update Categories set Name=@var_name, ParentId = @var_parent_id, DisplayHomePage = @display_home_page where Id = @id", conn);
                //truyen cac gia tri vao chuoi truy van
                cmd.Parameters.AddWithValue("@var_name", _Name);
                cmd.Parameters.AddWithValue("@var_parent_id", _ParentId);
                cmd.Parameters.AddWithValue("@display_home_page", _DisplayHomePage);
                cmd.Parameters.AddWithValue("@id", id);
                //thuc thi cau truy van
                cmd.ExecuteNonQuery();
            }
            //---
            return Redirect("/Admin/Categories/Read");
        }
        //create
        public IActionResult Create()
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Categories/CreatePost";
            return View("CreateUpdate");
        }
        //update - sau khi ấn nút submit
        [HttpPost]
        public IActionResult CreatePost(IFormCollection fc)
        {
            //su dung doi tuong IFormCollection de lay du lieu theo kieu POST
            string _Name = fc["Name"].ToString().Trim();
            //su dung doi tuong Request de lay du lieu theo kieu POST
            int _ParentId = Convert.ToInt32(Request.Form["ParentId"]);
            int _DisplayHomePage = !String.IsNullOrEmpty(Request.Form["DisplayHomePage"]) ? 1 : 0;
            //---
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                //chu y: voi Update, Create phai Open connection
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Categories(Name,ParentId,DisplayHomePage) values(@var_name,@var_parent_id,@display_home_page)", conn);
                //truyen cac gia tri vao chuoi truy van
                cmd.Parameters.AddWithValue("@var_name", _Name);
                cmd.Parameters.AddWithValue("@var_parent_id", _ParentId);
                cmd.Parameters.AddWithValue("@display_home_page", _DisplayHomePage);
                //thuc thi cau truy van
                cmd.ExecuteNonQuery();
            }
            //---
            return Redirect("/Admin/Categories/Read");
        }
        //delete
        public IActionResult Delete(int id)
        {
            //---
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                //chu y: voi Update, Create phai Open connection
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from Categories where Id = @id or ParentId = @id", conn);
                //truyen cac gia tri vao chuoi truy van
                cmd.Parameters.AddWithValue("@id", id);
                //thuc thi cau truy van
                cmd.ExecuteNonQuery();
            }
            //---
            return Redirect("/Admin/Categories/Read");
        }
    }
}
