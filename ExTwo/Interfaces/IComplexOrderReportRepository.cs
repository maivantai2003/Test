using ExTwo.Viewmodels;

namespace ExTwo.Interfaces
{
    public interface IComplexOrderReportRepository
    {
        Task<IEnumerable<ComplexOrderReportViewModel>> GetComplexOrderReport(DateTime? startDate, DateTime? endDate, int? customerId, decimal? minAmount,decimal? maxAmount, string? orderStatus, string? shipmentStatus);
    }
}
