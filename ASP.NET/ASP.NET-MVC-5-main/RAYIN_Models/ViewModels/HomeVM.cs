using System.Collections.Generic;

namespace RAYIN_Models.ViewModels
{
    public class HomeVM
    {
        public IEnumerable<Category> Categories {get; set;}
        public IEnumerable<Product> Products { get; set;}   
    }
}
