using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Controllers.Helpers;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.BL
{
    public class EmployerBL : IEmployerBL
    {
        private readonly IEmployerDAL _IEmployerDAL;
        public EmployerBL(IEmployerDAL IEmployerDAL)
        {
            _IEmployerDAL = IEmployerDAL;
        }

        public bool AddEmployer(Employer employer)
        {
            return _IEmployerDAL.AddEmployer(employer);
        }

        public Employer CheckEmployer(Login login)
        {
            return _IEmployerDAL.CheckEmployer(login);
        }

        public bool DeleteEmployer(long id)
        {
            return _IEmployerDAL.DeleteEmployer(id);
        }

        public List<Employer> GetAllEmployers()
        {
            return _IEmployerDAL.GetAllEmployers();
        }

        public Employer GetEmployer(long id)
        {
            return _IEmployerDAL.GetEmployer(id);
        }

        public bool UpdateEmployer(Employer employer)
        {
            return _IEmployerDAL.UpdateEmployer(employer);
        }
    }
}
