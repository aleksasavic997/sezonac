using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System.Collections.Generic;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class CityDAL : ICityDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public CityDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public bool AddCity(City city)
        {
            var checkCity = _applicationDbContext.cities.Where(c => c.CityName==city.CityName).FirstOrDefault();
            if (checkCity == null)
            {
                _applicationDbContext.cities.Add(city);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public bool DeleteCity(long id)
        {
            var city = _applicationDbContext.cities.Where(c => c.ID == id).FirstOrDefault();
            if (city != null)
            {
                _applicationDbContext.cities.Remove(city);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public List<City> GetAllCities()
        {
            return _applicationDbContext.cities.ToList();
        }

        public City GetCity(long id)
        {
            var City = _applicationDbContext.cities.Where(c => c.ID == id).FirstOrDefault();
            return City;
        }

        public bool UpdateCity(City city)
        {
            var oldCity = _applicationDbContext.cities.Where(c => c.ID == city.ID).FirstOrDefault();
            if (oldCity != null)
            {
                oldCity.CityName = city.CityName;
                oldCity.Zip = city.Zip;
                oldCity.County = city.County;
                oldCity.Country = city.Country;

                _applicationDbContext.cities.Update(oldCity);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
