using SeasonalWorker.Models;

namespace SeasonalWorker.DAL.Interfaces
{
    public interface IJobApplicationFeedbackDAL
    {
        JobApplicationFeedback GetJobApplicationFeedback(long id);
        bool AddJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback);
        bool UpdateJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback);
        bool DeleteJobApplicationFeedback(long id);
    }
}
