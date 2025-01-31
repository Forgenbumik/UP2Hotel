using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Linq;
using System.Runtime.Remoting;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace UP2.Pages
{
    /// <summary>
    /// Логика взаимодействия для ClientsPage.xaml
    /// </summary>
    public partial class ClientsPage : Page
    {

        HotelEntities HE = HotelEntities.GetContext();
        List<Client> ClientsList;
        public ClientsPage()
        {
            InitializeComponent();
            ClientsList = HE.Clients.ToList();
            foreach (Client client in ClientsList)
            {
                client.PaymentSum = client.Bookings
                                           .Select(b => b.Room.RoomType.PricePerNight * (b.CheckOutDate - b.CheckInDate).TotalDays)
                                           .Sum() + client.ClientsServices.Select(cs => cs.Service.Price).Sum();

            }
            DGridClients.ItemsSource = ClientsList;
            
        }


    }
}
