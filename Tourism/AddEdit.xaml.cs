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

namespace Tourism
{
    /// <summary>
    /// Логика взаимодействия для AddEdit.xaml
    /// </summary>
    public partial class AddEdit : Page
    {
        private Hotel _currentHotel = new Hotel();
        public AddEdit(Hotel selectedHotel)
        {
            InitializeComponent();
            if(selectedHotel != null)
            {
                _currentHotel = selectedHotel;
            }
            DataContext = _currentHotel;
            ComboCountries.ItemsSource = TourismEntities.GetContext().Country.ToList();
        }

        private void SaveButt_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentHotel.Name))
            {
                errors.AppendLine("А где название");
            }
            if (_currentHotel.Starts <1 || _currentHotel.Starts > 5)
            {
                errors.AppendLine("А где звезды");
            }
            if(_currentHotel.Country == null)
            {
                errors.AppendLine("А где страна");
            }

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentHotel.id == 0)
            
                TourismEntities.GetContext().Hotel.Add(_currentHotel);
            try
            {
                TourismEntities.GetContext().SaveChanges();
                MessageBox.Show("UwU");
                Manager.MainFrame.GoBack(); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
