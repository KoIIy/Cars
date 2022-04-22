using RegistarionCarApp.ViewModel;
using RegistrationCarApp.Model.Entityes;
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
        private string vinNumber;
        public string VinNumber
        {
            get
            {
                return vinNumber;
            }
            set
            {
                vinNumber = value;
                OnPropertyChanged("VinNumber");

            }
        }
        private string insuranceNumber;
        public string InsuranceNumber
        {
            get
            {
                return insuranceNumber;
            }
            set
            {
                insuranceNumber = value;
                OnPropertyChanged("InsuranceNumber");

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
        private RelayCommand searchOnNumber;
        public RelayCommand SearchOnNumber
        {
            get
            {
                return searchOnNumber ?? (
                    searchOnNumber = new RelayCommand(obj => 
                    {
                        if (String.IsNullOrEmpty(Number)&&String.IsNullOrEmpty(Region))
                        {
                            MessageBox.Show("Введите номер и регион.");
                            return;
                        }
                        if (String.IsNullOrEmpty(Number))
                        {
                            MessageBox.Show("Введите номер");
                            return;
                        }
                        if (String.IsNullOrEmpty(Region))
                        {
                            MessageBox.Show("Введите регион");
                            return;
                        }
                        using (var db = new CarsEntities())
                        {
                            foreach (var car in db.Car)
                            {
                                if (car.Number == Number && car.Region == Region)
                                {
                                    var editCarWindow = new EditCarWindow();
                                    editCarWindow.editCar.carId = car.CarID;
                                    editCarWindow.editCar.Upadate();
                                    editCarWindow.ShowDialog();
                                    break;
                                }
                            }
                        }
                    }));
            }
        }
        private RelayCommand searchOnVinNumber;
        public RelayCommand SearchOnVinNumber
        {
            get
            {
                return searchOnVinNumber ?? (
                    searchOnVinNumber = new RelayCommand(obj =>
                    {
                        if (String.IsNullOrEmpty(VinNumber))
                        {
                            MessageBox.Show("Введите VIN номер");
                            return;
                        }
                        using (var db = new CarsEntities())
                        {

                            
                            foreach (var car in db.Car)
                            {
                                if (car.VIN == VinNumber)
                                {
                                    var editCarWindow = new EditCarWindow();
                                    editCarWindow.editCar.carId = car.CarID;
                                    editCarWindow.editCar.Upadate();
                                    editCarWindow.ShowDialog();
                                    break;
                                }
                            }
                        }
                    }));
            }
        }
       
        private RelayCommand searchOnInsuranceNumber;
        public RelayCommand SearchOnInsuranceNumber
        {
            get
            {
                return searchOnInsuranceNumber ?? (
                    searchOnInsuranceNumber = new RelayCommand(obj =>
                    {

                        if (String.IsNullOrEmpty(InsuranceNumber))
                        {
                            MessageBox.Show("Введите номер страховки");
                            return;
                        }
                        using (var db = new CarsEntities())
                        {
                            foreach (var car in db.Car)
                            {
                                if (car.InsuranceNumber == InsuranceNumber)
                                {
                                    var editCarWindow = new EditCarWindow();
                                    editCarWindow.editCar.carId = car.CarID;
                                    editCarWindow.editCar.Upadate();
                                    editCarWindow.ShowDialog();
                                    break;
                                }
                            }
                        }
                    }));
            }
        }
    }
}
