using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class JobApplicationDAL : IJobApplicationDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public JobApplicationDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }
        public bool AddJobApplication(JobApplication jobApplication)
        {
            var application = _applicationDbContext.jobApplications.Where(j => j.JobAdvertisementID == jobApplication.JobAdvertisementID && jobApplication.WorkerID == j.WorkerID).FirstOrDefault();
            if (application == null)
            {
                _applicationDbContext.jobApplications.Add(jobApplication);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public bool DeleteJobApplication(long id)
        {
            var application = _applicationDbContext.jobApplications.Where(j => j.ID == id).FirstOrDefault();
            if (application != null)
            {
                _applicationDbContext.jobApplications.Remove(application);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public JobApplication GetJobApplication(long id)
        {
            var jobApplication = _applicationDbContext.jobApplications.Where(j => j.ID == id).FirstOrDefault();
            return jobApplication;
        }

        public bool UpdateJobApplication(JobApplication jobApplication)
        {
            var oldApplication = _applicationDbContext.jobApplications.Where(c => c.ID == jobApplication.ID).FirstOrDefault();
            if (oldApplication != null)
            {
                oldApplication.WorkerID = jobApplication.WorkerID;
                oldApplication.JobAdvertisementID = jobApplication.JobAdvertisementID;
                oldApplication.MotivationalLetter = jobApplication.MotivationalLetter;

                _applicationDbContext.jobApplications.Update(oldApplication);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
