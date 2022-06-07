using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.UI
{
    public class JobApplicationUI : IJobApplicationUI
    {
        private readonly IJobApplicationBL _IJobApplicationBL;
        public JobApplicationUI(IJobApplicationBL jobApplicationBL)
        {
            _IJobApplicationBL = jobApplicationBL;
        }
        public bool AddJobApplication(JobApplication jobApplication)
        {
            return _IJobApplicationBL.AddJobApplication(jobApplication);
        }

        public bool DeleteJobApplication(long id)
        {
            return _IJobApplicationBL.DeleteJobApplication(id);
        }

        public JobApplication GetJobApplication(long id)
        {
            return _IJobApplicationBL.GetJobApplication(id);
        }

        public bool UpdateJobApplication(JobApplication jobApplication)
        {
            return _IJobApplicationBL.UpdateJobApplication(jobApplication);
        }
    }
}
