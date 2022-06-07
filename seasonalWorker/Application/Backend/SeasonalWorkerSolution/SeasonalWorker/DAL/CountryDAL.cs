using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class CountryDAL : ICountryDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public CountryDAL(ApplicationDbContext applicationDbContext)
        {
            this._applicationDbContext = applicationDbContext;
        }
        public Country GetCountry(int countryId)
        {
            Country country = _applicationDbContext.countries.Where(c => c.ID == countryId).FirstOrDefault();
            return country;
        }
    }
}
