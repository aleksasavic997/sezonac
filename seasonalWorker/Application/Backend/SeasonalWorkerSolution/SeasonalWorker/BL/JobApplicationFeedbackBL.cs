using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;

namespace SeasonalWorker.BL
{
    public class JobApplicationFeedbackBL : IJobApplicationFeedbackBL
    {
        private readonly IJobApplicationFeedbackDAL _IJobApplicationFeedbackDAL;
        public JobApplicationFeedbackBL(IJobApplicationFeedbackDAL jobApplicationFeedbackDAL)
        {
            _IJobApplicationFeedbackDAL = jobApplicationFeedbackDAL;
        }
        public bool AddJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback)
        {
            return _IJobApplicationFeedbackDAL.AddJobApplicationFeedback(jobApplicationFeedback);
        }

        public bool DeleteJobApplicationFeedback(long id)
        {
            return _IJobApplicationFeedbackDAL.DeleteJobApplicationFeedback(id);
        }

        public JobApplicationFeedback GetJobApplicationFeedback(long id)
        {
            return _IJobApplicationFeedbackDAL.GetJobApplicationFeedback(id);
        }

        public bool UpdateJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback)
        {
            return _IJobApplicationFeedbackDAL.UpdateJobApplicationFeedback(jobApplicationFeedback);
        }
    }
}
