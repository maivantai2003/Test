using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ExOne.Models
{
    public class Books
    {
        [Key]
        public int BookId { get; set; }
        public int AuthorId {  get; set; }
        [Required]
        [StringLength(200)] 
        
        public string Title { get; set; }
        [Required]
        [Column(TypeName = "decimal(10,2)")]
        
        public decimal Price { get; set; }
        public DateTime? PublishedDate {  get; set; }
        [ForeignKey(nameof(AuthorId))]
        public Authors? Authors { get; set; }

    }
}
