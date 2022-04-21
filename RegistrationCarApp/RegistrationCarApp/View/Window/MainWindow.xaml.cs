using RegistrationCarApp.Model.Entityes;
using RegistrationCarApp.View.Window;
using RegistrationCarApp.ViewModel;
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

namespace RegistraionCarApp.View.Window
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        public  MainClass mainClass = new MainClass();
        public MainWindow()
        {
            InitializeComponent();
            DataContext = mainClass;
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
           
        }
    }
}
