using ExTwo.Common;
using ExTwo.Interfaces;
using ExTwo.Viewmodels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ExTwo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComplexOrderReportController : ControllerBase
    {
        private readonly IComplexOrderReportRepository _complexOrderReportRepository;
        public ComplexOrderReportController(IComplexOrderReportRepository complexOrderReportRepository)
        {
            _complexOrderReportRepository= complexOrderReportRepository;    
        }
        [HttpGet("[action]")]
        public async Task<IActionResult> GetComplexOrderReport([FromQuery] DateTime startDate, [FromQuery] DateTime endDate,[FromQuery] int? customerId, [FromQuery] decimal? minAmount,[FromQuery] decimal? maxAmount, [FromQuery] string? orderStatus,[FromQuery] string? shipmentStatus)
        {
            try
            {
                var response = await _complexOrderReportRepository.GetComplexOrderReport(startDate, endDate, customerId, minAmount, maxAmount, orderStatus, shipmentStatus);
                return Ok(ApiResponse<IEnumerable<ComplexOrderReportViewModel>>.SuccessResponse("success GetComplexOrderReport", response));
            }catch(Exception ex)
            {
                return Ok(ApiResponse<IEnumerable<ComplexOrderReportViewModel>>.ErrorResponse("error GetComplexOrderReport",new List<string>()
                {
                    ex.Message
                }));
            }
        }
    }
}
