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
    /// Логика взаимодействия для EditCarWindow.xaml
    /// </summary>
    public partial class EditCarWindow 
    {
        bool first = false,second = false;

        public EditCar editCar = new EditCar();
        public EditCarWindow()
        {
            InitializeComponent();
            DataContext = editCar;
        }
        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            if (MarkComboBox.SelectedIndex == -1||first == false)
            {
                first = true;
                return;
            }
            editCar.selectMark(MarkComboBox.SelectedIndex, ModelComboBox);
        }

        private void ComboBox_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            if (ModelComboBox.SelectedIndex == -1 || second == false)
            {
                second = true;
                return;
            }
              
            editCar.selectModel(ModelComboBox.SelectedIndex);
        }
        /// <summary>
        /// метод позволяет обновить список марк в Классе AddCar
        /// </summary>
        public void UpdateMark()
        {
            editCar.UpdateMark(ModelComboBox,MarkComboBox);
        }
    }
}
