# wpf_exerciseApp
Make ExerciseApp alone_using WPF

WPF를 활용해서 운동 관련 앱 만들어보기 도전

## 01
- 델파이를 활용하여 만든 앱 다시 확인해보기
- 주제 선정 이유 다시 확인
  - 운동 기록을 저장하고 쉽게 볼 수 있는 공간 만들기
  - 운동 내용 한눈에 확인할 수 있는 공간 만들기
  - 같은 운동 하는 사람들과의 의견 공유할 수 있는 공간 만들기
  - 내 운동 성장 그래프와 같은 운동 하는 사람들과의 운동 능력 비교하는 공간 만들기
  - 위 4가지의 공간을 만들고 싶다는 생각에 운동 관련 앱을 만들고 싶었음
- 만들고 싶은 기능 정리
  - 운동 기록
    - 운동 기록 입력
    - 여러 회원들의 기록 한번에 볼 수 있는 표 제공
    - 같은 운동을 한 경우 이전의 기록과 비교해 볼 수 있는 성장 그래프 제공
  - 운동 내역
    - 어떤 운동을 했는지 한눈에 파악 할 수 있도록 달력 제공
    - 날짜를 선택하면 자세하게 했던 운동 제공 
  - 대회방
    - 대회만들기 제공
    - 나의 기록, 순위를 실시간으로 볼 수 있도록 제공
  - 운동 설명
    - 오늘의 운동 관련 동작 설명을 유튜브 등을 활용하여 제공
  - 무게 계산
    - 운동할 때 마다 각자의 무게를 직접 계산해야 하는 번거로움에 기록을 저장해놓을 경우 자동으로 무게 계산하여 퍼센트에 맞는 무게 제공
    - 계산기 기능
  - 커뮤니티
    - 커뮤니티를 통해 공지사항 전달
    - 글쓰기 기능을 통해 서로에게 피드백할 수 있는 공간 제공
- 메인 화면에 메뉴바 넣기

## 02
- 메뉴바 클릭 시 해당 화면 만들기 및 띄우기

## 03
- 운동 -> 기록 화면 연동하기
  - page로 만들 경우 화면이 뜨지 않았음 -> usercontrol 활용하니까 화면이 나왔음
    - ActiveItem == ContentControl -> ContentControl에서 화면 띄우려면 usercontrol 필요 
  - 기록 화면 디자인 확인하면서 만들기
    - 난이도 설정부분 디자인 수정필요 (완료)
    - statusbar 이름 변경 필요 (완료)
    <img src="https://raw.githubusercontent.com/kimjihyeon-angela/01_wpf_exerciseapp/main/images/record.png" width="700"/>
    
    <델파이로 만든 디자인 화면>
    
    <img src="https://raw.githubusercontent.com/kimjihyeon-angela/01_wpf_exerciseapp/main/images/new_record.png" width="700" />
    
    <wpf를 활용하여 만든 디자인화면>
    
    
    
- 솔루션 이름 바꾸기 하고 현재 파일이 열리지 않고 있음
  - 이에 대한 해결방법을 찾아야함 (찾지 못할 경우 다시 만들어야하는 불상사 발생,,!)
  - 경로가 잘못되었다는 오류였음
    - 해당 파일속성에서 경로를 새로 설정해주면 되는 문제였다~
- 전체기록 디자인 하기
  - 기록 창에서 전체기록보기 클릭 시 전체기록 화면 뜨게 만들기

## 04
- 무게
  -> 무게 입력안했을 경우 메시지 띄우기
  -> 무게 입력 후 무게 기준 혹은 성별 선택안했을 경우 메시지 띄우기
    - radiobutton
      - .IsChecked.Value 를 통해 True, False 확인
      - 두 개(무게기준(kg/lbs) / 성별(남/여)) 다 False일 경우 혹은 둘 중 하나(무게기준 / 성별)가 False일 경우 메시지 띄우기
  -> kg/ lbs 기준 플레이트 개수 계산하기
- 무게 파트 시작하기
  - 1RM 기록 입력 할 수 있는 부분
  - 10% ~ 150%까지의 기록 계산해서 출력해주는 부분 (디자인, 버튼클릭 이벤트)
  - 플레이트 계산까지,,?
  - 계산기 넣기

## 05
- 누겟패키지 정리
- 무게파트
  - 해보고 싶은거
    - kg / lbs 계산해서 무게 계산 및 세팅(플레이트 계산)까지
    - 계산기 완성

## 06
- 대회만들기 화면 디자인 시작
  - 추가해야 할 것
    - 박스별 or 개인 선택
    - 박스 콤보박스 불러오기
    - 개인 정보 입력하기
    - db 저장
- 운동 검색하기 화면 디자인 시작
  - youtube 화면에 뜨게 만들기
    - cefSharp 이용했었는데 현재 누겟 다운이 안됨
   
## 07
- cefSharp 다운 완료
  - youtube 연결 시도
    - 해당 창이 아예 안열림
    - 해야 할 일
      - 원인 찾아보기
      - 우선 화면 부터 열리게 해보기

## 08
- 대회만들기 화면 디자인
  - 대회정보 입력 완료 후 확인 버튼 클릭 시 대회 참가자 정보 입력할 수 있는 화면 나옴
  - mah에서는 watermark 기능이 있으나 mah를 사용하면 usercontrol 사용 불가, contentcontrol에서 사용이 불가함
  - watermark 기능을 활용하기 위해 방법을 찾아야 했음
    - textbox와 textblock을 동시에 사용하는 방법이었음
    - 기본 설정
      - textbox background={x:null}
      - textblock Text="원하는 문구", Foreground = "Gray"(watermark 느낌 내기 위함)
    - textbox
      - TextChanged, LostFocus, GotFocus 이벤트 넣기
    - TextChanged
      - textbox의 텍스트가 빈값일 경우 TextBlock.visibility = Visibility.Visible 해주기
      - 아닐경우 TextBlock.Visibility = Visibility.Hidden 해주기
    - LostFocus
      - TextBlock.Visibility = Visibility.Hidden 해주기
    - GotFoucus
      - textbox의 텍스트가 빈값일 경우 TextBlock.visibility = Visibility.Visible 해주기
