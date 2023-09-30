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
            Process.GetCurrentProcess().Kill();
        }

        #region < 메트로윈도우 화면 닫을 때 이벤트 >
        private void BtnExitProgram_Click(object sender, RoutedEventArgs e)
        {
            // 메트로윈도우 화면 닫을 때 이벤트 핸들러 호출
            MetroWindow_Closing(sender, new System.ComponentModel.CancelEventArgs());
        }
        #endregion

        #region < 무게 메뉴 클릭 시 창 이동 이벤트 >
        private void MnuWeight_Click(object sender, RoutedEventArgs e)
        {
            var weight = new Views.Weight();
            ActiveItem.Content = weight;
            StsSelScreen.Content = "Weight";
        }
        #endregion

        #region < 기록입력 메뉴 클릭 시 창 이동 이벤트 >
        private void MnuExerciseRecord_Click(object sender, RoutedEventArgs e)
        {
            var record = new Views.ExerciseRecord();
            ActiveItem.Content = record;
            StsSelScreen.Content = "Record";
        }
        #endregion

        #region < 기록조회 메뉴 클릭 시 창 이동 이벤트 >
        private void MnuExerciseRecordTotal_Click(object sender, RoutedEventArgs e)
        {
            var recordTotal = new Views.ExerciseRecordTotal();
            ActiveItem.Content = recordTotal;
            StsSelScreen.Content = "TotalRecord";
        }
        #endregion

        #region < 설명 메뉴 클릭 시 창 이동 이벤트 >
        private void MnuExerciseInfo_Click(object sender, RoutedEventArgs e)
        {
            var exerciseInfo = new Views.Exercise.Explain();
            ActiveItem.Content = exerciseInfo;
            StsSelScreen.Content = "Explain";
        }
        #endregion

        #region < 대회 만들기 클릭 시 창 이동 이벤트 >
        private void MnuCompetitionMake_Click(object sender, RoutedEventArgs e)
        {
            var makeCompetition = new Views.Competition.MakeCompetition();
            ActiveItem.Content = makeCompetition;
            StsSelScreen.Content = "Make Competition";
        }
        #endregion

        #region < 대회 정보 클릭 시 창 이동 이벤트 >
        private void MnuCompetitionInfo_Click(object sender, RoutedEventArgs e)
        {
            var competitionInfo = new Views.Competition.CompetitionInfo();
            ActiveItem.Content = competitionInfo;
            StsSelScreen.Content = "Competition Info";
        }
        #endregion

        private void MnuCompetitionRecord_Click(object sender, RoutedEventArgs e)
        {
            var competitionRecord = new Views.Competition.CompetitionRecord();
            ActiveItem.Content = competitionRecord;
            StsSelScreen.Content = "Competition Record";
        }
    }
}
