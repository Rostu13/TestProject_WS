//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Payment
    {
        public int id { get; set; }
        public int id_user { get; set; }
        public System.DateTime date { get; set; }
        public int id_category { get; set; }
        public int id_type { get; set; }
        public int count { get; set; }
        public decimal price { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual PaymentsType PaymentsType { get; set; }
        public virtual User User { get; set; }
    }
}