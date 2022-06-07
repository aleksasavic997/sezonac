using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class EmployerType
    {
        [Key]
        public int ID { get; set; }
        public string EmployerTypeName { get; set; }
        public string EmployerTypeDescription { get; set; }
    }
}
