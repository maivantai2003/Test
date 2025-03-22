using ExTwo.Data;
using ExTwo.Interfaces;
using ExTwo.Viewmodels;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace ExTwo.Repositories
{
    public class ComplexOrderReportRepository:IComplexOrderReportRepository
    {
        private readonly ApplicationDbContext _context;
        public ComplexOrderReportRepository(ApplicationDbContext context) { 
            _context = context;
        }

        public async Task<IEnumerable<ComplexOrderReportViewModel>> GetComplexOrderReport(DateTime? startDate, DateTime? endDate, int? customerId, decimal? minAmount, decimal? maxAmount, string? orderStatus, string? shipmentStatus)
        {
            return await _context.Set<ComplexOrderReportViewModel>().FromSqlRaw(
            "EXEC sp_GetComplexOrderReport @StartDate, @EndDate, @CustomerID, @MinAmount, @MaxAmount, @OrderStatus, @ShipmentStatus",
            new SqlParameter("@StartDate", startDate),
            new SqlParameter("@EndDate", endDate),
            new SqlParameter("@CustomerID", customerId ?? (object)DBNull.Value),
            new SqlParameter("@MinAmount", minAmount ?? (object)DBNull.Value),
            new SqlParameter("@MaxAmount", maxAmount ?? (object)DBNull.Value),
            new SqlParameter("@OrderStatus", orderStatus ?? (object)DBNull.Value),
            new SqlParameter("@ShipmentStatus", shipmentStatus ?? (object)DBNull.Value)).ToListAsync();
        }
    }
}
