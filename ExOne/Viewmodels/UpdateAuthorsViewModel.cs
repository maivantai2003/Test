using System.ComponentModel.DataAnnotations;

namespace ExOne.Viewmodels
{
    public class UpdateAuthorsViewmodel
    {
        [Required]
        public int AuthorId { get; set; }
        [Required]  
  
        [StringLength(100)]
        public string Name { get; set; }
        [StringLength(500)]
        public string? Bio { get; set; }
    }
}
