using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;

namespace SeasonalWorker.BL
{
    public class JobApplicationBL : IJobApplicationBL
    {
        private readonly IJobApplicationDAL _IJobApplicationDAL;
        public JobApplicationBL(IJobApplicationDAL jobApplicationDAL)
        {
            _IJobApplicationDAL = jobApplicationDAL;
        }
        public bool AddJobApplication(JobApplication jobApplication)
        {
            return _IJobApplicationDAL.AddJobApplication(jobApplication);
        }

        public bool DeleteJobApplication(long id)
        {
            return _IJobApplicationDAL.DeleteJobApplication(id);
        }

        public JobApplication GetJobApplication(long id)
        {
            return _IJobApplicationDAL.GetJobApplication(id);
        }

        public bool UpdateJobApplication(JobApplication jobApplication)
        {
            return _IJobApplicationDAL.UpdateJobApplication(jobApplication);
        }
    }
}
