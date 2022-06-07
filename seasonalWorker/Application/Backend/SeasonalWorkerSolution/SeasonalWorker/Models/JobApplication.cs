using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class JobApplication
    {
        [Key]
        public int ID { get; set; }
        public int JobAdvertisementID { get; set; }
        public int WorkerID { get; set; }
        public string MotivationalLetter { get; set; }
        public JobAdvertisement JobAdvertisement { get; set; }
        public Worker Worker { get; set; }
    }
}
