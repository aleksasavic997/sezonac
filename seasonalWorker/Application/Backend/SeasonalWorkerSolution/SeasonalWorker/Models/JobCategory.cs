using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class JobCategory
    {
        [Key]
        public int ID { get; set; }
        public string JobCategoryName { get; set; }
    }
}
