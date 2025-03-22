using ExOne.Models;
using ExOne.Viewmodels;
using Microsoft.EntityFrameworkCore;

namespace ExOne.Data
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions options):base(options) { }
        public DbSet<Authors> Authors { get; set; }
        public DbSet<Books> Books { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<BooksViewModel>().HasNoKey();
        }
    }
}
