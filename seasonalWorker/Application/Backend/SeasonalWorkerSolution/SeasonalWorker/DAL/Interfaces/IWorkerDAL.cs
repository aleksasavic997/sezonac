using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.DAL.Interfaces
{
    public interface IWorkerDAL
    {
        List<Worker> GetAllWorkers();
        Worker GetWorker(long id);
        bool AddWorker(Worker worker);
        bool DeleteWorker(long id);
        bool UpdateWorker(Worker worker);
        Worker CheckWorker(Login login);
    }
}
