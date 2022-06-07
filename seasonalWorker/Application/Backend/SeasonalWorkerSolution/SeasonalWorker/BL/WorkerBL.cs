using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.BL
{
    public class WorkerBL : IWorkerBL
    {
        private readonly IWorkerDAL _IWorkerDAL;
        public WorkerBL(IWorkerDAL IWorkerDAL)
        {
            _IWorkerDAL = IWorkerDAL;
        }

        public bool AddWorker(Worker worker)
        {
            return _IWorkerDAL.AddWorker(worker);
        }

        public Worker CheckWorker(Login login)
        {
            return _IWorkerDAL.CheckWorker(login);
        }

        public bool DeleteWorker(long id)
        {
            return _IWorkerDAL.DeleteWorker(id);
        }

        public List<Worker> GetAllWorkers()
        {
            return _IWorkerDAL.GetAllWorkers();
        }

        public Worker GetWorker(long id)
        {
            return _IWorkerDAL.GetWorker(id);
        }

        public bool UpdateWorker(Worker worker)
        {
            return _IWorkerDAL.UpdateWorker(worker);
        }
    }
}
