using MahApps.Metro.Controls;
using System.Web.UI.WebControls;
using System.Windows;

namespace ExerciseApp.Views
{
    /// <summary>
    /// MqttPopupWindow.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Calculator2 : MetroWindow
    {
        double lastNumber; // 연산할 때 앞에 입력한 값을 저장하는 변수
        double result; // 연산한 결과 값을 저장하는 변수
        SelectedOperator selectedOperator;
        public Calculator2()
        {
            InitializeComponent();
        }

        // enum을 이용하여 SelectedOperator.XXX를 사용하기 위한 선언
        public enum SelectedOperator
        {
            Addition,
            Subtraction,
            Multiplication,
            Division
        }

        // 연산에 대한 클래스(SimpleMath)
        public class SimpleMath
        {
            public static double Add(double n1, double n2)
            {
                return n1 + n2;
            }

            public static double Subtract(double n1, double n2)
            {
                return n1 - n2;
            }

            public static double Multiple(double n1, double n2)
            {
                return n1 * n2;
            }

            public static double Divide(double n1, double n2)
            {
                return n1 / n2;
            }
        }
        private void BtnPer_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnReset_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void BtnClear_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void operationButton_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void numberButton_Click(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;
            if (LblResult.Content.ToString() == "0")
            {
                TbxMemo.Text = btn.Text;
            }
            else
            {
                TbxMemo.Text += btn.Text.ToString();
            }
        }

        private void Btn_dot_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Btn_result_Click(object sender, RoutedEventArgs e)
        {

        }

        
    }

}
