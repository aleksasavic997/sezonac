using SeasonalWorker.Models;

namespace SeasonalWorker.BL.Interfaces
{
    public interface IJobApplicationFeedbackBL
    {
        JobApplicationFeedback GetJobApplicationFeedback(long id);
        bool AddJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback);
        bool UpdateJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback);
        bool DeleteJobApplicationFeedback(long id);
    }
}
