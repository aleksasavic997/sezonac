using SeasonalWorker.Models;
using System;
using System.Collections.Generic;

namespace SeasonalWorker.DAL.Interfaces
{
    public interface IJobAdvertisementDAL
    {
        List<JobAdvertisement> GetAllJobAdvertisements();
        JobAdvertisement GetJobAdvertisement(long id);
        bool AddJobAdvertisement(JobAdvertisement jobAdvertisement);
        bool UpdateJobAdvertisement(JobAdvertisement jobAdvertisement);
        bool DeleteJobAdvertisement(long id);
        List<JobAdvertisement> GetFilteredJobAdvertisements(int areaOfActivityID, int cityID, DateTime desiredStartDate, DateTime desiredEndDate, bool offeredFood, bool offeredAccomodation);
        List<JobAdvertisement> GetJobAdvertisementByUserID(long employerId);
    }
}
