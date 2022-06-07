using Microsoft.EntityFrameworkCore;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System.Collections.Generic;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class EmployerDAL : IEmployerDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public EmployerDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public bool AddEmployer(Employer employer)
        {
            var checkEmployer = _applicationDbContext.employers.Where(e => e.EmployerUsername == employer.EmployerUsername).FirstOrDefault();
            if (checkEmployer == null)
            {
                _applicationDbContext.employers.Add(employer);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public Employer CheckEmployer(Login login)
        {
            var employer = _applicationDbContext.employers.Where(e => e.EmployerUsername.Equals(login.Username) && e.EmployerPassword.Equals(login.Password)).FirstOrDefault();
            return employer;
        }

        public bool DeleteEmployer(long id)
        {
            var Employer = _applicationDbContext.employers.Where(e => e.ID == id).FirstOrDefault();
            if (Employer != null)
            {
                _applicationDbContext.employers.Remove(Employer);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public List<Employer> GetAllEmployers()
        {
            return _applicationDbContext.employers.ToList();
        }

        public Employer GetEmployer(long id)
        {
            var Employer = _applicationDbContext.employers.Where(w => w.ID == id).Include(c=>c.City).Include(et=>et.EmployerType).Include(a=>a.AreaOfActivity).FirstOrDefault();
            return Employer;
        }

        public bool UpdateEmployer(Employer employer)
        {
            var oldEmployer = _applicationDbContext.employers.Where(w => w.ID == employer.ID).FirstOrDefault();
            if (oldEmployer != null)
            {
                oldEmployer.EmployerName = employer.EmployerName;
                oldEmployer.EmployerUsername = employer.EmployerUsername;
                oldEmployer.EmployerPassword = employer.EmployerPassword;
                oldEmployer.EmployerDescription = employer.EmployerDescription;
                oldEmployer.ProfileImageURL = employer.ProfileImageURL;
                oldEmployer.Email = employer.Email;
                oldEmployer.PhoneNumber = employer.PhoneNumber;
                oldEmployer.EmployerTypeID = employer.EmployerTypeID;
                oldEmployer.CityID = employer.CityID;
                oldEmployer.AreaOfActivityID = employer.AreaOfActivityID;

                _applicationDbContext.employers.Update(oldEmployer);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
