using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new ToursPage());
            Manager.MainFrame = MainFrame;

            //ImportTours();
        }

        private void ImportTours()
        {
            var fileData = File.ReadAllLines(@"D:\Bwa\туры.txt");
            var images = Directory.GetFiles(@"D:\Bwa\Photo");

            foreach(var line in fileData)
            {
                var data = line.Split('\t');

                var tempTour = new Tour
                {
                    Name = data[0].Replace("\"", ""),
                    TicketCount = int.Parse(data[2]),
                    Price = decimal.Parse(data[3]),
                    IsOpen = data[4] == "0" ? false : true
                };
                foreach(var tourType in data[5].Split(new string[] { ","}, StringSplitOptions.RemoveEmptyEntries))
                {
                    var current = TourismEntities.GetContext().Type.ToList().FirstOrDefault(p => p.name == tourType);
                    if (current != null)
                    {
                        tempTour.Type.Add(current);
                    }
                }
                try
                {
                    tempTour.Image = File.ReadAllBytes(images.FirstOrDefault(p => p.Contains(tempTour.Name)));  
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                TourismEntities.GetContext().Tour.Add(tempTour);
                TourismEntities.GetContext().SaveChanges();
            }
        }

        private void BackButt_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void MainFrame_ContentRendered(object sender, NavigationEventArgs e)
        {
            
        }

        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {

        }

        private void MainFrame_ContentRendered_1(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                BackButt.Visibility = Visibility.Visible;
            }
            else
            {
                BackButt.Visibility = Visibility.Hidden;
            }
        }
    }
}
