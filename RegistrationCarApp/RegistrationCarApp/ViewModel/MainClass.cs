using RegistarionCarApp.ViewModel;
using RegistraionCarApp.View.Window;
using RegistrationCarApp.Model;
using RegistrationCarApp.Model.Entityes;
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
                            SearchCarOnCarNumber searchCarOnCarNumber = new SearchCarOnCarNumber();
                            if (window is MainWindow)
                            {
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
                           SearchCarOnVinNumber searchCarOnCarVinNumber = new SearchCarOnVinNumber();
                            if (window is MainWindow)
                            {
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
                            SearchCarOnInsuranceNumber searchCarOnCarInsuranceNumber = new SearchCarOnInsuranceNumber();
                            if (window is MainWindow)
                            {
                                (window as MainWindow).MainFrame.Navigate(searchCarOnCarInsuranceNumber);
                            }
                        }
                    }));
            }
        }

    }
}
