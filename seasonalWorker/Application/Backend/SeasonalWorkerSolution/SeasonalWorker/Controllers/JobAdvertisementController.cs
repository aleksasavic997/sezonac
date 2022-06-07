using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SeasonalWorker.Models;
using SeasonalWorker.Models.ViewModels;
using SeasonalWorker.UI.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SeasonalWorker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobAdvertisementController : ControllerBase
    {
        private readonly IJobAdvertisementUI _IJobAdvertisementUI;
        public JobAdvertisementController(IJobAdvertisementUI IJobAdvertisementUI)
        {
            _IJobAdvertisementUI = IJobAdvertisementUI;
        }

        // JobAdvertisement/GetAllJobAdvertisements
        [HttpGet("GetAllJobAdvertisements")]
        public IActionResult GetAllJobAdvertisements()
        {
            var JobAdvertisements = _IJobAdvertisementUI.GetAllJobAdvertisements();
            return Ok(JobAdvertisements);
        }

        // JobAdvertisement/GetJobAdvertisement/5
        [HttpGet("{id}")]
        public IActionResult GetJobAdvertisement(long id)
        {
            var JobAdvertisement = _IJobAdvertisementUI.GetJobAdvertisement(id);
            return Ok(JobAdvertisement);
        }

        [HttpPost("AddJobAdvertisement")]
        public bool Post(JobAdvertisement jobAdvertisement)
        {
            return _IJobAdvertisementUI.AddJobAdvertisement(jobAdvertisement);
        }

        [HttpPut("UpdateJobAdvertisement")]
        public bool Put(JobAdvertisement jobAdvertisement)
        {
            return _IJobAdvertisementUI.UpdateJobAdvertisement(jobAdvertisement);
        }

        [HttpDelete("DeleteJobAdvertisement/{id}")]
        public bool Delete(long id)
        {
            return _IJobAdvertisementUI.DeleteJobAdvertisement(id);
        }

        [Route("getFilteredJobAdvertisements/areaOfActivityID={areaOfActivityID}/cityID={cityID}/desiredStartDate={desiredStartDate}/desiredEndDate={desiredEndDate}/offeredFood={offeredFood}/offeredAccomodation={offeredAccomodation}")]
        [HttpPost]
        public IEnumerable<JobAdvertisementInfo> GetFilteredPosts(int areaOfActivityID,int cityID,DateTime desiredStartDate, DateTime desiredEndDate, bool offeredFood, bool offeredAccomodation)
        {
            //fromFollowers can be 0 or 1, activeChallenge can be 0 or 1, sortByReactions can be 0 or 1

            var advertisements = _IJobAdvertisementUI.GetFilteredJobAdvertisements(areaOfActivityID,cityID,desiredStartDate,desiredEndDate,offeredFood,offeredAccomodation);

            List<JobAdvertisementInfo> listAdvertisementInfo = new List<JobAdvertisementInfo>();

            foreach (var advertisement in advertisements)
            {
                listAdvertisementInfo.Add(new JobAdvertisementInfo(advertisement));
            }

            return listAdvertisementInfo.OrderByDescending(a => a.AdvertisementExpiryDate);
        }

        [HttpGet("getJobAdvertisementByEmployerID/{employerId}")]
        public IEnumerable<JobAdvertisementInfo> GetJobAdvertisementsByUserID(long employerId)
        {
            var advertisements = _IJobAdvertisementUI.GetJobAdvertisementByUserID(employerId);

            List<JobAdvertisementInfo> listAdvertisementInfo = new List<JobAdvertisementInfo>();

            foreach (var advertisement in advertisements)
            {
                listAdvertisementInfo.Add(new JobAdvertisementInfo(advertisement));
            }

            return listAdvertisementInfo.OrderByDescending(a => a.AdvertisementExpiryDate);
        }
    }
}
