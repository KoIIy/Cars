using RegistrationCarApp.Model;
using RegistrationCarApp.Model.Entities;
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
            mainClass.Initial();
            if (UserSingletone.getInstance().RoleID == 1)
                forAdmin.Visibility = Visibility.Visible;
            else
                forAdmin.Visibility = Visibility.Collapsed;
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
           
        }
    }
}
