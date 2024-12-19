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

namespace UP2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            this.Closing += MainWindowClosing;
        }

        private void MainWindowClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Вы действительно хотите выйти из приложения?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);

            if (result == MessageBoxResult.No) e.Cancel = true;

        }
      

     
        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {

            if (!(e.Content is Page page)) return;
            this.Title = $"ProjectByMamontov - {page.Title}";

            if (page is Pages.Menu)
                BackButton.Visibility = Visibility.Hidden;
            else
                BackButton.Visibility = Visibility.Visible;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.NavigationService.GoBack();
        }
    }
}
