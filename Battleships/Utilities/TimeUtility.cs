using System;

namespace Battleships.Utilities
{
    public class TimeUtility
    {
        private static TimeUtility _timeUtilityInstance;

        public static TimeUtility GetTimeUtility()
        {
            if (_timeUtilityInstance is null)
            {
                _timeUtilityInstance = new TimeUtility();
            }

            return _timeUtilityInstance;
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