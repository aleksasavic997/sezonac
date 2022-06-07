using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.Models;
using SeasonalWorker.UI.Interfaces;
using System.Collections.Generic;

namespace SeasonalWorker.UI
{
    public class AreaOfActivityUI : IAreaOfActivityUI
    {
        private readonly IAreaOfActivityBL _IAreaOfActivityBL;

        public AreaOfActivityUI(IAreaOfActivityBL AreaOfActivityBL)
        {
            _IAreaOfActivityBL = AreaOfActivityBL;
        }

        public bool AddAreaOfActivity(AreaOfActivity areaOfActivity)
        {
            return _IAreaOfActivityBL.AddAreaOfActivity(areaOfActivity);
        }

        public bool DeleteAreaOfActivity(long id)
        {
            return _IAreaOfActivityBL.DeleteAreaOfActivity(id);
        }

        public List<AreaOfActivity> GetAllAreaOfActivities()
        {
            return _IAreaOfActivityBL.GetAllAreaOfActivities();
        }

        public AreaOfActivity GetAreaOfActivity(long id)
        {
            return _IAreaOfActivityBL.GetAreaOfActivity(id);
        }

        public bool UpdateAreaOfActivity(AreaOfActivity areaOfActivity)
        {
            return _IAreaOfActivityBL.UpdateAreaOfActivity(areaOfActivity);
        }
    }
}
