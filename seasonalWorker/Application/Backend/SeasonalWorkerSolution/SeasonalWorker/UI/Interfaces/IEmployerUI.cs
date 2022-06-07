using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.UI.Interfaces
{
    public interface IEmployerUI
    {
        List<Employer> GetAllEmployers();
        Employer GetEmployer(long id);
        bool AddEmployer(Employer employer);
        bool DeleteEmployer(long id);
        bool UpdateEmployer(Employer employer);
        Employer CheckEmployer(Login login);
    }
}
