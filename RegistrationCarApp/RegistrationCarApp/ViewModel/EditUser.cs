﻿using RegistarionCarApp.ViewModel;
using RegistrationCarApp.Model.Entities;
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
    public class EditUser:BaseViewModel
    {
        public int RoleId,UserID,PersonID;
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
        public EditUser()
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
        public void Upadate()
        {
            using (var db = new CarsEntities())
            {
                foreach (var user in db.User)
                {
                    if (user.UserID == UserID)
                    {
                        this.Login = user.Login;
                        this.Password = user.Password;
                        this.Mail = user.Email;
                        this.NumberPhone = user.Person.NumberPhone;
                        this.FirstName = user.Person.Name;
                        this.LastName = user.Person.LastName;
                        this.MidleName = user.Person.MiddleName;
                        this.PostCode = user.Person.Adress.PostCode;
                        this.ApartmentNumber = user.Person.Adress.NumberOfApartment;
                        this.NumberHome = user.Person.Adress.NumberOfHome;
                        this.Street = user.Person.Adress.Street;
                        this.Locality = user.Person.Adress.Locality.Name;
                        this.State = user.Person.Adress.Locality.State.Name;
                        this.Country = user.Person.Adress.Locality.State.Country.Name;
                        this.RoleId = user.RoleID;
                        this.PersonID = user.PersonID;
                        break;
                    }
                }
                int roleIndex = 0;
                foreach (var role in Roles)
                {
                    if (role.RoleID == RoleId)
                    {
                        break;
                    }
                    roleIndex++;
                }
                foreach (Window window in App.Current.Windows)
                {
                    if (window is EditUserWindow)
                    {
                        (window as EditUserWindow).RoleComboBox.SelectedIndex = roleIndex;
                    }
                }
            }

        }
        private RelayCommand edit;
        public RelayCommand Edit
        {
            get
            {
                return edit ?? (
                    edit = new RelayCommand(obj =>
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
                                if (PersonID == person.PersonID)
                                {
                                    person.Name = FirstName;
                                    person.MiddleName = MidleName;
                                    person.LastName = LastName;
                                    person.NumberPhone = NumberPhone;
                                    person.AdressID = Id;
                                    Id = person.PersonID;
                                    break;
                                }
                            }
                            foreach (var user in db.User)
                            {
                                if (UserID == user.UserID)
                                {
                                    user.Login = Login;
                                    user.Password = Password;
                                    user.Email = Mail;
                                    user.RoleID = Roles[RoleId].RoleID;
                                }
                            }
                            db.SaveChangesAsync();
                            MessageBox.Show("Успех");
                            foreach (Window window in App.Current.Windows)
                            {
                                if (window is EditUserWindow)
                                {
                                    window.Close();
                                }
                            }
                        }
                    }));
            }
        }
        private RelayCommand cancel;
        public RelayCommand Cancel
        {
            get
            {
                return cancel ?? (cancel = new RelayCommand(obj =>
                {
                    foreach (Window window in App.Current.Windows)
                    {
                        if (window is EditUserWindow)
                        {
                            window.Close();
                        }
                    }
                }));
            }
        }
    }
}
