using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace project.Models
{
    [Table("Slides")]
    public class ItemSlide
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Photo { get; set; }
        public string Title { get; set; }
        public string SubTitle { get; set; }
        public string Info { get; set; }
        public string Link { get; set; }
    }
}
