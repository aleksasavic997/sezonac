namespace SeasonalWorker.Models.ViewModels
{
    public class EmployerInfo
    {
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
        public string EmployerTypeName { get; set; }
        public string EmployerTypeDescription { get; set; }
        public string CityName { get; set; }
        public string AreaOfActivityName { get; set; }
        public string CountryName { get; set; }

        public EmployerInfo(Employer employer, Country country)
        {
            this.ID = employer.ID;
            this.EmployerName = employer.EmployerName;
            this.EmployerUsername = employer.EmployerUsername;
            this.EmployerPassword = employer.EmployerPassword;
            this.EmployerDescription = employer.EmployerDescription;
            this.ProfileImageURL = employer.ProfileImageURL;
            this.Email = employer.Email;
            this.PhoneNumber = employer.PhoneNumber; 
            this.CityID = employer.CityID;
            this.AreaOfActivityID = employer.AreaOfActivityID;
            this.EmployerTypeID = employer.EmployerTypeID;
            this.CityName = employer.City.CityName;
            this.EmployerTypeName = employer.EmployerType.EmployerTypeName;
            this.EmployerTypeDescription = employer.EmployerType.EmployerTypeDescription;
            this.AreaOfActivityName = employer.AreaOfActivity.AreaOfActivityName;
            this.CountryName = country.CountryName;
        }
    }
}
