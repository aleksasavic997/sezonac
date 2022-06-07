using Microsoft.EntityFrameworkCore;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class JobAdvertisementDAL : IJobAdvertisementDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public JobAdvertisementDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public bool AddJobAdvertisement(JobAdvertisement jobAdvertisement)
        {
            var checkJobAdvertisement = _applicationDbContext.jobAdvertisements.Where(j => j.AdvertisementTitle == jobAdvertisement.AdvertisementTitle && j.AdvertisementStartDate==jobAdvertisement.AdvertisementStartDate && j.AdvertisementExpiryDate==jobAdvertisement.AdvertisementExpiryDate).FirstOrDefault();
            if (checkJobAdvertisement == null)
            {
                _applicationDbContext.jobAdvertisements.Add(jobAdvertisement);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public bool DeleteJobAdvertisement(long id)
        {
            var jobAdvertisement = _applicationDbContext.jobAdvertisements.Where(j => j.ID == id).FirstOrDefault();
            if (jobAdvertisement != null)
            {
                _applicationDbContext.jobAdvertisements.Remove(jobAdvertisement);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public List<JobAdvertisement> GetAllJobAdvertisements()
        {
            return _applicationDbContext.jobAdvertisements.ToList();
        }

        public List<JobAdvertisement> GetFilteredJobAdvertisements(int areaOfActivityID, int cityID, DateTime desiredStartDate, DateTime desiredEndDate, bool offeredFood, bool offeredAccomodation)
        {
            if (areaOfActivityID == 0)
            {
                if (cityID == 0) 
                {
                    return _applicationDbContext.jobAdvertisements.Where(ja=>ja.WorkingStartDate>=desiredStartDate && ja.WorkingEndDate<=desiredEndDate && ja.OfferedAccomodation == offeredAccomodation && ja.OfferedFood==offeredFood).Include(j=>j.Job).Include(c=>c.City).Include(e=>e.Employer).ToList();
                }
                else
                {
                    return _applicationDbContext.jobAdvertisements.Where(ja => ja.CityID==cityID && ja.WorkingStartDate >= desiredStartDate && ja.WorkingEndDate <= desiredEndDate && ja.OfferedAccomodation == offeredAccomodation && ja.OfferedFood == offeredFood).Include(j => j.Job).Include(c => c.City).Include(e => e.Employer).ToList();
                }
            }
            else
            {
                if (cityID == 0)
                {
                    return _applicationDbContext.jobAdvertisements.Where(ja => ja.Employer.AreaOfActivityID==areaOfActivityID && ja.WorkingStartDate >= desiredStartDate && ja.WorkingEndDate <= desiredEndDate && ja.OfferedAccomodation == offeredAccomodation && ja.OfferedFood == offeredFood).Include(j => j.Job).Include(c => c.City).Include(e => e.Employer).ToList();
                }
                else
                {
                    return _applicationDbContext.jobAdvertisements.Where(ja => ja.Employer.AreaOfActivityID==areaOfActivityID && ja.CityID == cityID && ja.WorkingStartDate >= desiredStartDate && ja.WorkingEndDate <= desiredEndDate && ja.OfferedAccomodation == offeredAccomodation && ja.OfferedFood == offeredFood).Include(j => j.Job).Include(c => c.City).Include(e => e.Employer).ToList();
                }
            }
        }

        public JobAdvertisement GetJobAdvertisement(long id)
        {
            var jobAdvertisement = _applicationDbContext.jobAdvertisements.Where(j => j.ID == id).FirstOrDefault();
            return jobAdvertisement;
        }

        public List<JobAdvertisement> GetJobAdvertisementByUserID(long employerId)
        {
            var jobAdvertisements = _applicationDbContext.jobAdvertisements.Where(j => j.EmployerID == employerId).Include(j=>j.Job).Include(e=>e.Employer).Include(c=>c.City).ToList();
            return jobAdvertisements;
        }

        public bool UpdateJobAdvertisement(JobAdvertisement jobAdvertisement)
        {
            var oldJobAdvertisement = _applicationDbContext.jobAdvertisements.Where(j => j.ID == jobAdvertisement.ID).FirstOrDefault();
            if (oldJobAdvertisement != null)
            {
                oldJobAdvertisement.JobID = jobAdvertisement.JobID;
                oldJobAdvertisement.EmployerID = jobAdvertisement.EmployerID;
                oldJobAdvertisement.AdvertisementStartDate = jobAdvertisement.AdvertisementStartDate;
                oldJobAdvertisement.AdvertisementExpiryDate = jobAdvertisement.AdvertisementExpiryDate;
                oldJobAdvertisement.AdvertisementTitle = jobAdvertisement.AdvertisementTitle;
                oldJobAdvertisement.AdvertisementDescription = jobAdvertisement.AdvertisementDescription;
                oldJobAdvertisement.OfferedAccomodation = jobAdvertisement.OfferedAccomodation;
                oldJobAdvertisement.OfferedFood = jobAdvertisement.OfferedFood;
                oldJobAdvertisement.SalaryFrom = jobAdvertisement.SalaryFrom;
                oldJobAdvertisement.SalaryTo = jobAdvertisement.SalaryTo;
                oldJobAdvertisement.SeasonalWorkDurationInDays = jobAdvertisement.SeasonalWorkDurationInDays;
                oldJobAdvertisement.MethodOfPayment = jobAdvertisement.MethodOfPayment;
                oldJobAdvertisement.WorkingStartDate = jobAdvertisement.WorkingStartDate;
                oldJobAdvertisement.WorkingEndDate = jobAdvertisement.WorkingEndDate;
                oldJobAdvertisement.CityID = jobAdvertisement.CityID;
                oldJobAdvertisement.MethodOfPayment = jobAdvertisement.MethodOfPayment;

                _applicationDbContext.jobAdvertisements.Update(oldJobAdvertisement);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
