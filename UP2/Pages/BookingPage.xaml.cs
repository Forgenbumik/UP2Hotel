using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace UP2.Pages
{
    /// <summary>
    /// Логика взаимодействия для BookingPage.xaml
    /// </summary>
    public partial class BookingPage : Page
    {

        AddBookingWindow addBookingWindow;
        
        HotelEntities HE = HotelEntities.GetContext();
        public BookingPage()
        {
            InitializeComponent();
            DGridBookings.ItemsSource = FullBookingsList();
        }

        private List<Booking> FullBookingsList()
        {
            var List = HE.Bookings.ToList();
            List.Reverse();
            return List;
        }

        private void ShowAll_Click(object sender, RoutedEventArgs e)
        {
            DGridBookings.ItemsSource = FullBookingsList();
            BeginFilterDateText.SelectedDate = null;
            EndFilterDateText.SelectedDate = null;
        }

        private void Create_Click(object sender, RoutedEventArgs e)
        {
            addBookingWindow = new AddBookingWindow();
            addBookingWindow.Show();
             
            addBookingWindow.OnBookingAdded += (newbooking) =>
            {
                DGridBookings.ItemsSource = FullBookingsList();
            };
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            var selectedItems = DGridBookings.SelectedItems.Cast<Booking>().ToList();
            if (selectedItems.Any())
            {
                foreach (var item in selectedItems.Select(itm => itm))
                {
                    HE.Bookings.Remove(item);
                }
                HE.SaveChanges();
                DGridBookings.ItemsSource = FullBookingsList();
            }
        }

        private void Filter(DateTime FilterDate, bool isBegin)
        {
            List<Booking> BookingList = new List<Booking>();

            if (isBegin)
            {
                foreach (Booking booking in HE.Bookings.ToList())
                {
                    DateTime checkindate = booking.CheckInDate;
                    if (checkindate >= FilterDate)
                    {
                        BookingList.Add(booking);
                    }
                }
            }
            else
            {
                foreach (Booking booking in HE.Bookings.ToList())
                {
                    DateTime checkindate = booking.CheckInDate;
                    if (checkindate <= FilterDate)
                    {
                        BookingList.Add(booking);
                    }
                }
            }
            BookingList.Reverse();
            DGridBookings.ItemsSource = BookingList;
        }
        private void Filter(DateTime BeginDate, DateTime EndDate)
        {
            List<Booking> BookingList  = new List<Booking>();
            foreach (Booking booking in HE.Bookings.ToList())
            {
                DateTime checkindate = booking.CheckInDate;
                if (checkindate >= BeginDate && checkindate < EndDate)
                {
                    BookingList.Add(booking);
                }
            }
            BookingList.Reverse();
            DGridBookings.ItemsSource = BookingList;
        }

        private void DatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            string BeginDateText = BeginFilterDateText.Text;
            string EndDateText = EndFilterDateText.Text;

            DateTime BeginDate = new DateTime();
            DateTime EndDate = new DateTime();
            if (DateTime.TryParse(BeginDateText, out BeginDate) && DateTime.TryParse(EndDateText, out EndDate))
            {
                Filter(BeginDate, EndDate);
            }
            else if (DateTime.TryParse(BeginDateText, out BeginDate))
            {
                Filter(BeginDate, true);
            }
            else if (DateTime.TryParse(EndDateText, out EndDate))
            {
                Filter(EndDate, false);
            }
            else
            {
                if (!string.IsNullOrEmpty(BeginDateText) || !string.IsNullOrEmpty(EndDateText))
                {
                    MessageBox.Show("Неверный формат даты");
                }
                DGridBookings.ItemsSource = FullBookingsList();
            }
        }
    }
}
