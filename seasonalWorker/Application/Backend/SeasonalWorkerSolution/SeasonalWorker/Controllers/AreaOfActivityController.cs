using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AreaOfActivityController : ControllerBase
    {
        private readonly IAreaOfActivityUI _IAreaOfActivityUI;

        public AreaOfActivityController(IAreaOfActivityUI iAreaOfActivityUI)
        {
            _IAreaOfActivityUI = iAreaOfActivityUI;
        }

        // AreaOfActivity/GetAllAreaOfActivitys
        [HttpGet("GetAllAreaOfActivities")]
        public IActionResult GetAllAreaOfActivities()
        {
            var areaOfActivities = _IAreaOfActivityUI.GetAllAreaOfActivities();
            return Ok(areaOfActivities);
        }

        // AreaOfActivity/GetAreaOfActivity/5
        [HttpGet("{id}")]
        public IActionResult GetAreaOfActivity(long id)
        {
            var areaOfActivity = _IAreaOfActivityUI.GetAreaOfActivity(id);

            if (areaOfActivity == null)
            {
                return NotFound();
            }
            return Ok(areaOfActivity);
        }

        [HttpPost("AddAreaOfActivity")]
        public IActionResult Post(AreaOfActivity areaOfActivity)
        {
            bool isAreaOfActivityAdded = _IAreaOfActivityUI.AddAreaOfActivity(areaOfActivity);
            if (isAreaOfActivityAdded)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpPut("UpdateAreaOfActivity")]
        public IActionResult Put(AreaOfActivity areaOfActivity)
        {
            bool isAreaOfActivityUpdated = _IAreaOfActivityUI.UpdateAreaOfActivity(areaOfActivity);
            if (isAreaOfActivityUpdated)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpDelete("DeleteAreaOfActivity/{id}")]
        public IActionResult Delete(long id)
        {
            bool result = _IAreaOfActivityUI.DeleteAreaOfActivity(id);
            if (result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }

        }
    }
}
