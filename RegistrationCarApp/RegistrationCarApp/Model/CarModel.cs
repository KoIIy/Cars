using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationCarApp.Model
{
    public class CarModel
    {
        public string Name
        {
            get;set;
        }
        public int ID
        {
            get; set;
        }
        public CarModel(string name, int id)
        {
            Name = name;
            ID = id;
        }
        public CarModel()
        {
        }
    }
}
