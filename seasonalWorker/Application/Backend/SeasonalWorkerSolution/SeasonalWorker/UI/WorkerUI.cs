using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;
using System.Collections.Generic;

namespace SeasonalWorker.UI
{
    public class WorkerUI : IWorkerUI
    {
        private readonly IWorkerBL _IWorkerBL;
        public WorkerUI(IWorkerBL IWorkerBL)
        {
            _IWorkerBL = IWorkerBL;
        }

        public bool AddWorker(Worker worker)
        {
            return _IWorkerBL.AddWorker(worker);
        }

        public Worker CheckWorker(Login login)
        {
            return _IWorkerBL.CheckWorker(login);
        }

        public bool DeleteWorker(long id)
        {
            return _IWorkerBL.DeleteWorker(id);
        }

        public List<Worker> GetAllWorkers()
        {
            return _IWorkerBL.GetAllWorkers();
        }

        public Worker GetWorker(long id)
        {
            return _IWorkerBL.GetWorker(id);
        }

        public bool UpdateWorker(Worker worker)
        {
            return _IWorkerBL.UpdateWorker(worker);
        }
    }
}
