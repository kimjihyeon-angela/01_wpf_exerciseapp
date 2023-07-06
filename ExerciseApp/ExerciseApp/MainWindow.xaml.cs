using ControlzEx.Theming;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using ExerciseApp.Logics;
using ExerciseApp.Views;
using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;

namespace ExerciseApp
{
    /// <summary>
    /// MainWindow.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class MainWindow : MetroWindow
    {
      
        public MainWindow()
        {
            InitializeComponent();
            ThemeManager.Current.ThemeSyncMode = ThemeSyncMode.SyncWithAppMode;
            ThemeManager.Current.SyncTheme();
        }

        private void MetroWindow_Loaded(object sender, RoutedEventArgs e)
        {
            // ActiveItem.Content = new Views.DataBaseMonPage();
            // Frame => Page.xaml
            // ContentControl => UserControl.xaml사용해야함

            // ActiveItem.Content = new Views.DataBaseControl();
        }

        #region < 끝내기 버튼 클릭 이벤트 핸들러 >
        private void MnuExitSubscribe_Click(object sender, RoutedEventArgs e)
        {
            //Environment.Exit(0);

            // 위, 아래 둘 중 하나만 사용하면 됨
            // 작업 관리자에서 프로세스 종료와 같은 역할
            Process.GetCurrentProcess().Kill();
        }
        #endregion

        #region < MQTT 시작메뉴 클릭 이벤트 핸들러 >
        private void MnuStartSubscribe_Click(object sender, RoutedEventArgs e)
        {
            var mqttPopWin = new MqttPopupWindow();
            mqttPopWin.Owner = this;
            mqttPopWin.WindowStartupLocation = WindowStartupLocation.CenterOwner;
            var result = mqttPopWin.ShowDialog();
            
            if (result == true)
            {
                var userControl = new Views.DataBaseControl();
                ActiveItem.Content = userControl;
                //StsSelScreen.Content = typeof(Views.DataBaseControl);
                StsSelScreen.Content = "DataBase Monitoring";
            }
        }
        #endregion

        private async void MetroWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            // e.Cancel을 true 하고 시작
            e.Cancel = true;

            var mySettings = new MetroDialogSettings
                                 {
                                     AffirmativeButtonText = "종료",
                                     NegativeButtonText = "취소",
                                     AnimateShow = true,
                                     AnimateHide = true
                                 };

            var result = await this.ShowMessageAsync("프로그램을 종료","프로그램을 종료하시겠습니까?",
                                                     MessageDialogStyle.AffirmativeAndNegative, mySettings);
        }

        #region < 메뉴버튼 클릭 시 창 이동 이벤트 >
        private void BtnExitProgram_Click(object sender, RoutedEventArgs e)
        {
            // 메트로윈도우 화면 닫을 때 이벤트 핸들러 호출
            MetroWindow_Closing(sender, new System.ComponentModel.CancelEventArgs());
        }
        #endregion

        private void MnuWeight_Click(object sender, RoutedEventArgs e)
        {
            var weight = new Views.Weight();
            ActiveItem.Content = weight;
            StsSelScreen.Content = "Weight";
        }

        private void MnuExerciseRecord_Click(object sender, RoutedEventArgs e)
        {
            var record = new Views.ExerciseRecord();
            ActiveItem.Content = record;
            StsSelScreen.Content = "Record";
        }

        private void MnuExerciseRecordTotal_Click(object sender, RoutedEventArgs e)
        {
            var recordTotal = new Views.ExerciseRecordTotal();
            ActiveItem.Content = recordTotal;
            StsSelScreen.Content = "TotalRecord";
        }
    }
}
