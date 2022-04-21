using RegistarionCarApp.ViewModel;
using RegistrationCarApp.Model.Entityes;
using RegistrationCarApp.View.Window;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationCarApp.ViewModel
{
    class SearchCar:BaseViewModel
    {
        
        private string number;
        public string Number
        {
            get
            {
                return number;
            }
            set
            {
                number = value;
                OnPropertyChanged("Number");

            }
        }
        private string region;
        public string Region
        {
            get
            {
                return region;
            }
            set
            {
                region = value;
                OnPropertyChanged("Region");

            }
        }
        private RelayCommand search;
        public RelayCommand Search
        {
            get
            {
                return search ?? (
                    search = new RelayCommand(obj => 
                    {
                        using (var db = new CarsEntities())
                        {
                            foreach (var car in db.Car)
                            {
                                if (car.Number == Number && car.Region == Region)
                                {
                                    var editCarWindow = new EditCarWindow();
                                    editCarWindow.editCar.carID = car.CarID;
                                    new EditCarWindow().ShowDialog();
                                    break;
                                }
                            }
                        }
                    }));
            }
        }
    }
}
