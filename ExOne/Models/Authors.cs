using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace ExOne.Models
{
    public class Authors
    {
        [Key]
        public int AuthorId {  get; set; }
        [Required]
        [StringLength(100)]
        public string Name {  get; set; }
        [StringLength(500)]  
        public string? Bio {  get; set; }
        [JsonIgnore]
        public ICollection<Books>? ListBook { get; set; }
    }
}
