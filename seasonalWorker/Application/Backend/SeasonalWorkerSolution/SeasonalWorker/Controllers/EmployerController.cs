using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.Models;
using SeasonalWorker.Models.ViewModels;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployerController : ControllerBase
    {
        private readonly IEmployerUI _IEmployerUI;
        private readonly ICountryUI _ICountryUI;
        public EmployerController(IEmployerUI IEmployerUI, ICountryUI ICountryUI)
        {
            _IEmployerUI = IEmployerUI;
            _ICountryUI = ICountryUI;
        }

        // Employer/GetAllEmployers
        [HttpGet("GetAllEmployers")]
        public IActionResult GetAllEmployers()
        {
            var Employers = _IEmployerUI.GetAllEmployers();
            return Ok(Employers);
        }

        // Employer/GetEmployer/5
        [HttpGet("{id}")]
        public ActionResult<EmployerInfo> GetEmployer(long id)
        {
            Employer employer = _IEmployerUI.GetEmployer(id);
            Country country = _ICountryUI.GetCountry(employer.City.CountryID);
            if (employer == null && country!=null)
            {
                return NotFound();
            }
            return new EmployerInfo(employer,country);
        }

        [HttpPost("AddEmployer")]
        public bool Post(Employer Employer)
        {
            return _IEmployerUI.AddEmployer(Employer);
        }

        [HttpPut("UpdateEmployer")]
        public bool Put(Employer Employer)
        {
            return _IEmployerUI.UpdateEmployer(Employer);
        }

        [HttpDelete("DeleteEmployer/{id}")]
        public bool Delete(long id)
        {
             return _IEmployerUI.DeleteEmployer(id);
        }

        [Route("login")]
        [HttpPost]
        public IActionResult Login(Login login)
        {
            IActionResult response = Unauthorized();

            var Employer = _IEmployerUI.CheckEmployer(login);

            if (Employer != null)
            {
                response = Ok(Employer);
            }
            return response;
        }
    }
}
