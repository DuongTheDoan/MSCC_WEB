using System.ComponentModel.DataAnnotations;//tag Key
using System.ComponentModel.DataAnnotations.Schema;//tag Table
namespace project.Models
{
    //Class này sẽ tác động đến table nào
    [Table("Categories")]
    public class ItemCategory
    {
        //Định nghĩa key
        [Key]
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string Name { get; set; }
        public int DisplayHomePage { get; set; }
    }
}
