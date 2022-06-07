using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class Food
    {
        [Key]
        public int ID { get; set; }
        public string Menu { get; set; }
    }
}
