using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker.UI
{
    public class CountryUI : ICountryUI
    {
        private readonly ICountryBL _ICountryBL;
        
        public CountryUI(ICountryBL ICountryBL)
        {
            this._ICountryBL = ICountryBL;
        }
        public Country GetCountry(int countryId)
        {
            return _ICountryBL.GetCountry(countryId);
        }
    }
}
