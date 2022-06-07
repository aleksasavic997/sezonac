using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.Models;
using System.Collections.Generic;
using System.Linq;

namespace SeasonalWorker.DAL
{
    public class AreaOfActivityDAL : IAreaOfActivityDAL
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public AreaOfActivityDAL(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public bool AddAreaOfActivity(AreaOfActivity areaOfActivity)
        {
            var checkAreaOfActivity = _applicationDbContext.areaOfActivities.Where(a => a.AreaOfActivityName == areaOfActivity.AreaOfActivityName).FirstOrDefault();
            if (checkAreaOfActivity == null)
            {
                _applicationDbContext.areaOfActivities.Add(areaOfActivity);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }

        public bool DeleteAreaOfActivity(long id)
        {
            var areaOfActivity = _applicationDbContext.areaOfActivities.Where(a => a.ID == id).FirstOrDefault();
            if (areaOfActivity != null)
            {
                _applicationDbContext.areaOfActivities.Remove(areaOfActivity);
                _applicationDbContext.SaveChanges();

                return true;
            }
            else
            {
                return false;
            }
        }

        public List<AreaOfActivity> GetAllAreaOfActivities()
        {
            return _applicationDbContext.areaOfActivities.ToList();
        }

        public AreaOfActivity GetAreaOfActivity(long id)
        {
            var areaOfActivity = _applicationDbContext.areaOfActivities.Where(a => a.ID == id).FirstOrDefault();
            return areaOfActivity;
        }

        public bool UpdateAreaOfActivity(AreaOfActivity areaOfActivity)
        {
            var oldAreaOfActivity = _applicationDbContext.areaOfActivities.Where(a => a.ID == areaOfActivity.ID).FirstOrDefault();
            if (oldAreaOfActivity != null)
            {
                oldAreaOfActivity.AreaOfActivityName = areaOfActivity.AreaOfActivityName;

                _applicationDbContext.areaOfActivities.Update(oldAreaOfActivity);
                _applicationDbContext.SaveChanges();

                return true;
            }
            return false;
        }
    }
}
