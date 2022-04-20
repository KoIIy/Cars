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
    /// Логика взаимодействия для CarAdd.xaml
    /// </summary>
    public partial class CarAdd 
    {
        AddCar addCar = new AddCar();
        
        public CarAdd()
        {
            
            InitializeComponent();
            DataContext = addCar;
        }
        
        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            addCar.selectMark(MarkComboBox.SelectedIndex,ModelComboBox);
        }

        private void ComboBox_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            if (ModelComboBox.SelectedIndex == -1)
                return;
            addCar.selectModel(ModelComboBox.SelectedIndex);
        }
        /// <summary>
        /// метод позволяет обновить список марк в Классе AddCar
        /// </summary>
        public void UpdateMark()
        {
            addCar.UpdateMark(ModelComboBox);
        }
    }
}
