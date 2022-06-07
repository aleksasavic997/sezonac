using SeasonalWorker.Models;

namespace SeasonalWorker.DAL.Interfaces
{
    public interface ICountryDAL
    {
        Country GetCountry(int countryId);
    }
}
