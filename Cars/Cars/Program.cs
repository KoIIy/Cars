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
        static async Task Main(string[] args)
        {
            var _endingFlag = false;

            while (!_endingFlag)
            {
                using (CarsEntities db = new CarsEntities())
                {

                    Console.Write("1 - вывести данные,\n2 - внести данные,\n0 - Выйти из программы \nВведите значение: ");
                    switch (Console.ReadLine())
                    {
                        case "0":
                            _endingFlag = true;
                            break;
                        case "1":
                            var cars = db.Car;
                            foreach (Car t in cars)
                            {
                                Console.WriteLine("\t{0}\t{1}{2}\t{3}\t{4}", t.CarID, t.Number, t.Region, t.InsuranceNumber, t.Color);
                                Console.WriteLine("-----------------------------------------------------------------");
                            }
                            break;
                        case "2":
                            try
                            {
                                string Number, InsuranceNumber, Color, Year;
                                int Region, OwnerID, ModelID;

                                Console.WriteLine("Введите номер авто");
                                Number = Console.ReadLine();

                                Console.WriteLine("Введите регион авто");
                                int.TryParse(Console.ReadLine(), out Region);

                                Console.WriteLine("Введите номер страховки");
                                InsuranceNumber = Console.ReadLine();

                                Console.WriteLine("Введите цвет авто");
                                Color = Console.ReadLine();

                                Console.WriteLine("Введите год авто");
                                Year = Console.ReadLine();

                                var model = db.Model;
                                foreach (Cars.Model.Model m in model)
                                {
                                    Console.WriteLine("\t{0}\t{1}\t{2}\t{3}", m.ModelID, m.Name, m.Year, m.MarkID);
                                    Console.WriteLine("-----------------------------------------------------------------");
                                }

                                Console.WriteLine("Введите нужный номер из первого столбца");
                                int.TryParse(Console.ReadLine(), out ModelID);

                                var owner = db.Owner;
                                foreach (Owner o in owner)
                                {
                                    Console.WriteLine("\t{0}\t{1}\t{2}\t{3}", o.OwnerID, o.Name, o.LastName, o.MiddleName);
                                    Console.WriteLine("-----------------------------------------------------------------");
                                }

                                Console.WriteLine("Введите нужный номер из первого столбца");
                                OwnerID = int.Parse(Console.ReadLine());

                                db.Car.Add(new Car
                                {
                                    Number = Number,
                                    Region = Region,
                                    InsuranceNumber = InsuranceNumber,
                                    Color = Color,
                                    Year = Year,
                                    ModelID = ModelID,
                                    OwnerID = OwnerID
                                });

                                await db.SaveChangesAsync();

                            }
                            catch (Exception e)
                            {
                                Console.WriteLine("Ошибка:{0}", e);
                            }

                            break;
                        default:
                            Console.WriteLine("Введено неверное значение");
                            break;
                    };


                }

            }
            Console.ReadKey();
        }
    }
}
