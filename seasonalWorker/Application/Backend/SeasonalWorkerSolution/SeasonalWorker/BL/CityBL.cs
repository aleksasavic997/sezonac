using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalCity.BL
{
    public class CityBL : ICityBL
    {
        private readonly ICityDAL _ICityDAL;
        public CityBL(ICityDAL ICityDAL)
        {
            _ICityDAL = ICityDAL;
        }

        public bool AddCity(City City)
        {
            return _ICityDAL.AddCity(City);
        }

        public bool DeleteCity(long id)
        {
            return _ICityDAL.DeleteCity(id);
        }

        public List<City> GetAllCities()
        {
            return _ICityDAL.GetAllCities();
        }

        public City GetCity(long id)
        {
            return _ICityDAL.GetCity(id);
        }

        public bool UpdateCity(City City)
        {
            return _ICityDAL.UpdateCity(City);
        }
    }
}
