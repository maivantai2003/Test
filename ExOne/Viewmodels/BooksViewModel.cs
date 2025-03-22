namespace ExOne.Viewmodels
{
    public class BooksViewModel
    {
        public int BookId { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public DateTime? PublishedDate { get; set; }
        public int AuthorId { get; set; }
        public string AuthorName { get; set; }
        public string Bio { get; set; }
    }
}
