using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class JobApplicationFeedback
    {
        [Key]
        public int ID { get; set; }
        public bool Accepted { get; set; }
        public string Comment { get; set; }
        public int JobApplicationID { get; set; }
        public JobApplication JobApplication { get; set; }
    }
}
