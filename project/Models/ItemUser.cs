using System.ComponentModel.DataAnnotations;//tag Key
using System.ComponentModel.DataAnnotations.Schema;//tag Table
namespace project.Models
{
    //Class này sẽ tác động đến table nào
    [Table("Users")]
    public class ItemUser
    {
        //Định nghĩa key
        [Key]
        public int Id { get; set; }
        //dấu ? thể hiện là trường này có thể NULL (trường nào nếu trong csdl có thể có giá trị NULL thì cần có dấu ? như dòng dưới, nếu không thì sẽ bị báo lỗi)
        public string? Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
