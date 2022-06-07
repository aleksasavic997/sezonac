using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.UI.Interfaces
{
    public interface IJobUI
    {
        List<Job> GetAllJobs();
        Job GetJob(long id);
        bool AddJob(Job job);
        bool UpdateJob(Job job);
        bool DeleteJob(long id);
    }
}
