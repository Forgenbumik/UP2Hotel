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
using System.Windows.Navigation;
using System.Windows.Shapes;
using UP2.Pages;

namespace UP2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        BookingPage bookingPage = new BookingPage();
        ClientsPage clientsPage = new ClientsPage();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ToBookings_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(bookingPage);
        }

        private void ToClients_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(clientsPage);
        }
    }
}
