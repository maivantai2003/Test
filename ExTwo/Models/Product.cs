using System.ComponentModel.DataAnnotations;

namespace ExTwo.Models
{
    public class Product
    {
        [Key]
        public int ProductID { get; set; }
        public string ProductName { get; set; } = string.Empty;
        public string? Category { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public ICollection<OrderItem>? OrderItems { get; set; }
    }
}
