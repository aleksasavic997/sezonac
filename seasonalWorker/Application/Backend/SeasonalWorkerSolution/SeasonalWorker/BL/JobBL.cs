using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.BL
{
    public class JobBL : IJobBL
    {
        private readonly IJobDAL _IJobDAL;
        public JobBL(IJobDAL JobBL)
        {
            _IJobDAL = JobBL;
        }

        public bool AddJob(Job job)
        {
            return _IJobDAL.AddJob(job);
        }

        public bool DeleteJob(long id)
        {
            return _IJobDAL.DeleteJob(id);
        }

        public List<Job> GetAllJobs()
        {
            return _IJobDAL.GetAllJobs();
        }

        public Job GetJob(long id)
        {
            return _IJobDAL.GetJob(id);
        }

        public bool UpdateJob(Job job)
        {
            return _IJobDAL.UpdateJob(job);
        }
    }
}
