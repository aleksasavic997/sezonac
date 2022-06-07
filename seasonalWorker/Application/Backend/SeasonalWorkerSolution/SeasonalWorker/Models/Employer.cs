using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class Employer
    {
        [Key]
        public int ID { get; set; }
        public string EmployerName { get; set; }
        public string EmployerUsername { get; set; }
        public string EmployerPassword { get; set; }
        public string EmployerDescription { get; set; }
        public string ProfileImageURL { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public int EmployerTypeID { get; set; }
        public int CityID { get; set; }
        public int AreaOfActivityID { get; set; }
        public EmployerType EmployerType { get; set; }
        public City City { get; set; }
        public AreaOfActivity AreaOfActivity { get; set; }
    }
}
