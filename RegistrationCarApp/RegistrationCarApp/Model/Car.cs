using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationCarApp.Model
{
    class Car
    {
        private static Car insatnce;
        public string ColorID
        {
            get; set;
        }
        public string CarID
        {
            get; set;
        }
        public string Country
        {
            get; set;
        }
        public string State
        {
            get; set;
        }
        public string Locality
        {
            get; set;
        }
        public string Street
        {
            get; set;
        }
        public string NumberHome
        {
            get; set;
        }
        public string ApartmentNumber
        {
            get; set;
        }
        public string PostCode
        {
            get; set;
        }
        public string FirstName
        {
            get; set;
        }
        public string LastName
        {
            get; set;
        }
        public string MidleName
        {
            get; set;
        }
        public int MarkId
        {
            get; set;
        }
        public int ModelId
        {
            get; set;
        }
        public string NumberPhone
        {
            get; set;
        }
        public string CarNumber
        {
            get; set;
        }
        public string CarRegion
        {
            get; set;
        }
        public string VinNumber
        {
            get; set;
        }
        public string InsuranceNumber
        {
            get; set;
        }
        public string Color
        {
            get; set;
        }
        public string Year
        {
            get; set;
        }
        public Car()
        {
        }
        protected Car (string country, string state, string locality, string street, string numberHome, string apartmentNumber, string postCode, string firstName, string lastName, string midleName, string numberPhone,int markId,int modelId, string carNumber, string carRegion, string vinNumber, string insuranceNumber, string color, string year)
        {
            Country = country;
            State = state;
            Locality = locality;
            Street = street;
            NumberHome = numberHome;
            ApartmentNumber = apartmentNumber;
            PostCode = postCode;
            FirstName = firstName;
            LastName = lastName;
            MidleName = midleName;
            NumberPhone = numberPhone;
            MarkId = markId;
            ModelId = modelId;
            CarNumber = carNumber;
            CarRegion = carRegion;
            VinNumber = vinNumber;
            InsuranceNumber = insuranceNumber;
            Color = color;
            Year = year;

        }
        public static Car SetInstance(string country, string state, string locality, string street, string numberHome, string apartmentNumber, string postCode, string firstName, string lastName, string midleName, string numberPhone, int markId, int modelId, string carNumber, string carRegion, string vinNumber, string insuranceNumber, string color, string year)
        {
            if (insatnce == null)
            {
                insatnce= new Car(country,state,locality,street,numberHome,apartmentNumber,postCode,firstName,lastName,midleName,numberPhone,markId,modelId,carNumber,carRegion,vinNumber,insuranceNumber,color,year);
            }
            return insatnce;
        }
        public static Car GetInstance()
        {
            return insatnce;
        }
        public static Car ClearInstance()
        {
            return insatnce = null;
        }
    }
}
