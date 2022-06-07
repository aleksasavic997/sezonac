using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : ControllerBase
    {
        private readonly IJobUI _IJobUI;

        public JobController(IJobUI iJobUI)
        {
            _IJobUI = iJobUI;
        }

        // Job/GetAllJobs
        [HttpGet("GetAllJobs")]
        public IActionResult GetAllJobs()
        {
            var Jobs = _IJobUI.GetAllJobs();
            return Ok(Jobs);
        }

        // Job/GetJob/5
        [HttpGet("{id}")]
        public IActionResult GetJob(long id)
        {
            var Job = _IJobUI.GetJob(id);
            return Ok(Job);
        }

        [HttpPost("AddJob")]
        public bool Post(Job job)
        {
            return _IJobUI.AddJob(job);
        }

        [HttpPut("UpdateJob")]
        public bool Put(Job job)
        {
            return _IJobUI.UpdateJob(job);
        }

        [HttpDelete("DeleteJob/{id}")]
        public bool Delete(long id)
        {
            return _IJobUI.DeleteJob(id);
        }
    }
}
