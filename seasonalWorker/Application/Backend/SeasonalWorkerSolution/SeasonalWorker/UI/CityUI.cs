using SeasonalCity.UI.Interfaces;
using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalCity.UI
{
    public class CityUI : ICityUI
    {
        private readonly ICityBL _ICityBL;
        public CityUI(ICityBL ICityBL)
        {
            _ICityBL = ICityBL;
        }

        public bool AddCity(City City)
        {
            return _ICityBL.AddCity(City);
        }

        public bool DeleteCity(long id)
        {
            return _ICityBL.DeleteCity(id);
        }

        public List<City> GetAllCities()
        {
            return _ICityBL.GetAllCities();
        }

        public City GetCity(long id)
        {
            return _ICityBL.GetCity(id);
        }

        public bool UpdateCity(City City)
        {
            return _ICityBL.UpdateCity(City);
        }
    }
}
