using RegistarionCarApp.ViewModel;
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

namespace RegistrationCarApp.View.Window
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow 
    {
        Authorization Auth = new Authorization();
        public AuthorizationWindow()
        {
            InitializeComponent();
            DataContext = Auth;
        }
        private void PasswordBox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            Auth.Password = PasswordBox.Password;
        }
    }
}
