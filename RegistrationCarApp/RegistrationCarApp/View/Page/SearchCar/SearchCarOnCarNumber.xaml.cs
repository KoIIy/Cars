using RegistrationCarApp.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RegistrationCarApp.View.Page
{
    /// <summary>
    /// Логика взаимодействия для SearchCarOnCarNumber.xaml
    /// </summary>
    public partial class SearchCarOnCarNumber
    {
        SearchCar searchCar = new SearchCar();
        public SearchCarOnCarNumber()
        {
            InitializeComponent();
            DataContext = searchCar;

            this.InputBindings.Add(new KeyBinding(searchCar.SearchOnNumber, new KeyGesture(Key.Enter)));
        }
    }
}
