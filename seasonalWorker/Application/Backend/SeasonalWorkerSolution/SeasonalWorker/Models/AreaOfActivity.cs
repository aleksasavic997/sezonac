using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class AreaOfActivity
    {
        [Key]
        public int ID { get; set; }
        public string AreaOfActivityName { get; set; }
    }
}
