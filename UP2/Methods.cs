using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace UP2
{
    internal class Methods
    {
        HotelEntities HE = HotelEntities.GetContext();
        private double AverageDailyRate()
        {
            double? totalSum = HE.Bookings.Select(b => b.Room.RoomType.PricePerNight * (b.CheckOutDate - b.CheckInDate).TotalDays)
                                           .Sum();

            DateTime beginDate = HE.Bookings.Select(b => b.CheckInDate).OrderBy(dt => dt).First();

            DateTime endDate = HE.Bookings.Select(b => b.CheckOutDate).OrderBy(dt => dt).Last();

            double totalDays = (endDate - beginDate).TotalDays;

            if (totalSum.HasValue)
            {
                double rate = totalSum.Value / totalDays;
                return rate;
            }
            else
            {
                MessageBox.Show("Ошибка");
                return 0;
            }
        }

        private double RoomStockPercent()
        {
            DateTime beginDate = HE.Bookings.Select(b => b.CheckInDate).OrderBy(dt => dt).First();

            DateTime endDate = HE.Bookings.Select(b => b.CheckOutDate).OrderBy(dt => dt).Last();

            double totalDays = (endDate - beginDate).TotalDays;

            double occupiedNights = HE.Bookings.Select(b => (b.CheckOutDate - b.CheckInDate).TotalDays).Sum();

            double percents = occupiedNights / totalDays * 100;
            return percents;
        }
    }
}
