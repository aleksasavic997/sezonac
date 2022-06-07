using System;

namespace SeasonalWorker.Models.ViewModels
{
    public class JobAdvertisementInfo
    {
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
        public string JobName { get; set; }
        public string JobDescription { get; set; }
        public string CityName { get; set; }
        public string EmployerName { get; set; }
        public string EmployerDescription { get; set; }
        public string EmployerEmail { get; set; }
        public string EmployerPhoneNumber { get; set; }

        public JobAdvertisementInfo(JobAdvertisement jobAdvertisement)
        {
            this.ID = jobAdvertisement.ID;
            this.AdvertisementStartDate = jobAdvertisement.AdvertisementStartDate;
            this.AdvertisementExpiryDate = jobAdvertisement.AdvertisementExpiryDate;
            this.AdvertisementTitle = jobAdvertisement.AdvertisementTitle;
            this.AdvertisementDescription = jobAdvertisement.AdvertisementDescription;
            this.OfferedAccomodation = jobAdvertisement.OfferedAccomodation;
            this.OfferedFood = jobAdvertisement.OfferedFood;
            this.SalaryFrom = jobAdvertisement.SalaryFrom;
            this.SalaryTo = jobAdvertisement.SalaryTo;
            this.SeasonalWorkDurationInDays = jobAdvertisement.SeasonalWorkDurationInDays;
            this.MethodOfPayment = jobAdvertisement.MethodOfPayment;
            this.WorkingStartDate = jobAdvertisement.WorkingStartDate;
            this.WorkingEndDate = jobAdvertisement.WorkingEndDate;
            this.JobID = jobAdvertisement.JobID;
            this.EmployerID = jobAdvertisement.EmployerID;
            this.CityID = jobAdvertisement.CityID;
            this.JobName = jobAdvertisement.Job.JobName;
            this.JobDescription = jobAdvertisement.Job.JobDescription;
            this.CityName = jobAdvertisement.City.CityName;
            this.EmployerName = jobAdvertisement.Employer.EmployerName;
            this.EmployerDescription = jobAdvertisement.Employer.EmployerDescription;
            this.EmployerEmail = jobAdvertisement.Employer.Email;
            this.EmployerPhoneNumber = jobAdvertisement.Employer.PhoneNumber;
        }
    }
}
