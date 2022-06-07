using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobApplicationFeedbackController : ControllerBase
    {
        private readonly IJobApplicationFeedbackUI _IJobApplicationFeedbackUI;
        public JobApplicationFeedbackController(IJobApplicationFeedbackUI JobApplicationFeedbackUI)
        {
            _IJobApplicationFeedbackUI = JobApplicationFeedbackUI;
        }

        // JobApplicationFeedback/GetJobApplicationFeedback/5
        [HttpGet("{id}")]
        public IActionResult GetJobApplicationFeedback(long id)
        {
            var JobApplicationFeedback = _IJobApplicationFeedbackUI.GetJobApplicationFeedback(id);
            return Ok(JobApplicationFeedback);
        }

        [HttpPost("AddJobApplicationFeedback")]
        public bool Post(JobApplicationFeedback JobApplicationFeedback)
        {
            return _IJobApplicationFeedbackUI.AddJobApplicationFeedback(JobApplicationFeedback);
        }

        [HttpPut("UpdateJobApplicationFeedback")]
        public bool Put(JobApplicationFeedback JobApplicationFeedback)
        {
            return _IJobApplicationFeedbackUI.UpdateJobApplicationFeedback(JobApplicationFeedback);
        }

        [HttpDelete("DeleteJobApplicationFeedback/{id}")]
        public bool Delete(long id)
        {
            return _IJobApplicationFeedbackUI.DeleteJobApplicationFeedback(id);
        }
    }
}
