using Microsoft.AspNetCore.Mvc;
using SeasonalCity.UI.Interfaces;
using SeasonalWorker.Models;

namespace SeasonalCity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly ICityUI _ICityUI;

        public CityController(ICityUI ICityUI)
        {
            _ICityUI = ICityUI;
        }

        // City/GetAllCities
        [HttpGet("GetAllCities")]
        public IActionResult GetAllCities()
        {
            var Citys = _ICityUI.GetAllCities();
            return Ok(Citys);
        }

        // City/GetCity/5
        [HttpGet("{id}")]
        public IActionResult GetCity(long id)
        {
            var City = _ICityUI.GetCity(id);
            return Ok(City);
        }

        [HttpPost("AddCity")]
        public bool Post(City City)
        {
            return _ICityUI.AddCity(City);
        }

        [HttpPut("UpdateCity")]
        public bool Put(City City)
        {
            return _ICityUI.UpdateCity(City);
        }

        [HttpDelete("DeleteCity/{id}")]
        public bool Delete(long id)
        {
            return _ICityUI.DeleteCity(id);
        }
    }
}
