using RegistarionCarApp.ViewModel;
using RegistraionCarApp.View.Window;
using RegistrationCarApp.Model;
using RegistrationCarApp.Model.Entities;
using RegistrationCarApp.View.Page;
using RegistrationCarApp.View.Window;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace RegistrationCarApp.ViewModel
{
    public class MainClass : BaseViewModel
    {
        public CarAdd carAdd = new CarAdd();
        public UserAdd userAdd = new UserAdd();
        public void Initial()
        {

            foreach (Window window in Application.Current.Windows)
            {
                if (window is MainWindow)
                {
                    (window as MainWindow).MainFrame.Navigate(carAdd);
                }
            }
        }
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
        private RelayCommand openAddCarPage;
        public RelayCommand OpenAddCarPage
        {
            get
            {
                return openAddCarPage ?? (
                    openAddCarPage = new RelayCommand(obj =>
                    {
                        
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {
                                (window as MainWindow).MainFrame.Navigate(carAdd);
                            }
                        }
                    }
                    ));
            }
        }
        private RelayCommand openSearchCarOnCarNumber;
        public RelayCommand OpenSearchCarOnCarNumber
        {
            get
            {
                return openSearchCarOnCarNumber ?? (
                    openSearchCarOnCarNumber = new RelayCommand(obj =>
                    {
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {

                                SearchCarOnCarNumber searchCarOnCarNumber = new SearchCarOnCarNumber();
                                (window as MainWindow).MainFrame.Navigate(searchCarOnCarNumber);
                            }
                        }
                    }));
            }
        }
        private RelayCommand openSearchCarOnCarVinNumber;
        public RelayCommand OpenSearchCarOnCarVinNumber
        {
            get
            {
                return openSearchCarOnCarVinNumber ?? (
                    openSearchCarOnCarVinNumber = new RelayCommand(obj =>
                    {
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {

                                SearchCarOnVinNumber searchCarOnCarVinNumber = new SearchCarOnVinNumber();
                                (window as MainWindow).MainFrame.Navigate(searchCarOnCarVinNumber);
                            }
                        }
                    }));
            }
        }
        private RelayCommand openSearchCarOnCarInsuranceNumber;
        public RelayCommand OpenSearchCarOnCarInsuranceNumber
        {
            get
            {
                return openSearchCarOnCarInsuranceNumber ?? (
                    openSearchCarOnCarInsuranceNumber = new RelayCommand(obj =>
                    {
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {

                                SearchCarOnInsuranceNumber searchCarOnCarInsuranceNumber = new SearchCarOnInsuranceNumber();
                                (window as MainWindow).MainFrame.Navigate(searchCarOnCarInsuranceNumber);
                            }
                        }
                    }));
            }
        }
        private RelayCommand openAddUserPage;
        public RelayCommand OpenAddUserPage
        {
            get
            {
                return openAddUserPage ?? (
                    openAddUserPage = new RelayCommand(obj =>
                    {

                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {
                                (window as MainWindow).MainFrame.Navigate(userAdd);
                            }
                        }
                    }
                    ));
            }
        }
        private RelayCommand openSearchUserOnLogin;
        public RelayCommand OpenSearchUserOnLogin
        {
            get
            {
                return openSearchUserOnLogin ?? (
                    openSearchUserOnLogin = new RelayCommand(obj =>
                    {
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {

                                SearchUserOnLogin searchUserOnLogin = new SearchUserOnLogin();
                                (window as MainWindow).MainFrame.Navigate(searchUserOnLogin);
                            }
                        }
                    }));
            }
        }
        private RelayCommand openSearchUserOnMail;
        public RelayCommand OpenSearchUserOnMail
        {
            get
            {
                return openSearchUserOnMail ?? (
                    openSearchUserOnMail = new RelayCommand(obj =>
                    {
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {
                                SearchUserOnMail searchUserOnMail = new SearchUserOnMail();
                                (window as MainWindow).MainFrame.Navigate(searchUserOnMail);
                            }
                        }
                    }));
            }
        }
        private RelayCommand openSearchUserOnNumberPhone;
        public RelayCommand OpenSearchUserOnNumberPhone
        {
            get
            {
                return openSearchUserOnNumberPhone ?? (
                    openSearchUserOnNumberPhone = new RelayCommand(obj =>
                    {
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window is MainWindow)
                            {
                                SearchUserOnNumberPhone searchUserOnNumberPhone = new SearchUserOnNumberPhone();
                                (window as MainWindow).MainFrame.Navigate(searchUserOnNumberPhone);
                            }
                        }
                    }));
            }
        }
    }
}
