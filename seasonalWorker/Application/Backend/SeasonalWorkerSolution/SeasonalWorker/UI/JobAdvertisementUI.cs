using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;
using System;
using System.Collections.Generic;

namespace SeasonalWorker.UI
{
    public class JobAdvertisementUI : IJobAdvertisementUI
    {
        private readonly IJobAdvertisementBL _IJobAdvertisementBL;

        public JobAdvertisementUI(IJobAdvertisementBL JobAdvertisementBL)
        {
            _IJobAdvertisementBL = JobAdvertisementBL;
        }

        public bool AddJobAdvertisement(JobAdvertisement jobAdvertisement)
        {
            return _IJobAdvertisementBL.AddJobAdvertisement(jobAdvertisement);
        }

        public bool DeleteJobAdvertisement(long id)
        {
            return _IJobAdvertisementBL.DeleteJobAdvertisement(id);
        }

        public List<JobAdvertisement> GetAllJobAdvertisements()
        {
            return _IJobAdvertisementBL.GetAllJobAdvertisements();
        }

        public List<JobAdvertisement> GetFilteredJobAdvertisements(int areaOfActivityID, int cityID, DateTime desiredStartDate, DateTime desiredEndDate, bool offeredFood, bool offeredAccomodation)
        {
            return _IJobAdvertisementBL.GetFilteredJobAdvertisements(areaOfActivityID, cityID, desiredStartDate, desiredEndDate, offeredFood, offeredAccomodation);
        }

        public JobAdvertisement GetJobAdvertisement(long id)
        {
            return _IJobAdvertisementBL.GetJobAdvertisement(id);
        }

        public List<JobAdvertisement> GetJobAdvertisementByUserID(long employerId)
        {
            return _IJobAdvertisementBL.GetJobAdvertisementByUserID(employerId);
        }

        public bool UpdateJobAdvertisement(JobAdvertisement jobAdvertisement)
        {
            return _IJobAdvertisementBL.UpdateJobAdvertisement(jobAdvertisement);
        }
    }
}
