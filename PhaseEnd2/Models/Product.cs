using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace PhaseEnd2.Models
{
    public class Product
    {
        public Product()
        {
            this.OrderDetails = new HashSet<OrderDetail>();

        }
        [Key]
        public int ProductID { get; set; }
        [Display(Name = "Product Name")]
        public string Name { get; set; }
        [Display(Name = "Supplier")]



        public decimal UnitPrice { get; set; }
        [Display(Name = "Previous Price")]

        public Nullable<int> UnitInStock { get; set; }
        [Display(Name = "Available?")]
        public Nullable<bool> ProductAvailable { get; set; }
        [Display(Name = "Description")]
        public string ShortDescription { get; set; }
        [Display(Name = "Picture")]
        public string PicturePath { get; set; }
        public string Note { get; set; }


        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

    }
}