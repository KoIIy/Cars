using RegistraionCarApp.View.Window;
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
using System.Windows.Shapes;

namespace RegistrationCarApp.View.Window
{
    /// <summary>
    /// Логика взаимодействия для AddMarkOrModelCar.xaml
    /// </summary>
    public partial class AddMarkOrModelCar 
    {
        AddMarkOrModel addMarkOrModel = new AddMarkOrModel();
        public AddMarkOrModelCar()
        {
            InitializeComponent();
            DataContext = addMarkOrModel;
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            foreach (var window in App.Current.Windows)
            {
                if (window is MainWindow)
                {
                    (window as MainWindow).mainClass.carAdd.UpdateMark();
                }
            }
        }
    }
}
