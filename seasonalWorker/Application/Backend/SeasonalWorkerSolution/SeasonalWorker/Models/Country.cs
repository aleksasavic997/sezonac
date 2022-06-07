using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class Country
    {
        [Key]
        public int ID { get; set; }
        public string CountryName { get; set; }
    }
}
