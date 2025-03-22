using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ExTwo.Models
{
    public class Order
    {
        [Key]
        public int OrderID { get; set; }
        public int CustomerID { get; set; }
        public DateTime OrderDate { get; set; } = DateTime.Now;
        public string Status { get; set; } = "Pending";
        [ForeignKey(nameof(CustomerID))]
        public Customer ?Customer { get; set; }
        public ICollection<OrderItem>? OrderItems { get; set; }
        public ICollection<Shipment>? Shipments { get; set; }
    }
}
