using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobApplicationController : ControllerBase
    {
        private readonly IJobApplicationUI _IJobApplicationUI;
        public JobApplicationController(IJobApplicationUI jobApplicationUI)
        {
            _IJobApplicationUI = jobApplicationUI;
        }

        // JobApplication/GetJobApplication/5
        [HttpGet("{id}")]
        public IActionResult GetJobApplication(long id)
        {
            var JobApplication = _IJobApplicationUI.GetJobApplication(id);
            return Ok(JobApplication);
        }

        [HttpPost("AddJobApplication")]
        public bool Post(JobApplication jobApplication)
        {
            return _IJobApplicationUI.AddJobApplication(jobApplication);
        }

        [HttpPut("UpdateJobApplication")]
        public bool Put(JobApplication jobApplication)
        {
            return _IJobApplicationUI.UpdateJobApplication(jobApplication);
        }

        [HttpDelete("DeleteJobApplication/{id}")]
        public bool Delete(long id)
        {
            return _IJobApplicationUI.DeleteJobApplication(id);
        }
    }
}
