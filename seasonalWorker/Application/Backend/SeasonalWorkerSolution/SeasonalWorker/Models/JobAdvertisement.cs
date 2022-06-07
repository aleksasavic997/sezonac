using System;
using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class JobAdvertisement
    {
        [Key]
        public int ID { get; set; }
        public DateTime AdvertisementStartDate { get; set; }
        public DateTime AdvertisementExpiryDate { get; set; }
        public string AdvertisementTitle { get; set; }
        public string AdvertisementDescription { get; set; }
        public bool OfferedAccomodation { get; set; }
        public bool OfferedFood { get; set; }
        public double SalaryFrom { get; set; }
        public double SalaryTo { get; set; }
        public int SeasonalWorkDurationInDays { get; set; }
        public string MethodOfPayment { get; set; }
        public DateTime WorkingStartDate { get; set; }
        public DateTime WorkingEndDate { get; set; }
        public int JobID { get; set; }
        public int EmployerID { get; set; }
        public int CityID { get; set; }
        public Job Job { get; set; }
        public Employer Employer { get; set; }
        public City City { get; set; }
    }
}
