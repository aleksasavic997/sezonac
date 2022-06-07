using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.BL
{
    public class AreaOfActivityBL:IAreaOfActivityBL
    {
        private readonly IAreaOfActivityDAL _IAreaOfActivityDAL;

        public AreaOfActivityBL(IAreaOfActivityDAL AreaOfActivityDAL)
        {
            _IAreaOfActivityDAL = AreaOfActivityDAL;
        }

        public bool AddAreaOfActivity(AreaOfActivity areaOfActivity)
        {
            return _IAreaOfActivityDAL.AddAreaOfActivity(areaOfActivity);
        }

        public bool DeleteAreaOfActivity(long id)
        {
            return _IAreaOfActivityDAL.DeleteAreaOfActivity(id);
        }

        public List<AreaOfActivity> GetAllAreaOfActivities()
        {
            return _IAreaOfActivityDAL.GetAllAreaOfActivities();
        }

        public AreaOfActivity GetAreaOfActivity(long id)
        {
            return _IAreaOfActivityDAL.GetAreaOfActivity(id);
        }

        public bool UpdateAreaOfActivity(AreaOfActivity areaOfActivity)
        {
            return _IAreaOfActivityDAL.UpdateAreaOfActivity(areaOfActivity);
        }
    }
}
