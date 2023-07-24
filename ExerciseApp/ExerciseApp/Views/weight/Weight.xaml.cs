using ExerciseApp.Logics;
using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;
using static System.Math;

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

        private async void BtnCalculate_Click(object sender, RoutedEventArgs e)
        {

            var kg = RbtKg.IsChecked.Value;
            var lbs = RbtLbs.IsChecked.Value;
            var male = RbtMale.IsChecked.Value;
            var female = RbtFemale.IsChecked.Value;

            // 무게값 입력 안했을 경우
            if (Txt1RM.Text == string.Empty)
            {
                await Commons.ShowCustomMessageAsync("주의", "무게를 입력하세요");
                return;
            }
            // 무게값 입력, 무게기준 혹은 성별 선택안했을 경우
            else if(((lbs == false) && (kg == false)) || ((male == false) && (female == false)))
                
            {
                await Commons.ShowCustomMessageAsync("주의", "무게기준 혹은 성별을 입력하세요");
                return;
            }
            // 무게값, 무게기준, 성별 선택 완료 후
            else
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
                // Debug.WriteLine(kg.ToString()); // 무게 kg 기준
                // Debug.WriteLine(lbs.ToString()); // 무게 lbs 기준
                // Debug.WriteLine(male.ToString()); // 성별 남자 기준
                // Debug.WriteLine(female.ToString()); // 성별 여자 기준
                if (male == true)
                {
                    var realPr = (pr - 20)/2;
                    Debug.WriteLine(realPr.ToString());
                    Debug.WriteLine((realPr/45).ToString());
                    Debug.WriteLine((realPr%45).ToString());
                    Lbl45.Content = (realPr / 45).ToString();
                    realPr = realPr % 45;
                    Lbl35.Content = (realPr / 35).ToString();
                    realPr = realPr % 35;
                    Lbl25.Content = (realPr / 25).ToString();
                    realPr = realPr % 25;
                    Lbl15.Content = (realPr / 15).ToString();
                    realPr = realPr % 15;
                    Lbl10.Content = (realPr / 10).ToString();
                    realPr = realPr % 10;
                    Lbl5.Content = (realPr / 5).ToString();
                    realPr = realPr % 5;
                    Lbl2_5.Content = Round(realPr / 2.5).ToString();
                }
                else
                {
                    var realPr = (pr - 15) / 2;
                    Debug.WriteLine(realPr.ToString());
                    Debug.WriteLine((realPr / 45).ToString());
                    Debug.WriteLine((realPr % 45).ToString());
                    Lbl45.Content = (realPr / 45).ToString();
                    realPr = realPr % 45;
                    Lbl35.Content = (realPr / 35).ToString();
                    realPr = realPr % 35;
                    Lbl25.Content = (realPr / 25).ToString();
                    realPr = realPr % 25;
                    Lbl15.Content = (realPr / 15).ToString();
                    realPr = realPr % 15;
                    Lbl10.Content = (realPr / 10).ToString();
                    realPr = realPr % 10;
                    Lbl5.Content = (realPr / 5).ToString();
                    realPr = realPr % 5;
                    Lbl2_5.Content = Round(realPr / 2.5).ToString();
                }
            }

        }

        private void BtnCalculator_Click(object sender, RoutedEventArgs e)
        {
            var calc = new Calculator2();
            //calc.Owner = this;
            calc.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            var result = calc.ShowDialog();

            
        }
    }
}
