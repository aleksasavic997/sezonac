using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SeasonalWorker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WorkerController : ControllerBase
    {
        private readonly IWorkerUI _IWorkerUI;
        private readonly ICountryUI _ICountryUI;

        public WorkerController(IWorkerUI IWorkerUI, ICountryUI ICountryUI)
        {
            _IWorkerUI = IWorkerUI;
            _ICountryUI = ICountryUI;
        }

        // Worker/GetAllWorkers
        [HttpGet("GetAllWorkers")]
        public IActionResult GetAllWorkers()
        {
            var workers = _IWorkerUI.GetAllWorkers();
            return Ok(workers);
        }

        // Worker/GetWorker/5
        [HttpGet("{id}")]
        public ActionResult<WorkerInfo> GetWorker(long id)
        {
            var worker = _IWorkerUI.GetWorker(id);
            var country = _ICountryUI.GetCountry(worker.City.CountryID);

            if (worker == null || country == null)
            {
                return NotFound();
            }
            return new WorkerInfo(worker, country);
        }

        [HttpPost("AddWorker")]
        public bool Post(Worker worker)
        {
            return _IWorkerUI.AddWorker(worker);
        }

        [HttpPut("UpdateWorker")]
        public bool Put(Worker worker)
        {
            return _IWorkerUI.UpdateWorker(worker);
        }

        [HttpDelete("DeleteWorker/{id}")]
        public bool Delete(long id)
        {
            return _IWorkerUI.DeleteWorker(id);
        }

        [Route("login")]
        [HttpPost]
        public IActionResult Login(Login login)
        {
            IActionResult response = Unauthorized();

            var worker = _IWorkerUI.CheckWorker(login);

            if (worker != null)
            {
                response = Ok(worker);
            }
            return response;
        }
    }
}
