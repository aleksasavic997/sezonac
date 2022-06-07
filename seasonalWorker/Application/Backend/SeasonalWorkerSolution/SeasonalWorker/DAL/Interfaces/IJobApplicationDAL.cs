using SeasonalWorker.Models;

namespace SeasonalWorker.DAL.Interfaces
{
    public interface IJobApplicationDAL
    {
        JobApplication GetJobApplication(long id);
        bool AddJobApplication(JobApplication jobApplication);
        bool UpdateJobApplication(JobApplication jobApplication);
        bool DeleteJobApplication(long id);
    }
}
