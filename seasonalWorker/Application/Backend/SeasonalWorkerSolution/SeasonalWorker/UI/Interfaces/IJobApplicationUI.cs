using SeasonalWorker.Models;

namespace SeasonalWorker.UI.Interfaces
{
    public interface IJobApplicationUI
    {
        JobApplication GetJobApplication(long id);
        bool AddJobApplication(JobApplication jobApplication);
        bool UpdateJobApplication(JobApplication jobApplication);
        bool DeleteJobApplication(long id);
    }
}
