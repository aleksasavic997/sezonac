using System;
using System.ComponentModel.DataAnnotations;

namespace SeasonalWorker.Models
{
    public class Worker
    {
        [Key]
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Pass { get; set; }
        public bool Sex { get; set; }
        public string ProfileImageURL { get; set; }
        public string Email { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string CVURL { get; set; }
        public string CoverLetter { get; set; }
        public string PhoneNumber { get; set; }
        public int CityID { get; set; }
        public City City { get; set; }
    }
}
