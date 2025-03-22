using ExOne.Models;

namespace ExOne.Interfaces
{
    public interface IAuthorsRepository
    {
        Task<IEnumerable<Authors>> GetAllAsync();
        Task<Authors?> GetByIdAsync(int authorId);
        Task<Authors> InsertAsync(Authors author);
        Task<Authors> UpdateAsync(Authors author);
        Task<bool> DeleteAsync(int authorId);
    }
}
