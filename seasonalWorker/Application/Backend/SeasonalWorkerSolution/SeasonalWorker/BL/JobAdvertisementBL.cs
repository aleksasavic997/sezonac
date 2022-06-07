using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;
using System;
using System.Collections.Generic;

namespace SeasonalWorker.BL
{
    public class JobAdvertisementBL : IJobAdvertisementBL
    {
        private readonly IJobAdvertisementDAL _IJobAdvertisementDAL;
        public JobAdvertisementBL(IJobAdvertisementDAL JobAdvertisementDAL)
        {
            _IJobAdvertisementDAL = JobAdvertisementDAL;
        }

        public bool AddJobAdvertisement(JobAdvertisement jobAdvertisement)
        {
            return _IJobAdvertisementDAL.AddJobAdvertisement(jobAdvertisement);
        }

        public bool DeleteJobAdvertisement(long id)
        {
            return _IJobAdvertisementDAL.DeleteJobAdvertisement(id);
        }

        public List<JobAdvertisement> GetAllJobAdvertisements()
        {
            return _IJobAdvertisementDAL.GetAllJobAdvertisements();
        }

        public List<JobAdvertisement> GetFilteredJobAdvertisements(int areaOfActivityID, int cityID, DateTime desiredStartDate, DateTime desiredEndDate, bool offeredFood, bool offeredAccomodation)
        {
            return _IJobAdvertisementDAL.GetFilteredJobAdvertisements(areaOfActivityID, cityID, desiredStartDate, desiredEndDate, offeredFood, offeredAccomodation);
        }

        public JobAdvertisement GetJobAdvertisement(long id)
        {
            return _IJobAdvertisementDAL.GetJobAdvertisement(id);
        }

        public List<JobAdvertisement> GetJobAdvertisementByUserID(long employerId)
        {
            return _IJobAdvertisementDAL.GetJobAdvertisementByUserID(employerId);
        }

        public bool UpdateJobAdvertisement(JobAdvertisement jobAdvertisement)
        {
            return _IJobAdvertisementDAL.UpdateJobAdvertisement(jobAdvertisement);
        }
    }
}
