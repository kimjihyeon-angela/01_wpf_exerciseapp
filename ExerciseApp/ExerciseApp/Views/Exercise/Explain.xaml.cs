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
using CefSharp;
using CefSharp.Wpf;
using ExerciseApp.Models;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;

namespace ExerciseApp.Views.Exercise
{
    /// <summary>
    /// Explain.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Explain : Page
    {
        List<YoutubeItem> youtubeItems; // Youtube API 검색결과 담을 리스트
        public Explain()
        {
            InitializeComponent();
        }

        // Youtube API Key = AIzaSyBzjAhHmmxKlKjR28do6R7Klua3CIPX3Ds

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //youtubeItems = new List<YoutubeItem>();
            SearchYoutubeApi();
        }

        private async void SearchYoutubeApi()
        {
            await LoadDataCollection();
            //TbxExerciseName.Text = youtubeItems.;
        }

        private async Task LoadDataCollection()
        {
            var youtubeService = new YouTubeService(
                new BaseClientService.Initializer()
                {
                    ApiKey = "AIzaSyBzjAhHmmxKlKjR28do6R7Klua3CIPX3Ds",
                    ApplicationName = this.GetType().ToString()
                });

            var request = youtubeService.Search.List("snippet");
            request.Q = TbxExerciseName.Text;
            request.MaxResults = 10;

            var response = await request.ExecuteAsync();

            //MessageBox.Show(response.ToString());
            foreach (var item in response.Items)
            {
                if (item.Id.Kind.Equals("youtube#video"))
                {
                    YoutubeItem youtube = new YoutubeItem(
                        item.Snippet.Title,
                        //item.Snippet.ChannelTitle,
                        $"https://www.youtube.com/watch?v={item.Id.VideoId}");

                    // 섬네일 이미지
                    youtube.Thumbnail = new BitmapImage(new Uri(item.Snippet.Thumbnails.Default__.Url,
                                                         UriKind.RelativeOrAbsolute));
                    youtubeItems.Add(youtube);
                }
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            youtubeItems = new List<YoutubeItem>();
        }
    }
}
