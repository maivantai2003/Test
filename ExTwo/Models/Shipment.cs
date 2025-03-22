using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ExTwo.Models
{
    public class Shipment
    {
        [Key]
        public int ShipmentID { get; set; }
        public int OrderID { get; set; }
        public DateTime ShipmentDate { get; set; } = DateTime.Now;
        public string DeliveryStatus { get; set; } = "Pending";
        [ForeignKey(nameof(OrderID))]
        public Order ?Order { get; set; }
    }
}
