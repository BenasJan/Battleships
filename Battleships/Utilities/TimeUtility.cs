using System;

namespace Battleships.Utilities
{
    public class TimeUtility
    {
        private static TimeUtility timeUtilityInstance = null;

        public static TimeUtility GetTimeUtility()
        {
            if (timeUtilityInstance is null)
            {
                timeUtilityInstance = new TimeUtility();
            }

            return timeUtilityInstance;
        }

        private TimeUtility()
        {
            
        }

        public DateTime GetCurrentDateTime()
        {
            return DateTime.Now;
        }
    }
}