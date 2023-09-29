using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExerciseApp.Models
{
    internal class CompetitionItem
    {
        // 입력쪽 변수
        private string inCompetitionName { get; set; }
        
        // 출력쪽 변수
        private string outCompetitionName { get; set; }

        public string InCompetitionName
        {
            get => inCompetitionName;
            set
            {
                inCompetitionName = value;
                //RaisePropertyChanged(nameof(InCompetitionName)); // InCompetitionName 이라는 문자열 들어가져 시스템에 알려줌
            }
        }
    }
}
