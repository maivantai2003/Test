using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ExTwo.Models
{
    public class OrderItem
    {
        [Key]
        public int OrderItemID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        [ForeignKey(nameof(OrderID))]
        public Order ?Order { get; set; }
        [ForeignKey(nameof(ProductID))]
        public Product ?Product { get; set; }
    }
}
