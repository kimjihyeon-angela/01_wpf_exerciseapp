using ExerciseApp.Logics;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Utilities.Collections;
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

namespace ExerciseApp.Views.Competition
{
    /// <summary>
    /// MakeCompetition.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class MakeCompetition : UserControl
    {
        public MakeCompetition()
        {
            InitializeComponent();
        }

        private void btnCheck_Click(object sender, RoutedEventArgs e)
        {
            InfoGrid.Visibility = Visibility.Visible;
            using (MySqlConnection conn = new MySqlConnection(Commons.myConnString))
            {
                var query = @"INSERT INTO competition.makecompetition
                                        (competitionName,
                                        competitionStartDate,
                                        competitionEndDate)
                            VALUES
                                        (@competitionName,
                                        @competitionStartDate,
                                        @competitionEndDate);";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("competitionName", tbxCompetitionName.Text);
                cmd.Parameters.AddWithValue("competitionStartDate", StartDate);
                cmd.Parameters.AddWithValue("competitionEndDate", EndDate);

                cmd.ExecuteNonQuery();
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            InfoGrid.Visibility = Visibility.Hidden;
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            InfoGrid.Visibility = Visibility.Hidden;
        }

        private void tbxCompetitionName_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (tbxCompetitionName.Text == "")
            {
                tbkCompetitionName.Visibility = Visibility.Visible;
            }
            else
            {
                tbkCompetitionName.Visibility = Visibility.Hidden;
            }
        }

        private void tbxCompetitionName_GotFocus(object sender, RoutedEventArgs e)
        {
            tbkCompetitionName.Visibility = Visibility.Hidden;
        }

        private void tbxCompetitionName_LostFocus(object sender, RoutedEventArgs e)
        {
            if (tbxCompetitionName.Text == "")
            {
                tbkCompetitionName.Visibility = Visibility.Visible;
            }
        }

        private void tbxName_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (tbxName.Text == "")
            {
                tbkName.Visibility = Visibility.Visible;
            }
            else
            {
                tbkName.Visibility = Visibility.Hidden;
            }
        }

        private void tbxName_GotFocus(object sender, RoutedEventArgs e)
        {
            tbkName.Visibility = Visibility.Hidden;
        }

        private void tbxName_LostFocus(object sender, RoutedEventArgs e)
        {
            if (tbxName.Text == "")
            {
                tbkName.Visibility = Visibility.Visible;
            }
        }

        private void tbxPhoneNum_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (tbxPhoneNum.Text == "")
            {
                tbkPhoneNum.Visibility = Visibility.Visible;
            }
            else
            {
                tbkPhoneNum.Visibility = Visibility.Hidden;
            }
        }

        private void tbxPhoneNum_GotFocus(object sender, RoutedEventArgs e)
        {
            tbkPhoneNum.Visibility = Visibility.Hidden;
        }

        private void tbxPhoneNum_LostFocus(object sender, RoutedEventArgs e)
        {
            if (tbxPhoneNum.Text == "")
            {
                tbkPhoneNum.Visibility = Visibility.Visible;
            }
        }

        private void btnCancel2_Click(object sender, RoutedEventArgs e)
        {
            InfoGrid.Visibility = Visibility.Hidden;
        }
    }
}
