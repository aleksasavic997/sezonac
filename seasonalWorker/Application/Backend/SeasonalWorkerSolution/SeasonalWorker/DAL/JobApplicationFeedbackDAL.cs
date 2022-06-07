using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class JobApplicationFeedbackDAL : IJobApplicationFeedbackDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public JobApplicationFeedbackDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }
        public bool AddJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback)
        {
            var application = _applicationDbContext.jobApplicationFeedbacks.Where(jf => jf.JobApplicationID==jobApplicationFeedback.JobApplicationID).FirstOrDefault();
            if (application == null)
            {
                _applicationDbContext.jobApplicationFeedbacks.Add(jobApplicationFeedback);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public bool DeleteJobApplicationFeedback(long id)
        {
            var applicationFeedback = _applicationDbContext.jobApplicationFeedbacks.Where(jf => jf.ID == id).FirstOrDefault();
            if (applicationFeedback != null)
            {
                _applicationDbContext.jobApplicationFeedbacks.Remove(applicationFeedback);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public JobApplicationFeedback GetJobApplicationFeedback(long id)
        {
            var jobApplicationFeedback = _applicationDbContext.jobApplicationFeedbacks.Where(jf => jf.ID == id).FirstOrDefault();
            return jobApplicationFeedback;
        }

        public bool UpdateJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback)
        {
            var oldApplicationFeedback = _applicationDbContext.jobApplicationFeedbacks.Where(jf => jf.ID == jobApplicationFeedback.ID).FirstOrDefault();
            if (oldApplicationFeedback != null)
            {
                oldApplicationFeedback.JobApplicationID = jobApplicationFeedback.JobApplicationID;
                oldApplicationFeedback.Accepted = jobApplicationFeedback.Accepted;
                oldApplicationFeedback.Comment = jobApplicationFeedback.Comment;

                _applicationDbContext.jobApplicationFeedbacks.Update(oldApplicationFeedback);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
