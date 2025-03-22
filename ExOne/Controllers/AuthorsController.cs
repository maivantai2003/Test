using ExOne.Common;
using ExOne.Interfaces;
using ExOne.Models;
using ExOne.Repositories;
using ExOne.Viewmodels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.WebSockets;

namespace ExOne.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorsController : ControllerBase
    {
        private readonly IAuthorsRepository _authorRepository;

        public AuthorsController(IAuthorsRepository authorRepository)
        {
            _authorRepository = authorRepository;
        }

        [HttpGet("fetch")]
        public async Task<IActionResult> GetAllAuthors()
        {
            try
            {
                var response = await _authorRepository.GetAllAsync();
                return Ok(ApiResponse<IEnumerable<Authors>>.SuccessResponse("fetch success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<IEnumerable<Authors>>.ErrorResponse("fetch error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

        [HttpGet("fetch/{id}")]
        public async Task<IActionResult> GetAuthorById(int id)
        {
            try
            {
                var response = await _authorRepository.GetByIdAsync(id);
                if (response == null) {
                    return Ok(ApiResponse<Authors>.ErrorResponse("not found", new List<string>()
                {
                    "not found"
                }));
                }
                return Ok(ApiResponse<Authors>.SuccessResponse("fetch by id success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<Authors>.ErrorResponse("fetch by id success", new List<string>()
                {
                    ex.Message,
                }));
            }
        }
        [HttpPost("insert")]
        public async Task<IActionResult> InsertAuthor([FromBody] AddAuthorsViewmodel author)
        {
            try
            {
                var authors = new Authors()
                {
                    Bio = author.Bio,
                    Name = author.Name,
                };
                var response = await _authorRepository.InsertAsync(authors);
                return Ok(ApiResponse<Authors>.SuccessResponse("add success",response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<Authors>.ErrorResponse("add error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }
        [HttpPut("update")]
        public async Task<IActionResult> UpdateAuthor([FromBody] UpdateAuthorsViewmodel author)
        {
            try
            {
                var authors = new Authors()
                {
                    AuthorId = author.AuthorId,
                    Bio = author.Bio,
                    Name = author.Name,
                };
                var response = await _authorRepository.UpdateAsync(authors);
                return Ok(ApiResponse<Authors>.SuccessResponse("update success", response));
            }
            catch (Exception ex)
            {
                return Ok(ApiResponse<Authors>.ErrorResponse("update error", new List<string>()
                {
                    ex.Message,
                }));
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAuthor(int id)
        {
            try
            {
                var response = await _authorRepository.DeleteAsync(id);
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

    }
}
