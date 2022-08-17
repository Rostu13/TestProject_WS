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
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();

            LoginBox.ItemsSource = App.Database.Users.ToList();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            int iLength = PinCodeBox.Text.Length;
            var SelectedUser = (LoginBox.SelectedItem as User);

            int IDUser = SelectedUser.id;

            if (iLength > 0)
            {
                if(iLength > 4)
                {
                    MessageBox.Show("ПИН Код не должен составлять более 4 цифр");
                    return;
                }

                int iTemplateNum;
                string Pin = PinCodeBox.Text;

                try
                {
                    iTemplateNum = Convert.ToInt32(Pin);
                }
                catch(Exception Ex)
                {
                    MessageBox.Show(Ex.Message);
                    return;
                }
               

                var UserPin = App.Database.Users.Where(p => p.id == IDUser && p.pincode == Pin ).FirstOrDefault();

                if (UserPin == null)
                {
                    MessageBox.Show("ПИН Код к данному пользователю не подходит");
                    return;
                }
                else
                {
                    MessageBox.Show("Вы успешно авторизовались под пользователем" + Environment.NewLine + UserPin.FullName);
                    App.MainFrame.Navigate(new Pages.PaymentsListPage(UserPin));
                    return;
                }

            }

            string Pass = PassBox.Text;

            if (string.IsNullOrWhiteSpace(Pass))
            {
                MessageBox.Show("Поле с паролем не может быть пустым :(");
                return;
            }

            var User = App.Database.Users.Where(p => p.id == IDUser && p.password == Pass).FirstOrDefault();

            if (User == null)
            {
                MessageBox.Show("Пароль к данному пользователю не подходит");
                return;
            }
            else
            {
                MessageBox.Show("Вы успешно авторизовались под пользователем" + Environment.NewLine + User.FullName);
                App.MainFrame.Navigate(new Pages.PaymentsListPage(User));
                return;
            }


        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
