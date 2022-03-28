using Cars.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cars 
{
    class Program
    {
        static void Main(string[] args)
        {
            using (CarsEntities db = new CarsEntities())
            {
                var cars = db.Car;
                foreach (Car t in cars)
                    Console.WriteLine("\t{0}\t{1}{2}\t{3}\t{4}", t.CarID,t.Number,t.Region,t.InsuranceNumber,t.Color) ;
                Console.WriteLine("-----------------------------------------------------------------");
            
            }
            Console.ReadKey();
        }
    }
}
