﻿using System.ComponentModel.DataAnnotations;

namespace ExTwo.Models
{
    public class Customer
    {
        [Key]
        public int CustomerID { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public ICollection<Order> ?Orders { get; set; }
    }
}
