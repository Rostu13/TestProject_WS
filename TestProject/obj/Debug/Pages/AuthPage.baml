   M S B A M L   `   `   `  ????F  BTestProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:TestProject.PagesTestProject.Pages  5           TestProject.Pages.AuthPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      1localclr-namespace:TestProject.Pages     5        N? 
Background
  ????? N? Title$ AuthPage??5
      .??5      ? .+?5   
   ?? $??Center=?6   $??Center=?62   .+?5      ?? $??Авторизация??6   $??Center=?6*   $??Center=?6G   6d   ?? 5       ?? Orientation$ 
Horizontal=?6   $??0 20 0 0q?62   .+?5      ?? $??Логин:??6   $	??100??6)   68   ?? 5      -   5         ??Name$ LoginBox??5      $	??250??6-    ?? DisplayMemberPath$ FullName??69    ?? SelectedIndex$ 0??6V   6j   5      ?? 5      $ 
Horizontal=?6   $??0 20 0 0q?62   .+?5      ?? $??Пароль:??6   $	??100??6*   69   ?? 5      -   5         ??Name$ PassBox??5      $	??250??6+   69   5      ?? 5      $1??+Ну или введите ПИН Код :)??6   $??Center=?68   $??Center=?6S   $??0 20 0 0q?6p   6?   ?? 5      $ 
Horizontal=?6   $??0 20 0 0q?62   .+?5      ?? $??ПИН Код:??6   $	??100??6+   6:   ?? 5      -   5        $ 
PinCodeBox??5      $	??250??6.   6<   5      ?? 5       $ 
Horizontal=?6   $??Center=?62   $??Center=?6O   .+?5!      ?? -   5         ??Name$ LoginButton??5!      $??
Войти??6.   $??0 20 0 0q?6>   $??Center=?6P   $??Center=?6m   6?   ?? 5"      -   5        $ 
ExitButton??5"      $??
Выйти??6-   $??	20 20 0 0q?6=   $??Center=?6P   $??Center=?6m   6?   5#      5'      5(      5)      