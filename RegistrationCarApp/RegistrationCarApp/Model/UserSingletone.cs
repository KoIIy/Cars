using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationCarApp.Model
{
    class UserSingletone
    {
       
        private static UserSingletone instance;

        public string Name
        {
            get; private set;
        }
        public string? MidleName
        {
            get; private set;
        }
        public string LastName
        {
            get; private set;
        }
        public string NumberPhone
        {
            get; private set;
        }
        public string Email
        {
            get; private set;
        }
        public int? RoleID
        {
            get; private set;
        }
        public int? PersoneID
        {
            get; private set;
        }

        protected UserSingletone(string name,string? midlename,string lastname, string numberphone, string email,int? roleid,int? personeid)
        {
            this.Name = name;
            this.MidleName = midlename;
            this.LastName = lastname;
            this.NumberPhone = numberphone;
            this.Email = email;
            this.RoleID = roleid;
            this.PersoneID = personeid;
        }

        public static UserSingletone setInstance(string name, string? midlename, string lastname, string numberphone, string email, int? roleid, int? personeid)
        {
            if (instance == null)
                instance = new UserSingletone(name, midlename, lastname, numberphone, email, roleid, personeid);
            return instance;
        }

        public static UserSingletone getInstance()
        {
            if (instance != null)
            return instance;
            return null;
        }
        public static UserSingletone clearInstance()
        {
            instance = null;
            return null;
        }
    }
}

