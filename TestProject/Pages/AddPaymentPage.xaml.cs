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
    /// Логика взаимодействия для AddPaymentPage.xaml
    /// </summary>
    public partial class AddPaymentPage : Page
    {
        private User _User{get;set;}
        public AddPaymentPage(User user)
        {
            InitializeComponent();
            CategoryBox.ItemsSource = App.Database.Categories.ToList();
            _User = user;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            string NamePayment = NamePayments.Text;

            if (string.IsNullOrWhiteSpace(NamePayment))
            {
                MessageBox.Show("Имя платежа не может быть пустым");
                return;
            }

            if (NamePayment.Length < 3)
            {
                MessageBox.Show("Наименование платежа должно составлять 3 и более символа");
                return;
            }

            if (string.IsNullOrWhiteSpace(CountBox.Text))
            {
                MessageBox.Show("Поле 'количество' не может быть пустым");
                return;
            }

            int iCount;

            try
            {
                iCount = Convert.ToInt32(CountBox.Text);
            }
            catch(Exception Ex)
            {
                MessageBox.Show("Поле 'Количество' не является числом");
                return;
            }

            if(iCount <= 0)
            {
                MessageBox.Show("Поле 'Количество' должно быть положтиельным числом");
                return;
            }

            
            if (string.IsNullOrWhiteSpace(PriceBox.Text))
            {
                MessageBox.Show("Поле 'Цена' не может быть пустым");
                return;
            }

            decimal Price;

            try
            {
                Price = Convert.ToDecimal(PriceBox.Text);
            }
            catch (Exception Ex)
            {
                MessageBox.Show("Поле 'Цена' не является числом");
                return;
            }

            if (Price <= 0.0m)
            {
                MessageBox.Show("Поле 'Цена' должно быть положтиельным числом");
                return;
            }

            try
            {

                var PayType = App.Database.PaymentsTypes.Where(p => p.name == NamePayment).FirstOrDefault();
                int PayTypeID;

                if(PayType == null)
                {
                    PaymentsType Type = new PaymentsType();
                    Type.name = NamePayment;
                    App.Database.PaymentsTypes.Add(Type);
                    App.Database.SaveChanges();

                    PayTypeID = Type.id;
                }
                else
                {
                    PayTypeID = PayType.id;
                }


                Payment Pay = new Payment();
                Pay.id_category = (CategoryBox.SelectedItem as Category).id;
                Pay.date = DateTime.Now;
                Pay.id_type = PayTypeID;
                Pay.price = Price;
                Pay.count = iCount;
                Pay.id_user = _User.id;
                App.Database.Payments.Add(Pay);
                App.Database.SaveChanges();

                MessageBox.Show("Вы успешно добавили новый платеж :)");
                App.MainFrame.Navigate(new Pages.PaymentsListPage(_User));
                return;
            }
            catch(Exception Ex)
            {
                MessageBox.Show(Ex.Message);
            }


        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            App.MainFrame.GoBack();
        }

        private void MinButton_Click(object sender, RoutedEventArgs e)
        {
            int iCount;

            try
            {
                iCount = Convert.ToInt32(CountBox.Text);
            }
            catch (Exception Ex)
            {
                CountBox.Text = "0";
                return;
            }

            iCount--;

            if (iCount <= 0)
            {
                CountBox.Text = "0";
                return;
            }
            else
            {
                CountBox.Text = iCount.ToString();
            }


        }

        private void PlusButton_Click(object sender, RoutedEventArgs e)
        {
            int iCount;

            try
            {
                iCount = Convert.ToInt32(CountBox.Text);
            }
            catch (Exception Ex)
            {
                CountBox.Text = "1";
                return;
            }

            iCount++;

            if (iCount <= 0)
            {
                CountBox.Text = "0";
                return;
            }
            else
            {
                CountBox.Text = iCount.ToString();
            }
        }
    }
}
