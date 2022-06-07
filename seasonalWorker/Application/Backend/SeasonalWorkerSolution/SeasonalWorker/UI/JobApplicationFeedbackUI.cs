using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.UI
{
    public class JobApplicationFeedbackUI : IJobApplicationFeedbackUI
    {
        private readonly IJobApplicationFeedbackBL _IJobApplicationFeedbackBL;
        public JobApplicationFeedbackUI(IJobApplicationFeedbackBL jobApplicationFeedbackBL)
        {
            _IJobApplicationFeedbackBL = jobApplicationFeedbackBL;
        }
        public bool AddJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback)
        {
            return _IJobApplicationFeedbackBL.AddJobApplicationFeedback(jobApplicationFeedback);
        }

        public bool DeleteJobApplicationFeedback(long id)
        {
            return _IJobApplicationFeedbackBL.DeleteJobApplicationFeedback(id);
        }

        public JobApplicationFeedback GetJobApplicationFeedback(long id)
        {
            return _IJobApplicationFeedbackBL.GetJobApplicationFeedback(id);
        }

        public bool UpdateJobApplicationFeedback(JobApplicationFeedback jobApplicationFeedback)
        {
            return _IJobApplicationFeedbackBL.UpdateJobApplicationFeedback(jobApplicationFeedback);
        }
    }
}
