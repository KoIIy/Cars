using RegistarionCarApp.ViewModel;
using RegistrationCarApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationCarApp.ViewModel
{
    class MainClass:BaseViewModel
    {

        private string top = UserSingletone.getInstance().Email , tap="";

        public string Top
        {
            get
            {
                return top;
            }
            set
            {
                top = value;
                OnPropertyChanged("Top");
            }
        }
        public string Tap
        {
            get
            {
                return tap;
            }
            set
            {
                tap = value;
                OnPropertyChanged("Tap");
            }
        }
    }
}
