using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;
using System.Collections.Generic;

namespace SeasonalWorker.UI
{
    public class JobUI : IJobUI
    {
        private readonly IJobBL _IJobBL;
        public JobUI(IJobBL JobBL)
        {
            _IJobBL = JobBL;
        }

        public bool AddJob(Job job)
        {
            return _IJobBL.AddJob(job);
        }

        public bool DeleteJob(long id)
        {
            return _IJobBL.DeleteJob(id);
        }

        public List<Job> GetAllJobs()
        {
            return _IJobBL.GetAllJobs();
        }

        public Job GetJob(long id)
        {
            return _IJobBL.GetJob(id);
        }

        public bool UpdateJob(Job job)
        {
            return _IJobBL.UpdateJob(job);
        }
    }
}
