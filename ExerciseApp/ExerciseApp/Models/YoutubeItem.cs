using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;

namespace ExerciseApp.Models
{
    internal class YoutubeItem
    {
        public string Name { get; set; }
        public string URL { get; set; }
        public BitmapImage Thumbnail { get; set; }

        public YoutubeItem(string name, string url)
        {
            Name = name;
            URL = url;
            // Thumbnail = thumbnail;
        }
    }
}
