﻿#pragma checksum "..\..\..\Pages\PaymentsListPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "D42DF2F44BB366DD845112CCA9EAFFC7D813DD9E7C00ECEADFE468F115644BD6"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using TestProject.Pages;


namespace TestProject.Pages {
    
    
    /// <summary>
    /// PaymentsListPage
    /// </summary>
    public partial class PaymentsListPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 20 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddButton;
        
        #line default
        #line hidden
        
        
        #line 21 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button DeleteButton;
        
        #line default
        #line hidden
        
        
        #line 24 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker dateWithBox;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker dateLastBox;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox CategoryBox;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button SelectButton;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ClearButton;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ReportButton;
        
        #line default
        #line hidden
        
        
        #line 42 "..\..\..\Pages\PaymentsListPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid DGridPayments;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/TestProject;component/pages/paymentslistpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\PaymentsListPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.AddButton = ((System.Windows.Controls.Button)(target));
            
            #line 20 "..\..\..\Pages\PaymentsListPage.xaml"
            this.AddButton.Click += new System.Windows.RoutedEventHandler(this.AddButton_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.DeleteButton = ((System.Windows.Controls.Button)(target));
            
            #line 21 "..\..\..\Pages\PaymentsListPage.xaml"
            this.DeleteButton.Click += new System.Windows.RoutedEventHandler(this.DeleteButton_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.dateWithBox = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 4:
            this.dateLastBox = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 5:
            this.CategoryBox = ((System.Windows.Controls.ComboBox)(target));
            
            #line 29 "..\..\..\Pages\PaymentsListPage.xaml"
            this.CategoryBox.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.CategoryBox_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 6:
            this.SelectButton = ((System.Windows.Controls.Button)(target));
            
            #line 31 "..\..\..\Pages\PaymentsListPage.xaml"
            this.SelectButton.Click += new System.Windows.RoutedEventHandler(this.SelectButton_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.ClearButton = ((System.Windows.Controls.Button)(target));
            
            #line 32 "..\..\..\Pages\PaymentsListPage.xaml"
            this.ClearButton.Click += new System.Windows.RoutedEventHandler(this.ClearButton_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.ReportButton = ((System.Windows.Controls.Button)(target));
            
            #line 33 "..\..\..\Pages\PaymentsListPage.xaml"
            this.ReportButton.Click += new System.Windows.RoutedEventHandler(this.ReportButton_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.DGridPayments = ((System.Windows.Controls.DataGrid)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

