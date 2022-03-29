using Cars.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
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
                
                Console.Write("1 - вывести данные, 2 - внести данные \nВведите значение: ");
                   switch (Console.Read())
                {
                    case '1':
                        var cars = db.Car;
                        foreach (Car t in cars)
                            Console.WriteLine("\t{0}\t{1}{2}\t{3}\t{4}", t.CarID, t.Number, t.Region, t.InsuranceNumber, t.Color);
                        Console.WriteLine("-----------------------------------------------------------------");
                      
                        break;
                    case '2':
                        try
                        {
                            string Number,InsuranceNumber,Color,Year;
                            int Region, OwnerID, ModelID;
                            Console.WriteLine("Введите номер авто");
                            Number = Console.ReadLine();
                            Console.WriteLine("Введите регион авто");
                            Region = int.Parse(Console.ReadLine());
                            Console.WriteLine("Введите номер страховки");
                            InsuranceNumber = Console.ReadLine();
                            Console.WriteLine("Введите цвет авто");
                            Color = Console.ReadLine();
                            Console.WriteLine("Введите год авто");
                            Year = Console.ReadLine();
                            db.Car.Add(new Car { });
                            var model = db.Model;
                            foreach (Cars.Model.Model m in model)
                            {
                                Console.WriteLine("\t{0}\t{1}\t{2}\t{3}",m.ModelID,m.Name,m.Year,m.MarkID);
                                Console.WriteLine("-----------------------------------------------------------------"); break;
                            }
                            Console.WriteLine("Введите нужный номер из первого столбца");
                            ModelID = int.Parse(Console.ReadLine());
                            var owner = db.Owner;
                            foreach (Owner o in owner)
                            {
                                Console.WriteLine("\t{0}\t{1}\t{2}\t{3}", o.OwnerID, o.Name, o.LastName,o.MiddleName);
                                Console.WriteLine("-----------------------------------------------------------------"); break;
                            }
                            Console.WriteLine("Введите нужный номер из первого столбца");
                            OwnerID = int.Parse(Console.ReadLine());
                            db.Car.Add(new Car { Number = Number, Region = Region, InsuranceNumber = InsuranceNumber, Color = Color, Year = Year, ModelID = ModelID, OwnerID = OwnerID });
                            db.SaveChangesAsync();

                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("Ошибка:{0}", e);
                        }
                        break;
                    default: Console.WriteLine("ВВедено неверное значение"); break;
                };
               
            
            }
            Console.ReadKey();
        }
    }
}
