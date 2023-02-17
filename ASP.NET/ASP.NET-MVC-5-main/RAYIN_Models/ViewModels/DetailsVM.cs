using Microsoft.EntityFrameworkCore;

namespace RAYIN_Models.ViewModels
{
    public class DetailsVM
    {
        public DetailsVM()
        {
            Product product = new Product();
        }
        public Product Product { get; set; }
        public bool ExistsInCart { get; set; }
       
    }
}
