var builder = WebApplication.CreateBuilder(args);

//add MVC
builder.Services.AddControllersWithViews();
//Thêm dòng dưới để add biến session
builder.Services.AddSession();

var app = builder.Build();

//để sử dụng biến session thì khai báo dòng sau
app.UseSession();
//khai báo thư mục wwwroot thành thư mục ảo
app.UseStaticFiles();

//app.MapGet("/", () => "Hello World!");
app.MapControllerRoute(
    name: "admin",
    pattern: "{area}/{controller=Home}/{action=Index}/{id?}");
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
