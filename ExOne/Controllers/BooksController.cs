using ExOne.Common;
using ExOne.Interfaces;
using ExOne.Models;
using ExOne.Repositories;
using ExOne.Viewmodels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.WebSockets;
using static System.Reflection.Metadata.BlobBuilder;

namespace ExOne.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly IBooksRepository _booksRepository;
        public BooksController(IBooksRepository booksRepository)
        {
            _booksRepository = booksRepository; 
        }
        [HttpGet("fetch")]
        public async Task<IActionResult> GetAllBooks()
        {
            try
            {
                var response = await _booksRepository.GetAllAsync();
                return Ok(ApiResponse<IEnumerable<BooksViewModel>>.SuccessResponse("fetch success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<IEnumerable<BooksViewModel>>.ErrorResponse("fetch error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

        [HttpGet("fetch/{id}")]
        public async Task<IActionResult> GetBookById(int id)
        {
            try
            {
                var response = await _booksRepository.GetByIdAsync(id);
                return Ok(ApiResponse<BooksViewModel>.SuccessResponse("fetch success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<BooksViewModel>.ErrorResponse("fetch error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

        [HttpPost("insert")]
        public async Task<IActionResult> InsertBook([FromBody] AddBooksViewModel book)
        {
            try
            {
                var books = new Books()
                {
                    AuthorId = book.AuthorId,
                    Price = book.Price,
                    PublishedDate = book.PublishedDate,
                    Title = book.Title,
                };
                var response = await _booksRepository.InsertAsync(books);
                return Ok(ApiResponse<BooksViewModel>.SuccessResponse("add success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<BooksViewModel>.ErrorResponse("add error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

        [HttpPut("update")]
        public async Task<IActionResult> UpdateBook([FromBody] UpdateBooksViewModel book)
        {
            try
            {
                var books = new Books()
                {
                    BookId = book.BookId,
                    AuthorId = book.AuthorId,
                    Price = book.Price,
                    PublishedDate = book.PublishedDate,
                    Title = book.Title,
                };
                var response = await _booksRepository.UpdateAsync(books);
                return Ok(ApiResponse<BooksViewModel>.SuccessResponse("update success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<BooksViewModel>.ErrorResponse("update error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
            try
            {
                var response = await _booksRepository.DeleteAsync(id);
                return Ok(ApiResponse<bool>.SuccessResponse("delete success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<bool>.ErrorResponse("delete error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

        [HttpGet("reports/book")]
        public async Task<IActionResult> GetFilteredBooks([FromQuery] string? searchKey, [FromQuery] int? authorId, [FromQuery] DateTime? fromPublishedDate, [FromQuery] DateTime? toPublishedDate, [FromQuery] int pageSize, [FromQuery] int pageIndex=1)
        {
            try
            {
                var response = await _booksRepository.GetFilteredBooks(searchKey, authorId, fromPublishedDate, toPublishedDate, pageSize, pageIndex);
                return Ok(ApiResponse<IEnumerable<BooksViewModel>>.SuccessResponse("reports/book", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<IEnumerable<BooksViewModel>>.ErrorResponse("reports/book", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

    }

}
