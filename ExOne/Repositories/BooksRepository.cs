using ExOne.Data;
using ExOne.Interfaces;
using ExOne.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ExOne.Viewmodels;
using System.Data;
namespace ExOne.Repositories
{
    public class BooksRepository : IBooksRepository
    {
        private readonly ApplicationDbContext _context;
        public BooksRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<BooksViewModel>> GetAllAsync()
        {
            return await _context.Set<BooksViewModel>().FromSqlRaw("EXEC sp_GetAllBooks").ToListAsync();
        }
        public async Task<BooksViewModel?> GetByIdAsync(int bookId)
        {
            var result = await _context.Set<BooksViewModel>().FromSqlRaw("EXEC sp_GetBookById @BookId", new SqlParameter("@BookId", bookId)).AsNoTracking()
                .ToListAsync();
            return result.FirstOrDefault();
        }
        public async Task<BooksViewModel?> InsertAsync(Books book)
        {
            var newBookIdParam = new SqlParameter("@NewBookId", SqlDbType.Int) { Direction = ParameterDirection.Output };
            await _context.Database.ExecuteSqlRawAsync("EXEC sp_InsertBook @Title, @Price, @AuthorId, @PublishedDate, @NewBookId OUTPUT",
                new SqlParameter("@Title", book.Title),
                new SqlParameter("@Price", book.Price),
                new SqlParameter("@AuthorId", book.AuthorId),
                new SqlParameter("@PublishedDate", book.PublishedDate),
                newBookIdParam);
            return await GetByIdAsync((int)newBookIdParam.Value);
        }
        public async Task<BooksViewModel> UpdateAsync(Books book)
        {
            var updatedBookId = new SqlParameter
            {
                ParameterName = "@UpdatedBookId",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output
            };

            await _context.Database.ExecuteSqlRawAsync(
                "EXEC sp_UpdateBook @BookId, @Title, @Price, @AuthorId, @PublishedDate, @UpdatedBookId OUTPUT",
                new SqlParameter("@BookId", book.BookId),
                new SqlParameter("@Title", book.Title),
                new SqlParameter("@Price", book.Price),
                new SqlParameter("@AuthorId", book.AuthorId),
                new SqlParameter("@PublishedDate", book.PublishedDate),
                updatedBookId
            );
            return await GetByIdAsync((int)updatedBookId.Value);
        }
        public async Task<IEnumerable<BooksViewModel>> GetFilteredBooks(string? searchKey, int? authorId, DateTime? fromPublishedDate, DateTime? toPublishedDate,int pageSize, int pageIndex = 1)
        {
            var parameters = new[]
            {
                new SqlParameter("@searchKey", (object?)searchKey ?? DBNull.Value),
                new SqlParameter("@authorId", (object?)authorId ?? DBNull.Value),
                new SqlParameter("@fromPublishedDate", (object?)fromPublishedDate ?? DBNull.Value),
                new SqlParameter("@toPublishedDate", (object?)toPublishedDate ?? DBNull.Value),
                new SqlParameter("@pageSize", pageSize),
                new SqlParameter("@pageIndex", pageIndex)
            };
            return await _context.Set<BooksViewModel>().FromSqlRaw("EXEC sp_GetFilteredBooks @searchKey, @authorId, @fromPublishedDate, @toPublishedDate, @pageSize, @pageIndex", parameters)
                .AsNoTracking()
                .ToListAsync();
        }
        public async Task<bool> DeleteAsync(int bookId)
        {
            var rowsAffected = new SqlParameter("@RowsAffected", SqlDbType.Int) { Direction = ParameterDirection.Output };
            await _context.Database.ExecuteSqlRawAsync("EXEC sp_DeleteBook @BookId, @RowsAffected OUTPUT",new SqlParameter("@BookId", bookId),rowsAffected);
            return (int)rowsAffected.Value > 0;
        }

        //public async Task<bool> DeleteAsync(int bookId)
        //{
        //    var book = await _context.Books.FindAsync(bookId);
        //    if (book == null) return false;

        //    _context.Books.Remove(book);
        //    await _context.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<IEnumerable<Books>> GetAllAsync()
        //{
        //    return await _context.Books.Include(b => b.Authors).ToListAsync();
        //}

        //public async Task<Books?> GetByIdAsync(int bookId)
        //{
        //    return await _context.Books.Include(b => b.Authors).FirstOrDefaultAsync(b => b.BookId == bookId);
        //}

        //public async Task<IEnumerable<Books>> GetFilteredBooks(string searchKey, int? authorId, DateTime? fromPublishedDate, DateTime? toPublishedDate, int pageSize, int pageIndex = 1)
        //{
        //    var query = _context.Books.Include(b => b.Authors).AsQueryable();

        //    if (!string.IsNullOrEmpty(searchKey))
        //        query = query.Where(b => b.Title.Contains(searchKey));

        //    if (authorId.HasValue)
        //        query = query.Where(b => b.AuthorId == authorId.Value);

        //    if (fromPublishedDate.HasValue)
        //        query = query.Where(b => b.PublishedDate >= fromPublishedDate.Value);

        //    if (toPublishedDate.HasValue)
        //        query = query.Where(b => b.PublishedDate <= toPublishedDate.Value);

        //    return await query.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToListAsync();
        //}

        //public async Task<Books> InsertAsync(Books book)
        //{
        //    _context.Books.AddAsync(book);
        //    await _context.SaveChangesAsync();
        //    return book;
        //}

        //public async Task<Books> UpdateAsync(Books book)
        //{
        //    var existingBook = await _context.Books.FindAsync(book.BookId);
        //    if (existingBook == null) return null;

        //    existingBook.Title = book.Title;
        //    existingBook.Price = book.Price;
        //    existingBook.AuthorId = book.AuthorId;
        //    existingBook.PublishedDate = book.PublishedDate;

        //    await _context.SaveChangesAsync();
        //    return existingBook;
        //}
    }
}
