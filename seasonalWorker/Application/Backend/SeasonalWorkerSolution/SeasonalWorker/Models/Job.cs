using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class Job
    {
        [Key]
        public int ID { get; set; }
        public string JobName { get; set; }
        public string JobDescription { get; set; }
        public int CategoryID { get; set; }
        public int AreaOfActivityID { get; set; }
        public AreaOfActivity AreaOfActivity { get; set; }
        public JobCategory Category { get; set; }
    }
}
