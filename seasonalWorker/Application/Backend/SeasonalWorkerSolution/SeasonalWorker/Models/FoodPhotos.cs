using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class FoodPhotos
    {
        [Key]
        public int ID { get; set; }
        public int FoodID { get; set; }
        public string PhotoURL { get; set; }
        public Food Food { get; set; }
    }
}
