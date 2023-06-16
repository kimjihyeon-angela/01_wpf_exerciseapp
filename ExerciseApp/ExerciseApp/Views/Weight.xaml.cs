using ControlzEx.Standard;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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

namespace ExerciseApp.Views
{
    /// <summary>
    /// ExerciseRecord.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Weight : UserControl
    {
        public Weight()
        {
            InitializeComponent();
        }

        private void BtnCalculate_Click(object sender, RoutedEventArgs e)
        {
            var pr = int.Parse(Txt1RM.Text);
            Lbl10per.Content = (pr * 0.1).ToString();
            Lbl20per.Content = (pr * 0.2).ToString();
            Lbl30per.Content = (pr * 0.3).ToString();
            Lbl40per.Content = (pr * 0.4).ToString();
            Lbl50per.Content = (pr * 0.5).ToString();
            Lbl60per.Content = (pr * 0.6).ToString();
            Lbl70per.Content = (pr * 0.7).ToString();
            Lbl80per.Content = (pr * 0.8).ToString();
            Lbl90per.Content = (pr * 0.9).ToString();
            Lbl100per.Content = (pr * 1).ToString();
            Lbl110per.Content = (pr * 1.1).ToString();
            Lbl120per.Content = (pr * 1.2).ToString();
            Lbl130per.Content = (pr * 1.3).ToString();
            Lbl140per.Content = (pr * 1.4).ToString();
            Lbl150per.Content = (pr * 1.5).ToString();
        }
    }
}
