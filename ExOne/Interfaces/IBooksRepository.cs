using ExOne.Models;
using ExOne.Viewmodels;

namespace ExOne.Interfaces
{
    public interface IBooksRepository
    {
        Task<IEnumerable<BooksViewModel>> GetAllAsync();
        Task<BooksViewModel?> GetByIdAsync(int bookId);
        Task<BooksViewModel> InsertAsync(Books book);
        Task<BooksViewModel> UpdateAsync(Books book);
        Task<bool> DeleteAsync(int bookId);
        Task<IEnumerable<BooksViewModel>> GetFilteredBooks(string searchKey, int? authorId, DateTime? fromPublishedDate, DateTime? toPublishedDate, int pageSize, int pageIndex=1);
    }
}
