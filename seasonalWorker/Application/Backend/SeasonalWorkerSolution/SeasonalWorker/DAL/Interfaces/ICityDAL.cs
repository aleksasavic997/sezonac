using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.DAL.Interfaces
{
    public interface ICityDAL
    {
        List<City> GetAllCities();
        City GetCity(long id);
        bool AddCity(City City);
        bool DeleteCity(long id);
        bool UpdateCity(City City);
    }
}
