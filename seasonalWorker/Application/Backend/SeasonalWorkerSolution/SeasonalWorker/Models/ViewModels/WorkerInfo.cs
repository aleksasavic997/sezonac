using System;
using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class WorkerInfo
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Pass { get; set; }
        public string Sex { get; set; }
        public string ProfileImageURL { get; set; }
        public string Email { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string CVURL { get; set; }
        public string CoverLetter { get; set; }
        public string PhoneNumber { get; set; }
        public int CityID { get; set; }
        public string CityName { get; set; }
        public string CountryName { get; set; }
        public WorkerInfo(Worker worker,Country country)
        {
            ID = worker.ID;
            FirstName = worker.FirstName;
            LastName = worker.LastName;
            Username = worker.Username;
            Pass = worker.Pass;
            if (worker.Sex)
                Sex = "Muško";
            else
                Sex = "Žensko";
            DateOfBirth = worker.DateOfBirth;
            ProfileImageURL = worker.ProfileImageURL;
            Email = worker.Email;
            CVURL = worker.CVURL;
            CoverLetter = worker.CoverLetter;
            PhoneNumber = worker.PhoneNumber;
            CityID = worker.CityID;
            CityName = worker.City.CityName;
            CountryName = worker.City.Country.CountryName;
        }
    }
}
