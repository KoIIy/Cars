using System.Linq;
using System.Windows;
using System.Windows.Annotations;
using RegistraionCarApp;
using RegistrationCarApp.Model;
using RegistrationCarApp.View.Window;
using RegistrationCarApp.Model.Entities;

namespace RegistarionCarApp.ViewModel
{
    class Authorization : BaseViewModel
    {
        private string login, password;
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
        /// <summary>
        /// Процедура авторизации
        /// </summary>

        private RelayCommand auth;
        public RelayCommand Auth
        {
            get
            {
                return auth ??
                    (auth = new RelayCommand(obj =>
                    {
                        if (Login == "" && Password == "")
                        {
                            MessageBox.Show("Введите логин и пароль.");
                            return;
                        }
                        if (Login == "")
                        {
                            MessageBox.Show("Введите логин.");
                            return;
                        }
                        if (Password == "")
                        {
                            MessageBox.Show("Введите пароль.");
                            return;
                        }
                        using (var db = new CarsEntities())
                        {
                            
                            //scan database
                            foreach (User user1 in db.User)
                            {
                                // check database on user exists
                                if (user1.Login == Login && user1.Password == Password)
                                {
                                    UserSingletone.setInstance(user1.Person.Name,user1.Person.MiddleName,user1.Person.LastName, user1.Person.NumberPhone ,user1.Email,user1.RoleID,user1.PersonID);
                                    
                                    //open MainWindow
                                    new RegistraionCarApp.View.Window.MainWindow().Show();
                                    //close opened AuthorizaationWindow
                                    foreach (Window window in Application.Current.Windows)
                                    {
                                        if (window is AuthorizationWindow)
                                        {
                                           window.Close();
                                        }
                                    }
                                    return;
                                }
                            }
                            MessageBox.Show("Неверный логин или пароль.");


                        }
                    }
                    ));
            }
        }

        

    }
}
