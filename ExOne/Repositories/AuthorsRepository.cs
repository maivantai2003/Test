using ExOne.Data;
using ExOne.Interfaces;
using ExOne.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace ExOne.Repositories
{
    public class AuthorsRepository : IAuthorsRepository
    {
        private readonly ApplicationDbContext _context;
        public AuthorsRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<bool> DeleteAsync(int authorId)
        {
            var rowsAffected = await _context.Database.ExecuteSqlRawAsync(
                   "EXEC sp_DeleteAuthor @AuthorId",
                   new SqlParameter("@AuthorId", authorId));

            return rowsAffected > 0;
        }

        public async Task<IEnumerable<Authors>> GetAllAsync()
        {
            return await _context.Authors.FromSqlRaw("EXEC sp_GetAllAuthors").ToListAsync();
        }

        public async Task<Authors?> GetByIdAsync(int authorId)
        {
            var author = await _context.Authors
               .FromSqlRaw("EXEC sp_GetAuthorById @AuthorId",new SqlParameter("@AuthorId", authorId)).ToListAsync();
            return author.FirstOrDefault();
        }

        public async Task<Authors> InsertAsync(Authors author)
        {
           var result=await _context.Authors.FromSqlRaw("EXEC sp_InsertAuthor @Name, @Bio", new SqlParameter("@Name", author.Name),new SqlParameter("@Bio", author.Bio ?? (object)DBNull.Value)).ToListAsync();
            return result.FirstOrDefault();
        }
        public async Task<Authors> UpdateAsync(Authors author)
        {
            var result = await _context.Authors.FromSqlRaw("EXEC sp_UpdateAuthor @AuthorId, @Name, @Bio",new SqlParameter("@AuthorId", author.AuthorId),
                    new SqlParameter("@Name", author.Name),
                    new SqlParameter("@Bio", author.Bio ?? (object)DBNull.Value))
                .ToListAsync();
            return result.FirstOrDefault();
        }
    }
    /////
}
