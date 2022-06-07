using SeasonalWorker.Models;

namespace SeasonalWorker.BL.Interfaces
{
    public interface ICountryBL
    {
        Country GetCountry(int countryId);
    }
}
