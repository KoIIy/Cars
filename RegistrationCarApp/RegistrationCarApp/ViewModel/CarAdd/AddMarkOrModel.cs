using RegistarionCarApp.ViewModel;
using RegistraionCarApp.View.Window;
using RegistrationCarApp.Model.Entities;
using RegistrationCarApp.View.Page;
using RegistrationCarApp.View.Window;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace RegistrationCarApp.ViewModel
{
    class AddMarkOrModel : BaseViewModel
    {
        private string mark;
        public string Mark
        {
            get
            {
                return mark;
            }
            set
            {
                mark = value;
                OnPropertyChanged("Mark");
            }
        }
        private string model;
        public string Model
        {
            get
            {
                return model;
            }
            set
            {
                model = value;
                OnPropertyChanged("Model");
            }
        }
        private string year;
        public string Year
        {
            get
            {
                return year;
            }
            set
            {
                year = value;
                OnPropertyChanged("Year");
            }
        }
        /// <summary>
        /// Процедура добавления Марки и модели автомобиля в базу данных
        /// </summary>
        private RelayCommand add;
        public RelayCommand Add
        {
            get
            {
                return add ?? (
                        add = new RelayCommand(obj =>
                        {
                            using (var db = new CarsEntities())
                            {
                                bool exists = false;
                                int MarkId = -1;
                                foreach (var mark in db.Mark)
                                {
                                    if (mark.Name == Mark)
                                    {
                                        exists = true;
                                        MarkId = mark.MarkID;
                                    }
                                }
                                if (!exists)
                                {
                                    MarkId = db.Mark.Add(new Mark { Name = Mark }).MarkID;
                                }
                                foreach (var model in db.Model)
                                {
                                    if (model.Name == Mark&& model.Year == Year)
                                    {
                                        MessageBox.Show("Такая модель уже существует");
                                        return;
                                    }
                                }
                                db.Model.Add(new RegistrationCarApp.Model.Entities.Model { MarkID = MarkId, Name = Model, Year = Year });
                                db.SaveChangesAsync();
                                foreach (Window window in App.Current.Windows)
                                {

                                    if (window is MainWindow)
                                    {
                                        (window as MainWindow).mainClass.carAdd.UpdateMark();
                                    }
                                    if (window is EditCarWindow)
                                    {
                                        (window as EditCarWindow).UpdateMark();
                                    }
                                }
                                foreach (Window window in App.Current.Windows)
                                {
                                    
                                    if (window is AddMarkOrModelCar)
                                    {
                                        window.Close();
                                    }
                                }
                            }
                        }
                            ));
            }
        }
        /// <summary>
        /// процедура закрытия окна
        /// </summary>
        private RelayCommand cancel;
        public RelayCommand Cancel
        {
            get
            {
            return cancel??(
                    cancel = new RelayCommand(obj=>
                    {
                        foreach (Window window in App.Current.Windows)
                        {
                            if (window is AddMarkOrModelCar)
                            {
                                
                                window.Close();
                            }
                        }
                    }));
            }
        }
    }
}
