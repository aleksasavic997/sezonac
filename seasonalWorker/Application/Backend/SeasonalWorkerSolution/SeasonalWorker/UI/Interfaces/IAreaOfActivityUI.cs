using SeasonalWorker.Models;
using System.Collections.Generic;

namespace SeasonalWorker.UI.Interfaces
{
    public interface IAreaOfActivityUI
    {
        List<AreaOfActivity> GetAllAreaOfActivities();
        AreaOfActivity GetAreaOfActivity(long id);
        bool AddAreaOfActivity(AreaOfActivity areaOfActivity);
        bool UpdateAreaOfActivity(AreaOfActivity areaOfActivity);
        bool DeleteAreaOfActivity(long id);
    }
}
