using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class Accomodation
    {
        [Key]
        public int ID { get; set; }
        public string AccomodationDescription { get; set; }
    }
}
