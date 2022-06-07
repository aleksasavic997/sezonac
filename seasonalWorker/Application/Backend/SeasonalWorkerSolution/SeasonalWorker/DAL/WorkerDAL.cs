using Microsoft.EntityFrameworkCore;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SeasonalWorker.DAL
{
    public class WorkerDAL : IWorkerDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public WorkerDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public bool AddWorker(Worker worker)
        {
            var checkWorker = _applicationDbContext.workers.Where(w => w.Username == worker.Username).FirstOrDefault();
            if (checkWorker == null)
            {
                _applicationDbContext.workers.Add(worker);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public Worker CheckWorker(Login login)
        {
            var worker = _applicationDbContext.workers.Where(w => w.Username.Equals(login.Username) && w.Pass.Equals(login.Password)).FirstOrDefault();
            return worker;
        }

        public bool DeleteWorker(long id)
        {
            var worker = _applicationDbContext.workers.Where(w => w.ID == id).FirstOrDefault();
            if (worker != null)
            {
                _applicationDbContext.workers.Remove(worker);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public List<Worker> GetAllWorkers()
        {
            return _applicationDbContext.workers.ToList();
        }

        public Worker GetWorker(long id)
        {
            var worker = _applicationDbContext.workers.Where(w => w.ID == id).Include(c=>c.City).FirstOrDefault();
            return worker;
        }

        public bool UpdateWorker(Worker worker)
        {
            var oldWorker = _applicationDbContext.workers.Where(w => w.ID == worker.ID).FirstOrDefault();
            if (oldWorker != null)
            {
                oldWorker.FirstName = worker.FirstName;
                oldWorker.LastName = worker.LastName;
                oldWorker.Username = worker.Username;
                oldWorker.Pass = worker.Pass;
                oldWorker.Sex = worker.Sex;
                oldWorker.ProfileImageURL = worker.ProfileImageURL;
                oldWorker.Email = worker.Email;
                oldWorker.DateOfBirth = worker.DateOfBirth;
                oldWorker.CVURL = worker.CVURL;
                oldWorker.CoverLetter = worker.CoverLetter;
                oldWorker.PhoneNumber = worker.PhoneNumber;
                oldWorker.CityID = worker.CityID;

                _applicationDbContext.workers.Update(oldWorker);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
