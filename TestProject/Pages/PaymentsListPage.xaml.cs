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

            try
            {
                CategoryBox.ItemsSource = App.Database.Categories.ToList();
            }
            catch (Exception Ex)
            {
                MessageBox.Show(Ex.Message);
                return;
            }



            UpdateSort();
        }

        void UpdateSort()
        {
            int IDUser = _User.id;
            List<Payment> StartList;

            try
            {
                StartList = App.Database.Payments.Where(p => p.id_user == IDUser).ToList();
            }
            catch(Exception Ex)
            {
                MessageBox.Show(Ex.Message);
                return;
            }

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

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var PayDelete = DGridPayments.SelectedItem as Payment;

            if(PayDelete == null)
            {
                MessageBox.Show("Не выбран ни один платеж для удаления");
                return;
            }

            if (MessageBox.Show("Удалить платеж: " + Environment.NewLine + $"{PayDelete.date.ToShortDateString()} {PayDelete.PaymentsType.name} (Кол-во: {PayDelete.count}) на сумму {PayDelete.Sum}",
                                          "Удалить",
                                          MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    string SuccessfullMessage = "Вы успешно удалили:" + Environment.NewLine + $"{PayDelete.date.ToShortDateString()} {PayDelete.PaymentsType.name} (Кол-во: {PayDelete.count}) на сумму {PayDelete.Sum}";
                    App.Database.Payments.Remove(PayDelete);
                    App.Database.SaveChanges();

                    MessageBox.Show(SuccessfullMessage);
                    UpdateSort();
                }
                catch(Exception Ex)
                {
                    MessageBox.Show("При удалении произошла ошибка:" + Environment.NewLine + Ex.Message);
                    return;
                }
            }
        }
    }
}
