using RegistarionCarApp.ViewModel;
using RegistraionCarApp.View.Window;
using RegistrationCarApp.Model;
using RegistrationCarApp.View.Window;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace RegistrationCarApp.ViewModel
{
    class MainClass:BaseViewModel
    {
        
        private RelayCommand logOut;
        public RelayCommand LogOut
        {
            get
            {
                return logOut ??
                    (logOut = new RelayCommand(obj =>
                    {
                        new AuthorizationWindow().Show();
                        // clear user data on PC
                        UserSingletone.clearInstance();
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                                window.Close();
                        }
                    }
                    ));

            }
        }
        private RelayCommand exit;
        public RelayCommand Exit
        {
            get
            {
                return exit ?? (
                    exit = new RelayCommand(obj =>
                    {
                        UserSingletone.clearInstance();
                        foreach (Window window in Application.Current.Windows)
                        {
                            window.Close();
                        }
                    }
                    ));
            }
        }
    }
}
