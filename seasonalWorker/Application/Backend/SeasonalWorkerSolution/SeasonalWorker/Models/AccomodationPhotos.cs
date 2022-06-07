using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class AccomodationPhotos
    {
        [Key]
        public int ID { get; set; }
        public int AccomodationID { get; set; }
        public string PhotoURL { get; set; }
        public Accomodation Accomodation { get; set; }
    }
}
