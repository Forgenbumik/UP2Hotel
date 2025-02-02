using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace UP2.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddBookingWindow.xaml
    /// </summary>
    /// 

    public partial class AddBookingWindow : Window
    {
        Booking _currentbooking;
        HotelEntities HE = HotelEntities.GetContext();

        public event Action<Booking> OnBookingAdded;

        public AddBookingWindow()
        {
            _currentbooking = new Booking();
            Initialize();
        }

        public AddBookingWindow(Booking booking)
        {
            _currentbooking = booking;
            Initialize();
        }

        private void Initialize()
        {
            InitializeComponent();
            _currentbooking.CheckInDate = DateTime.Now;
            _currentbooking.CheckOutDate = DateTime.Now;
            DataContext = _currentbooking;
            var List = HE.Clients.ToList();
            List.Reverse();
            ClientsList.ItemsSource = List;
            RoomsList.ItemsSource = HE.Rooms.Where(r => r.StatusID == 4).ToList();
            
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (ClientsList.SelectedIndex == -1 ||
                RoomsList.SelectedIndex == -1 ||
                CheckInDatePicker.SelectedDate < DateTime.Now||
                CheckOutDatePicker.SelectedDate <= CheckInDatePicker.SelectedDate)
            {
                MessageBox.Show("Неверный формат даты или не заполнены все поля");
                return;
            }
            Room selectedRoom = RoomsList.SelectedItem as Room;
            HE.Bookings.Add(_currentbooking);
            selectedRoom.StatusID = 1;
            HE.SaveChanges();
            MessageBox.Show("Информация сохранена!");
            OnBookingAdded.Invoke(_currentbooking);
            Close();
        }
    }
}
