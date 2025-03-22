﻿namespace ExTwo.Viewmodels
{
    public class ComplexOrderReportViewModel
    {
        public int OrderID { get; set; }
        public DateTime OrderDate { get; set; }
        public string CustomerName { get; set; }
        public decimal TotalAmount { get; set; }
        public int TotalQuantity { get; set; }
        public DateTime? ShipmentDate { get; set; }
        public string? DeliveryStatus { get; set; }
        public string? OrderStatus { get; set; }
    }
}
