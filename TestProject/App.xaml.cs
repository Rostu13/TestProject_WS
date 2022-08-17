﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using TestProject.Models;
namespace TestProject
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Frame MainFrame { get; set; } 

        public static PaymentEntity Database = new PaymentEntity();
    }
}
