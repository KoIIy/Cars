﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cars.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CarsEntities : DbContext
    {
        public CarsEntities()
            : base("name=CarsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Adress> Adress { get; set; }
        public virtual DbSet<Car> Car { get; set; }
        public virtual DbSet<Country> Country { get; set; }
        public virtual DbSet<Locality> Locality { get; set; }
        public virtual DbSet<Mark> Mark { get; set; }
        public virtual DbSet<Model> Model { get; set; }
        public virtual DbSet<Owner> Owner { get; set; }
        public virtual DbSet<State> State { get; set; }
    }
}