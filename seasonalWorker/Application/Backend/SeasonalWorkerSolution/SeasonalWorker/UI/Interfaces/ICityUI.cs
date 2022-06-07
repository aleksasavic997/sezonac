using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalCity.UI.Interfaces
{
    public interface ICityUI
    {
        List<City> GetAllCities();
        City GetCity(long id);
        bool AddCity(City City);
        bool DeleteCity(long id);
        bool UpdateCity(City City);
    }
}
