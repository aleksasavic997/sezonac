using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System.Collections.Generic;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class JobDAL : IJobDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public JobDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public bool AddJob(Job job)
        {
            var checkJob = _applicationDbContext.jobs.Where(j => j.JobName == j.JobName).FirstOrDefault();
            if (checkJob == null)
            {
                _applicationDbContext.jobs.Add(job);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public bool DeleteJob(long id)
        {
            var job = _applicationDbContext.jobs.Where(j => j.ID == id).FirstOrDefault();
            if (job != null)
            {
                _applicationDbContext.jobs.Remove(job);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public List<Job> GetAllJobs()
        {
            return _applicationDbContext.jobs.ToList();
        }

        public Job GetJob(long id)
        {
            var job = _applicationDbContext.jobs.Where(j => j.ID == id).FirstOrDefault();
            return job;
        }

        public bool UpdateJob(Job job)
        {
            var oldJob = _applicationDbContext.jobs.Where(j => j.ID == job.ID).FirstOrDefault();
            if (oldJob != null)
            {
                oldJob.JobName = job.JobName;
                oldJob.JobDescription = job.JobDescription;
                oldJob.CategoryID = job.CategoryID;
                oldJob.AreaOfActivityID = job.AreaOfActivityID;

                _applicationDbContext.jobs.Update(oldJob);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
