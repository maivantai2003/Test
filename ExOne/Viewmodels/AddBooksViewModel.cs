using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ExOne.Viewmodels
{
    public class AddBooksViewModel
    {
        public int AuthorId { get; set; }
        [Required]
        [StringLength(200)]

        public string Title { get; set; }
        [Required]
        [Column(TypeName = "decimal(10,2)")]

        public decimal Price { get; set; }
        public DateTime? PublishedDate { get; set; }
    }
}
