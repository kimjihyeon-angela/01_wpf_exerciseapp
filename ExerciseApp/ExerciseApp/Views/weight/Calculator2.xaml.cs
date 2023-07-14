using MahApps.Metro.Controls;
using ExerciseApp.Logics;
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
using System.Windows.Shapes;
using System.Data;

namespace ExerciseApp.Views
{
    /// <summary>
    /// MqttPopupWindow.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Calculator : MetroWindow
    {
        double lastNumber; // 연산할 때 앞에 입력한 값을 저장하는 변수
        double result; // 연산한 결과 값을 저장하는 변수
        SelectedOperator selectedOperator;
        public Calculator()
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
            TbxMemo.Text = string.Empty;
            LblResult.Content = 0;
        }

        private void BtnClear_Click(object sender, RoutedEventArgs e)
        {
            double lastNumber;
            if (double.TryParse(TbxMemo.Text.ToString(),out lastNumber))
            {
                lastNumber = lastNumber * 0.01;
                TbxMemo.Text += lastNumber;
            }
        }

        private void operationButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender == Btn_Plus)
            {
                TbxMemo.Text += Btn_Plus.Content.ToString();
                selectedOperator = SelectedOperator.Addition;
            }
            if (sender == Btn_Minus)
            {
                TbxMemo.Text += Btn_Minus.Content.ToString();
                selectedOperator = SelectedOperator.Subtraction;
            }
            if (sender == Btn_Multi)
            {
                TbxMemo.Text += Btn_Multi.Content.ToString();
                selectedOperator = SelectedOperator.Multiplication;
            }
            if (sender == Btn_Div)
            {
                TbxMemo.Text += Btn_Multi.Content.ToString();
                selectedOperator = SelectedOperator.Division;
            }
        }

        private void numberButton_Click(object sender, RoutedEventArgs e)
        {
            int selectedValue = 0;
            if(sender == Btn0)
            {
                selectedValue = 0;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn1)
            {
                selectedValue = 1;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn2)
            {
                selectedValue = 2;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn3)
            {
                selectedValue = 3;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn4)
            {
                selectedValue = 4;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn5)
            {
                selectedValue = 5;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn6)
            {
                selectedValue = 6;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn7)
            {
                selectedValue = 7;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn8)
            {
                selectedValue = 8;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
            }
            if (sender == Btn9)
            {
                selectedValue = 9;
                if (TbxMemo.Text.ToString() == "0")
                {
                    TbxMemo.Text = selectedValue.ToString();
                }
                else
                {
                    TbxMemo.Text += selectedValue.ToString();
                }
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
