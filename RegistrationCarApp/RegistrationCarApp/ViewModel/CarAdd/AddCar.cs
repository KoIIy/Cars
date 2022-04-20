using RegistarionCarApp.ViewModel;
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
using System.Windows.Controls;

namespace RegistrationCarApp.ViewModel
{
    class AddCar : BaseViewModel
    {
        public int ModelID = -2;
        public int MarkID = -2;
        private ObservableCollection<Mark> marks;
        public ObservableCollection<Mark> Marks
        {
            get
            {
                return marks;
            }

            set
            {
                marks = value;
                OnPropertyChanged("Marks");
            }
        }
        private ObservableCollection<CarModel> models;
        public ObservableCollection<CarModel> Models
        {
            get
            {
                return models;
            }

            set
            {
                models = value;
                OnPropertyChanged("Models");
            }
        }
        /// <summary>
        /// При инициализации класса обновляет список Моделей автомобиля
        /// </summary>
        public AddCar()
        {
            Marks = new();

            using (var db = new CarsEntities())
            {
                foreach (Mark mark in db.Mark)
                {
                    Marks.Add(mark);
                }

            }

        }
        /// <summary>
        /// метод позволяет обновить список марк в Классе AddCar
        /// </summary>
        public void UpdateMark(object comboBox)
        {
            (comboBox as ComboBox).SelectedIndex = -1;
            Marks = new();
            using (var db = new CarsEntities())
            {
                foreach (Mark mark in db.Mark)
                {
                    Marks.Add(mark);
                }
            }
        }
        /// <summary>
        /// Обьявление переменных
        /// </summary>
        private string country;
        public string Country
        {
            get
            {
                return country;
            }
            set
            {
                country = value;
                OnPropertyChanged("Country");
            }
        }
        private string state;
        public string State
        {
            get
            {
                return state;
            }
            set
            {
                state = value;
                OnPropertyChanged("State");
            }
        }
        private string locality;
        public string Locality
        {
            get
            {
                return locality;
            }
            set
            {
                locality = value;
                OnPropertyChanged("Locality");
            }
        }
        private string street;
        public string Street
        {
            get
            {
                return street;
            }
            set
            {
                street = value;
                OnPropertyChanged("Street");
            }
        }
        private string numberHome;
        public string NumberHome
        {
            get
            {
                return numberHome;
            }
            set
            {
                numberHome = value;
                OnPropertyChanged("NumberHome");
            }
        }
        private string apartmentNumber;
        public string ApartmentNumber
        {
            get
            {
                return apartmentNumber;
            }
            set
            {
                apartmentNumber = value;
                OnPropertyChanged("ApartmentNumber");
            }
        }
        private string postCode;
        public string PostCode
        {
            get
            {
                return postCode;
            }
            set
            {
                postCode = value;
                OnPropertyChanged("PostCode");
            }
        }
        private string firstName;
        public string FirstName
        {
            get
            {
                return firstName;
            }
            set
            {
                firstName = value;
                OnPropertyChanged("FirstName");
            }
        }
        private string lastName;
        public string LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                lastName = value;
                OnPropertyChanged("LastName");
            }
        }
        private string midleName;
        public string MidleName
        {
            get
            {
                return midleName;
            }
            set
            {
                midleName = value;
                OnPropertyChanged("Country");
            }
        }
        private string numberPhone;
        public string NumberPhone
        {
            get
            {
                return numberPhone;
            }
            set
            {
                numberPhone = value;
                OnPropertyChanged("NumberPhone");
            }
        }
        private string carNumber;
        public string CarNumber
        {
            get
            {
                return carNumber;
            }
            set
            {
                carNumber = value;
                OnPropertyChanged("CarNumber");
            }
        }
        private string carRegion;
        public string CarRegion
        {
            get
            {
                return carRegion;
            }
            set
            {
                carRegion = value;
                OnPropertyChanged("CarRegion");
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
        private string color;
        public string Color
        {
            get
            {
                return color;
            }
            set
            {
                color = value;
                OnPropertyChanged("Color");
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
        /// Процедура которая подгружает список Моделей автомобиля при выборе Марки автомобиля
        /// </summary>
        /// <param name="index">индекс выбранной марки авто</param>
        /// <param name="comboBox"></param>

        public void selectMark(int index,object comboBox)
        {
            (comboBox as ComboBox).SelectedIndex = -1;
            Models = new();
            MarkID = index;

            using (var db = new CarsEntities())
            {
                foreach (var model in db.Model)
                {
                    if (model.MarkID == Marks[index].MarkID)
                    {
                        Models.Add(new CarModel(model.Name + " " + model.Year, model.ModelID));
                        
                    }
                }

            }
        }
        /// <summary>
        /// процедура выбора модели автомобиля
        /// </summary>
        /// <param name="index">индекс выбранной модели авто</param>
        public void selectModel(int index)
        {

            ModelID = models[index].ID;
        }
        /// <summary>
        /// процедура добавления автомобиля в базу данных
        /// </summary>
        private RelayCommand addCarOnDatabase;
        public RelayCommand AddCarOnDatabase
        {
            get
            { 
                return addCarOnDatabase ?? (
                    addCarOnDatabase = new RelayCommand(obj =>
                    {
                        //Проверки на заполненость данными
                        if (String.IsNullOrEmpty(Country))
                        {
                            MessageBox.Show("Заполните поле Страна");
                            return;
                        }
                        if (String.IsNullOrEmpty(State))
                        {
                            MessageBox.Show("Заполните поле Область");
                            return;
                        }
                        if (String.IsNullOrEmpty(Locality))
                        {
                            MessageBox.Show("Заполните поле Населённый пункт");
                            return;
                        }
                        if (String.IsNullOrEmpty(Street))
                        {
                            MessageBox.Show("Заполните поле Улица");
                            return;
                        }
                        if (String.IsNullOrEmpty(NumberHome))
                        {
                            MessageBox.Show("Заполните поле Номер дома");
                            return;
                        }
                        if (String.IsNullOrEmpty(PostCode))
                        {
                            MessageBox.Show("Заполните поле Почтовый индекс");
                            return;
                        }
                        if (String.IsNullOrEmpty(FirstName))
                        {
                            MessageBox.Show("Заполните поле Им");
                            return;
                        }
                        if (String.IsNullOrEmpty(LastName))
                        {
                            MessageBox.Show("Заполните поле Фамилия");
                            return;
                        }
                        if (String.IsNullOrEmpty(NumberPhone))
                        {
                            MessageBox.Show("Заполните поле Номер телефона");
                            return;
                        }
                        if (MarkID == -2)
                        {
                            MessageBox.Show("Выберите Марку");
                            return;
                        }
                        if (ModelID == -2)
                        {
                            MessageBox.Show("Выберите Модель");
                            return;
                        }
                        if (String.IsNullOrEmpty(VinNumber))
                        {
                            MessageBox.Show("Заполните поле VIN номер автомобиля");
                            return;
                        }
                        if (String.IsNullOrEmpty(InsuranceNumber))
                        {
                            MessageBox.Show("Заполните поле Номер страховки");
                            return;
                        }
                        if (String.IsNullOrEmpty(Color))
                        {
                            MessageBox.Show("Заполните поле Цвет");
                            return;
                        }
                        if (String.IsNullOrEmpty(Year))
                        {
                            MessageBox.Show("Заполните поле Год");
                            return;
                        }

                        //процедура добавления в бд
                        using (var db = new CarsEntities())
                        {
                            //Переменная для обозначения присутствия записи в бд
                            bool exist = false;
                            int Id = -1, colorID = -1;
                            foreach (var country in db.Country)
                            {
                                if (country.Name == Country)
                                {
                                    exist = true;
                                    Id = country.CountryID;
                                    break;
                                }
                            }
                            if (!exist)
                            {
                                Id = db.Country.Add(new Country { Name = Country }).CountryID;
                            }
                            exist = false;
                            foreach (var state in db.State)
                            {
                                if (state.Name == State && state.CountryId == Id)
                                {
                                    exist = true;
                                    Id = state.StateID;
                                    break;
                                }
                            }
                            if (!exist)
                            {
                                Id = db.State.Add(new State { CountryId = Id, Name = State }).StateID;
                            }
                            exist = false;
                            foreach (var locality in db.Locality)
                            {
                                if (locality.Name == Locality && locality.StateId == Id)
                                {
                                    exist = true;
                                    Id = locality.LocalityID;
                                    break;
                                }
                            }
                            if (!exist)
                            {
                                Id = db.Locality.Add(new Locality { StateId = Id, Name = Locality }).LocalityID;
                            }
                            exist = false;
                            foreach (var adress in db.Adress)
                            {
                                if (adress.NumberOfHome == NumberHome && adress.Street == Street && adress.LocalityId == Id && adress.PostCode == PostCode && adress.NumberOfApartment == ApartmentNumber)
                                {
                                    exist = true;
                                    Id = adress.AdressID;
                                    break;
                                }
                            }
                            if (!exist)
                            {
                                Id = db.Adress.Add(new Adress { LocalityId = Id, Street = Street, PostCode = PostCode, NumberOfHome = NumberHome, NumberOfApartment = ApartmentNumber }).AdressID;
                            }
                            exist = false;
                            foreach (var person in db.Person)
                            {
                                if (person.Name == FirstName && person.MiddleName == MidleName && person.LastName == LastName && person.AdressID == Id && person.NumberPhone == NumberPhone)
                                {
                                    exist = true;
                                    Id = person.PersonID;
                                    break;
                                }
                            }
                            if (!exist)
                            {
                                Id = db.Person.Add(new Person { Name = FirstName, MiddleName = MidleName, LastName = LastName, AdressID = Id, NumberPhone = NumberPhone }).PersonID;
                            }
                            foreach (var color in db.Color)
                            {
                                if (color.Name == Color)
                                {
                                    exist = true;
                                    colorID = color.ColorID;
                                    break;
                                }
                            }
                            if (!exist)
                            {
                                colorID = db.Color.Add(new Color { Name = Color }).ColorID;
                            }
                            exist = false;
                            foreach (var car in db.Car)
                            {
                                if (car.VIN == VinNumber)
                                {
                                    MessageBox.Show("Автомобиль с таким VIN уже существует");
                                    return;
                                }
                                if (car.InsuranceNumber == InsuranceNumber)
                                {
                                    MessageBox.Show("Автомобиль с таким номером страховки уже существует");
                                    return;
                                }
                                if (car.Number == CarNumber && car.Region == carRegion && car.Number != "" && carRegion != "")
                                {
                                    MessageBox.Show("Автомобиль с таким номером уже существует");
                                    return;
                                }
                                if (car.ColorID == colorID && car.ModelID == ModelID && car.Number == carNumber && car.Region == carRegion && car.VIN == VinNumber && car.Year == Year && car.OwnerID == Id && car.InsuranceNumber == InsuranceNumber)
                                {
                                    MessageBox.Show("Автомобиль с такими данными уже существует");
                                    return;
                                }
                            }
                            if (!exist)
                            {
                                db.Car.Add(new Car { ModelID = ModelID, Number = carNumber, Region = carRegion, VIN = VinNumber, ColorID = colorID, InsuranceNumber = InsuranceNumber, OwnerID = Id, Year = Year });
                                MessageBox.Show("Выполнено");
                            }
                            db.SaveChanges();
                        }
                    }

                ));
            }
        }
        /// <summary>
        /// процедура открытия окнатдобавления марки и модели автомобиля
        /// </summary>
        private RelayCommand addMarkOrModel;
        public RelayCommand AddMarkOrModel
        {
            get
            {
                return addMarkOrModel ?? (
                        addMarkOrModel = new RelayCommand(obj => {

                            var addMark = new AddMarkOrModelCar();
                            addMark.ShowDialog();
                        }));
            }
        }

    }

}

