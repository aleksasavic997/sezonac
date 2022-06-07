using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;
using System.Collections.Generic;

namespace SeasonalWorker.UI
{
    public class EmployerUI : IEmployerUI
    {
        private readonly IEmployerBL _IEmployerBL;
        public EmployerUI(IEmployerBL IEmployerBL)
        {
            _IEmployerBL = IEmployerBL;
        }

        public bool AddEmployer(Employer employer)
        {
            return _IEmployerBL.AddEmployer(employer);
        }

        public Employer CheckEmployer(Login login)
        {
            return _IEmployerBL.CheckEmployer(login);
        }

        public bool DeleteEmployer(long id)
        {
            return _IEmployerBL.DeleteEmployer(id);
        }

        public List<Employer> GetAllEmployers()
        {
            return _IEmployerBL.GetAllEmployers();
        }

        public Employer GetEmployer(long id)
        {
            return _IEmployerBL.GetEmployer(id);
        }

        public bool UpdateEmployer(Employer employer)
        {
            return _IEmployerBL.UpdateEmployer(employer);
        }
    }
}
