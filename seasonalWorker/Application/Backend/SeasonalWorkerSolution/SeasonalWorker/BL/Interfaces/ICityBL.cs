using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.BL.Interfaces
{
    public interface ICityBL
    {
        List<City> GetAllCities();
        City GetCity(long id);
        bool AddCity(City City);
        bool DeleteCity(long id);
        bool UpdateCity(City City);
    }
}
