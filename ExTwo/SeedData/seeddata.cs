using ExTwo.Data;
using ExTwo.Models;

namespace ExTwo.SeedData
{
    public static class seeddata
    {
        public static void Initialize(ApplicationDbContext context)
        {
            if (context.Customers.Any()) return;
            var customers = new Customer[]
            {
                new Customer { Name = "John Doe", Email = "john.doe@example.com", Phone = "123456789", Address = "123 Main St" },
                new Customer { Name = "Jane Smith", Email = "jane.smith@example.com", Phone = "987654321", Address = "456 Elm St" },
                new Customer { Name = "Alice Johnson", Email = "alice.johnson@example.com", Phone = "555666777", Address = "789 Oak St" },
                new Customer { Name = "Bob Brown", Email = "bob.brown@example.com", Phone = "111222333", Address = "321 Pine St" },
                new Customer { Name = "Charlie White", Email = "charlie.white@example.com", Phone = "444555666", Address = "654 Cedar St" }
            };
            context.Customers.AddRange(customers);
            context.SaveChanges();
            var products = new Product[]
            {
                new Product { ProductName = "Laptop", Category = "Electronics", Price = 1000.00m, Stock = 50 },
                new Product { ProductName = "Smartphone", Category = "Electronics", Price = 500.00m, Stock = 100 },
                new Product { ProductName = "Headphones", Category = "Accessories", Price = 100.00m, Stock = 200 },
                new Product { ProductName = "Tablet", Category = "Electronics", Price = 700.00m, Stock = 80 },
                new Product { ProductName = "Monitor", Category = "Electronics", Price = 300.00m, Stock = 60 }
            };
            context.Products.AddRange(products);
            context.SaveChanges();
            var orders = new Order[]
            {
                new Order { CustomerID = customers[0].CustomerID, OrderDate = DateTime.Parse("2024-03-01"), Status = "Shipped" },
                new Order { CustomerID = customers[1].CustomerID, OrderDate = DateTime.Parse("2024-03-05"), Status = "Processing" },
                new Order { CustomerID = customers[2].CustomerID, OrderDate = DateTime.Parse("2024-03-07"), Status = "Delivered" },
                new Order { CustomerID = customers[3].CustomerID, OrderDate = DateTime.Parse("2024-03-10"), Status = "Pending" },
                new Order { CustomerID = customers[4].CustomerID, OrderDate = DateTime.Parse("2024-03-12"), Status = "Shipped" }
            };
            context.Orders.AddRange(orders);
            context.SaveChanges();
            var orderItems = new OrderItem[]
            {
                new OrderItem { OrderID = orders[0].OrderID, ProductID = products[0].ProductID, Quantity = 1, Price = 1000.00m },
                new OrderItem { OrderID = orders[0].OrderID, ProductID = products[2].ProductID, Quantity = 2, Price = 100.00m },
                new OrderItem { OrderID = orders[1].OrderID, ProductID = products[1].ProductID, Quantity = 1, Price = 500.00m },
                new OrderItem { OrderID = orders[2].OrderID, ProductID = products[0].ProductID, Quantity = 1, Price = 1000.00m },
                new OrderItem { OrderID = orders[2].OrderID, ProductID = products[1].ProductID, Quantity = 2, Price = 500.00m },
                new OrderItem { OrderID = orders[3].OrderID, ProductID = products[3].ProductID, Quantity = 3, Price = 700.00m },
                new OrderItem { OrderID = orders[4].OrderID, ProductID = products[4].ProductID, Quantity = 2, Price = 300.00m }
            };
            context.OrderItems.AddRange(orderItems);
            context.SaveChanges();

            var shipments = new Shipment[]
            {
                new Shipment { OrderID = orders[0].OrderID, ShipmentDate = DateTime.Parse("2024-03-02"), DeliveryStatus = "In Transit" },
                new Shipment { OrderID = orders[2].OrderID, ShipmentDate = DateTime.Parse("2024-03-08"), DeliveryStatus = "Delivered" },
                new Shipment { OrderID = orders[4].OrderID, ShipmentDate = DateTime.Parse("2024-03-13"), DeliveryStatus = "Shipped" }
            };
            context.Shipments.AddRange(shipments);
            context.SaveChanges();
        }
    }
}
