using SeasonalWorker.Models;

namespace SeasonalWorker.BL.Interfaces
{
    public interface IJobApplicationBL
    {
        JobApplication GetJobApplication(long id);
        bool AddJobApplication(JobApplication jobApplication);
        bool UpdateJobApplication(JobApplication jobApplication);
        bool DeleteJobApplication(long id);
    }
}
