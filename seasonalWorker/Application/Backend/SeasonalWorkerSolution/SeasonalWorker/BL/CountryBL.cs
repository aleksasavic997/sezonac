using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;

namespace SeasonalWorker.BL
{
    public class CountryBL : ICountryBL
    {
        private readonly ICountryDAL _ICountryDAL;
        public CountryBL(ICountryDAL ICountryDAL)
        {
            _ICountryDAL = ICountryDAL;
        }
        public Country GetCountry(int countryId)
        {
            return _ICountryDAL.GetCountry(countryId);
        }
    }
}
