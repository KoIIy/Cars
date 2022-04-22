using RegistarionCarApp.ViewModel;
using RegistrationCarApp.Model.Entities;
using RegistrationCarApp.View.Window;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace RegistrationCarApp.ViewModel
{
    class SearchUser:BaseViewModel
    {
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
        private RelayCommand searchOnNumberPhone;
        public RelayCommand SearchOnNumberPhone
        {
            get
            {
                return searchOnNumberPhone ?? (
                    searchOnNumberPhone = new RelayCommand(obj =>
                    {
                       
                        if (String.IsNullOrEmpty(NumberPhone))
                        {
                            MessageBox.Show("Введите номер телефона");
                            return;
                        }
                        using (var db = new CarsEntities())
                        {
                            foreach (var user in db.User)
                            {
                                if (user.Person.NumberPhone == NumberPhone)
                                {
                                    var editUserWindow = new EditUserWindow();
                                    editUserWindow.editUser.UserID = user.UserID;
                                    editUserWindow.editUser.Upadate();
                                    editUserWindow.ShowDialog();
                                    break;
                                }
                            }
                        }
                    }));
            }
        }
        private RelayCommand searchOnMail;
        public RelayCommand SearchOnMail
        {
            get
            {
                return searchOnMail ?? (
                    searchOnMail = new RelayCommand(obj =>
                    {
                        if (String.IsNullOrEmpty(Mail))
                        {
                            MessageBox.Show("Введите почту");
                            return;
                        }
                        using (var db = new CarsEntities())
                        {


                            foreach (var user in db.User)
                            {
                                if (user.Email == Mail)
                                {
                                    var editUserWindow = new EditUserWindow();
                                    editUserWindow.editUser.UserID = user.UserID;
                                    editUserWindow.editUser.Upadate();
                                    editUserWindow.ShowDialog();
                                    break;
                                }
                            }
                        }
                    }));
            }
        }

        private RelayCommand searchOnLogin;
        public RelayCommand SearchOnLogin
        {
            get
            {
                return searchOnLogin ?? (
                    searchOnLogin = new RelayCommand(obj =>
                    {

                        if (String.IsNullOrEmpty(Login))
                        {
                            MessageBox.Show("Введите логин");
                            return;
                        }
                        using (var db = new CarsEntities())
                        {
                            foreach (var user in db.User)
                            {
                                if (user.Login == Login)
                                {
                                    var editUserWindow = new EditUserWindow();
                                    editUserWindow.editUser.UserID = user.UserID;
                                    editUserWindow.editUser.Upadate();
                                    editUserWindow.ShowDialog();
                                    break;
                                }
                            }
                        }
                    }));
            }
        }
    }
}
