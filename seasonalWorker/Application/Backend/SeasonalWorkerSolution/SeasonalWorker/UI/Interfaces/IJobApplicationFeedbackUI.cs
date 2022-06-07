using SeasonalWorker.Models;

namespace SeasonalWorker.UI.Interfaces
{
    public interface IJobApplicationFeedbackUI
    {
        JobApplicationFeedback GetJobApplicationFeedback(long id);
        bool AddJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback);
        bool UpdateJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback);
        bool DeleteJobApplicationFeedback(long id);
    }
}
