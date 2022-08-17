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
using System.Windows.Navigation;
using System.Windows.Shapes;
using TestProject.Models;

namespace TestProject.Pages
{
    /// <summary>
    /// Логика взаимодействия для PaymentsListPage.xaml
    /// </summary>
    public partial class PaymentsListPage : Page
    {
        private User _User { get; set; }

        private bool Filtr { get; set; }
        public PaymentsListPage(User User)
        {
            InitializeComponent();

            _User = User;

            CategoryBox.ItemsSource = App.Database.Categories.ToList();

            UpdateSort();
        }

        void UpdateSort()
        {
            int IDUser = _User.id;
            var StartList = App.Database.Payments.Where(p=> p.id_user == IDUser).ToList();

            if(Filtr)
            {
                int IDCategory = (CategoryBox.SelectedItem as Category).id;
                StartList = StartList.Where(p => p.id_category == IDCategory).ToList();

                var StartDate = dateWithBox.SelectedDate;

                if(StartDate.HasValue)
                {
                    var SelStartDate = StartDate.Value;
                    StartList = StartList.Where(p => p.date >= SelStartDate).ToList();
                }

                var EndDate = dateLastBox.SelectedDate;

                if (EndDate.HasValue)
                {
                    var SelEndDate = EndDate.Value;
                    StartList = StartList.Where(p => p.date <= SelEndDate).ToList();
                }
            }


            DGridPayments.ItemsSource = StartList;
        }

        private void CategoryBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void ReportButton_Click(object sender, RoutedEventArgs e)
        {
            App.MainFrame.Navigate(new Pages.ReportPage());
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Filtr = false;

            UpdateSort();
        }

        private void SelectButton_Click(object sender, RoutedEventArgs e)
        {
            Filtr = true;

            UpdateSort();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            App.MainFrame.Navigate(new Pages.AddPaymentPage(_User));

        }
    }
}
