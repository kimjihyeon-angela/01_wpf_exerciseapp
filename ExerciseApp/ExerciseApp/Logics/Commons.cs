using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using System.Threading.Tasks;
using System.Windows;

namespace ExerciseApp.Logics
{
    public class Commons
    {

        // UserControl 같이 자식 클래스면서 MetroWindow를 직접 사용하지 않아 MahApps.Metro에 있는 MetroMessage창 사용 불가능할때
        // 아래 방법 사용
        public static async Task<MessageDialogResult> ShowCustomMessageAsync(string title, string message,
            MessageDialogStyle style = MessageDialogStyle.Affirmative)
        {
            return await ((MetroWindow)Application.Current.MainWindow).ShowMessageAsync(title, message, style, null);
        }
    }
}
