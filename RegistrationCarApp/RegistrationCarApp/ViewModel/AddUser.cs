using RegistarionCarApp.ViewModel;
using RegistrationCarApp.Model.Entities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace RegistrationCarApp.ViewModel
{
    class AddUser : BaseViewModel
    {
        public int RoleId = -2;
        private ObservableCollection<Role> roles;
        public ObservableCollection<Role> Roles
        {
            get
            {
                return roles;
            }

            set
            {
                roles = value;
                OnPropertyChanged("Roles");
            }
        }
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
        private string login;
        public string Login
        {
            get
            {
                return login;
            }
            set
            {
                login = value;
                OnPropertyChanged("Login");
            }
        }
        private string password;
        public string Password
        {
            get
            {
                return password;
            }
            set
            {
                password = value;
                OnPropertyChanged("Password");
            }
        }
        private string mail;
        public string Mail
        {
            get
            {
                return mail;
            }
            set
            {
                mail = value;
                OnPropertyChanged("Mail");
            }
        }
        public AddUser()
        {
            Roles = new();
            using (var db = new CarsEntities())
            {
                foreach (var role in db.Role)
                {
                    Roles.Add(role);
                }
            }
        }
        public void SelectRole(int index)
        {
            RoleId = index;
        }
        private RelayCommand addUserOnDatabase;
        public RelayCommand AddUserOnDatabase
        {
            get
            {
                return addUserOnDatabase ?? (
                    addUserOnDatabase = new RelayCommand(obj =>
                    {
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
                        if (String.IsNullOrEmpty(NumberPhone))
                        {
                            MessageBox.Show("Заполните поле Номер телефона");
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
                        if (String.IsNullOrEmpty(Mail))
                        {
                            MessageBox.Show("Заполните поле Почта");
                            return;
                        }
                        if (String.IsNullOrEmpty(Login))
                        {
                            MessageBox.Show("Заполните поле Логин");
                            return;
                        }
                        if (String.IsNullOrEmpty(Password))
                        {
                            MessageBox.Show("Заполните поле Пароль");
                            return;
                        }
                        if (RoleId == -2)
                        {
                            MessageBox.Show("выберите роль");
                            return;
                        }
                        //процедура добавления в бд
                        using (var db = new CarsEntities())
                        {
                            //Переменная для обозначения присутствия записи в бд
                            bool exist = false;
                            int Id = -1;
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
                            foreach (var user in db.User)
                            {
                                if (user.Login == Login && user.Password == Password && user.PersonID == Id && user.Email == Mail)
                                {
                                    MessageBox.Show("Пользователь с такими данными уже существует");
                                    return;
                                }
                                if (user.Login == Login)
                                {
                                    MessageBox.Show("Пользователь с таким логином уже существует");
                                    return;
                                }
                            }
                            db.User.Add(new User { Email = Mail, Login = Login, Password = Password, RoleID = Roles[RoleId].RoleID, PersonID = Id });
                            db.SaveChangesAsync();
                            MessageBox.Show("Успех");
                        }
                    }));
            }
        }
    }
}
