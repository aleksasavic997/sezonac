using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class City
    {
        [Key]
        public int ID { get; set; }
        public string CityName { get; set; }
        public int Zip { get; set; }
        public string County { get; set; }
        public int CountryID { get; set; }
        public Country Country { get; set; }
    }
}
