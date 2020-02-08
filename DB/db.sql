-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2019 at 12:58 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `live_tv_app_buyer`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `image`) VALUES
(1, 'admin', 'admin', 'viaviwebtech@gmail.com', 'profile.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`, `status`) VALUES
(1, 'Sports', '18595_4665.jpg', 1),
(2, 'Fashion', '94282_fashionchannels.png', 1),
(3, 'Entertainment', '44775_shutterstock_624398861.jpg', 1),
(4, 'News', '66925_PJ_2016.07.07_Modern-News-Consumer_0-01.png', 1),
(5, 'Kids', '88870_children-happy.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_channels`
--

CREATE TABLE `tbl_channels` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `channel_type` varchar(255) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` text NOT NULL,
  `channel_type_ios` varchar(255) NOT NULL,
  `channel_url_ios` text NOT NULL,
  `channel_poster` text NOT NULL,
  `channel_thumbnail` varchar(255) NOT NULL,
  `channel_desc` text NOT NULL,
  `featured_channel` int(1) NOT NULL DEFAULT '0',
  `slider_channel` int(1) NOT NULL DEFAULT '0',
  `total_views` int(11) NOT NULL DEFAULT '0',
  `total_rate` int(11) NOT NULL DEFAULT '0',
  `rate_avg` decimal(11,2) NOT NULL DEFAULT '0.00',
  `user_agent` varchar(60) NOT NULL,
  `user_agent_type` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_channels`
--

INSERT INTO `tbl_channels` (`id`, `cat_id`, `channel_type`, `channel_title`, `channel_url`, `channel_type_ios`, `channel_url_ios`, `channel_poster`, `channel_thumbnail`, `channel_desc`, `featured_channel`, `slider_channel`, `total_views`, `total_rate`, `rate_avg`, `user_agent`, `user_agent_type`, `status`) VALUES
(8, 3, 'youtube', 'MTV', 'https://www.youtube.com/watch?v=j6muwUGdvXw', 'youtube', 'https://www.youtube.com/watch?v=agFMqNB9BYM', '', '88773_mtv.png', '<p>MTV gives you the hottest buzz from the entertainment world that will keep you hooked! Be the first to catch the latest MTV shows, music, artists and more!</p>\r\n', 1, 0, 1380, 9, '4.00', '', '', 1),
(12, 3, 'live_url', '9XM', 'http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8', 'youtube', 'https://www.youtube.com/watch?v=ohKmfO2spms&list=PLQTSj-_9v-TTdgheDMpJL326oToltMPGu', '', '51046_9xM.jpg', '<p>Bollywood Music at its best, thats what 9XM is all about.</p>\r\n', 1, 0, 790, 4, '5.00', '', '', 1),
(14, 1, 'live_url', 'Star Sports', 'http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8', 'youtube', 'https://www.youtube.com/watch?v=f6vRQ7rMWi4', '', '17953_star-sports-1.jpg', '<p>Watch Star Sports Live Streaming.</p>\r\n', 1, 0, 1283, 6, '4.00', '', '', 1),
(18, 5, 'youtube', 'WB Kids', 'https://www.youtube.com/watch?v=ESoXIeTLqxQ', 'youtube', 'https://www.youtube.com/watch?v=ESoXIeTLqxQ', '', '63074_WB_Kids.jpg', '<p>WBKids is the home of all of your favorite clips featuring characters from the Looney Tunes, Scooby-Doo, Tom and Jerry and More!</p>\r\n', 0, 0, 713, 4, '4.00', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `type` varchar(60) NOT NULL,
  `comment_on` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_episode`
--

CREATE TABLE `tbl_episode` (
  `id` int(10) NOT NULL,
  `series_id` int(5) NOT NULL,
  `season_id` int(11) NOT NULL,
  `episode_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `episode_type` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `episode_url` text COLLATE utf8_unicode_ci NOT NULL,
  `video_id` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `episode_poster` text COLLATE utf8_unicode_ci NOT NULL,
  `total_views` int(10) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_episode`
--

INSERT INTO `tbl_episode` (`id`, `series_id`, `season_id`, `episode_title`, `episode_type`, `episode_url`, `video_id`, `episode_poster`, `total_views`, `status`) VALUES
(1, 1, 1, 'Winter is coming', 'local', 'http://www.viaviweb.in/envato/cc/rewards_app_demo/uploads/S_landscape2.mp4', '', '20190_13931_got1.jpg', 0, 1),
(2, 1, 1, 'The Kingsroad', 'youtube_url', 'https://www.youtube.com/watch?v=mFdu_lvCTJA', 'mFdu_lvCTJA', '01072019125313_18522.jpg', 0, 1),
(3, 1, 1, 'Lord Snow', 'embedded_url', 'https://www.dailymotion.com/embed/video/x7btkcj', '', '01072019125504_24026.jpg', 0, 1),
(4, 1, 1, 'Cripples, Bastards, and Broken Things', 'youtube_url', '', '', '01072019125511_44315.jpg', 0, 1),
(5, 1, 1, 'The Wolf and the Lion', 'youtube_url', '', '', '01072019125041_53517.jpg', 0, 1),
(6, 1, 2, 'The North Remembers', 'youtube_url', 'https://www.youtube.com/watch?v=xmpdHrVfaTk', 'xmpdHrVfaTk', '12072019071340_75185.jpg', 0, 1),
(7, 1, 2, 'The Night Lands', 'youtube_url', 'https://www.youtube.com/watch?v=_KdSHWETfGM', '_KdSHWETfGM', '12072019071518_29315.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genres`
--

CREATE TABLE `tbl_genres` (
  `gid` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL,
  `genre_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genres`
--

INSERT INTO `tbl_genres` (`gid`, `genre_name`, `genre_image`) VALUES
(1, 'Horror', '88406_Horror.jpg'),
(3, 'Action', '33053_Action.jpg'),
(4, 'Thriller', '54577_Thrille.jpg'),
(5, 'Drama', '92886_Drama_2_23.jpg'),
(6, 'Love', '35754_LoveMovie.jpg'),
(7, 'Comedy', '95352_Comedy.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home`
--

CREATE TABLE `tbl_home` (
  `id` int(11) NOT NULL,
  `home_title` varchar(255) NOT NULL,
  `home_banner` varchar(255) NOT NULL,
  `home_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_home`
--

INSERT INTO `tbl_home` (`id`, `home_title`, `home_banner`, `home_url`) VALUES
(1, 'Star Sports', '27783_Star_Sports.png', 'http://bglive-a.bitgravity.com/ndtv/prolo/live/native'),
(3, 'ABP News', '88806_abp_english.jpg', 'http://bglive-a.bitgravity.com/ndtv/prolo/live/native');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE `tbl_language` (
  `id` int(11) NOT NULL,
  `language_name` varchar(60) NOT NULL,
  `language_background` varchar(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_language`
--

INSERT INTO `tbl_language` (`id`, `language_name`, `language_background`, `status`) VALUES
(1, 'English', '11762E', 1),
(2, 'Hindi', 'E9900B', 1),
(3, 'Gujarati', '0BC1E9', 1),
(4, 'Telugu', 'E91E63', 1),
(5, 'Tamil', '034EE9', 1),
(6, 'Nepali', 'AD16E9', 1),
(7, 'عربى', 'E99871', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `id` int(11) NOT NULL,
  `language_id` int(5) NOT NULL,
  `genre_id` varchar(50) NOT NULL,
  `movie_type` varchar(60) NOT NULL,
  `movie_title` varchar(255) NOT NULL,
  `movie_cover` text NOT NULL,
  `movie_poster` text NOT NULL,
  `movie_url` text NOT NULL,
  `video_id` varchar(150) NOT NULL,
  `movie_desc` longtext NOT NULL,
  `total_views` int(11) NOT NULL DEFAULT '0',
  `total_rate` varchar(30) NOT NULL DEFAULT '0',
  `rate_avg` varchar(30) NOT NULL DEFAULT '0',
  `is_featured` int(1) NOT NULL DEFAULT '0',
  `is_slider` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`id`, `language_id`, `genre_id`, `movie_type`, `movie_title`, `movie_cover`, `movie_poster`, `movie_url`, `video_id`, `movie_desc`, `total_views`, `total_rate`, `rate_avg`, `is_featured`, `is_slider`, `status`) VALUES
(3, 1, '3', '', 'Spider-Man: Homecoming Movie Review', '22167_spider_poster.0.jpg', '9348_spider_poster.0.jpg', '', '', '<p><strong>SPIDER-MAN: HOMECOMING&nbsp;</strong><strong>STORY :</strong>&nbsp;It&#39;s been a while since Captain America: Civil War, where an ecstatic and starstruck teen Spider-Man/Peter Parker (Tom Holland) rubbed shoulders with the mighty Avengers. Months later, Peter yearns for the heroic experience once again. But mentor Tony Stark aka Iron Man (Robert Downey Jr) advises him to go back to school and patiently wait for his moment of glory, when he can assist the Avengers.<br />\r\n<br />\r\n<strong>SPIDER-MAN: HOMECOMING&nbsp;</strong><strong>REVIEW :&nbsp;</strong>However, patience is certainly not the boy&rsquo;s virtue. Desperate to earn a sensational &#39;job offer&#39; from Stark, the trainee masked crusader curbs petty robberies and scouts for a crime worthy enough to fight. He soon runs into &lsquo;Vulture&rsquo; (Michael Keaton), a man who poses real threat to lives. Can Spider-boy take him down?<br />\r\n<br />\r\nJon Watts starts his film with a clean slate. Unlike the previous outings, his Spider-Man reboot doesn&rsquo;t necessarily have the aura of a superhero epic. He gives it a quirky campus-caper twist, which evokes mixed views initially. His Peter is solely focussed on being an A list (Avengers like) superhero. There are no sob stories of Uncle Ben or Aunt May either. May in fact, is a hottie (Marisa Tomei)! Once you warm up to Watts&rsquo; vision, this Spidey film, replete with humour and thrilling stunt scenes, grows on you and tugs at your heartstrings eventually.</p>\r\n', 7, '0', '0', 0, 0, 1),
(5, 3, '7', '', 'Chhello Divas', '64111_Chhello-Divas-Gujarati-Movie-Review.jpg', '196_MV5BMTViN2VlN2QtYjc3Zi00M2EzLWIyNWItZDI5MTUwNmYyMWVkXkEyXkFqcGdeQXVyNjQzNTMxNDQ@._V1_.jpg', '', '', '<p>The movie revolves around the lives of eight friends and their journey of growing up while they face the highs and lows of their relationships, love and romance, the end of their college days and the beginning of a new life.</p>\r\n\r\n<p>Chhello Divas (2015) Directed by Krishnadev Yagnik is a light hearted comedy movie with some really good punches. The movie revolves around college life of eight friends and their journey of their graduation.<br />\r\n<br />\r\nThis is my first review for a Gujarati movie. I think Gujarati cinema is becoming a mainstream cinema and taking steps forward with big budget films and a full-fledged theatrical releases all over India after Kevi Rite Jaish and Bey Yaar.<br />\r\n<br />\r\nTalking about this movie, had enjoyed a lot while watching and relive that college time memories again. The dialouges are truly gujju which will be stay back with you till long as you can relate them with the day to day situation.<br />\r\n<br />\r\nWhen we talk about the technical aspect there are some flaws in the movie, the background score was too over and some scenes looks too over dramatic because of that.Acting was brilliant by all lead actors except Loy (Mitra Gadhvi) in some scenes.<br />\r\n<br />\r\nOverall it was a brilliant effort to make such a good cinema. Will look forward for more good movies from this industry.</p>\r\n', 0, '0', '0', 1, 0, 1),
(7, 1, '3', '', 'The Fate of the Furious 8 ', '16961_noticias2010_-3672742.jpg', '58677_b125d7b60c2141bf409bf61112fb4201.jpg', '', '', '<p>Now that Dom and Letty are on their honeymoon and Brian and Mia have retired from the game-and the rest of the crew has been exonerated-the globetrotting team has found a semblance of a normal life. But when a mysterious woman seduces Dom into the world of crime he can&#39;t seem to escape and a betrayal of those closest to him, they will face trials that will test them as never before. From the shores of Cuba and the streets of New York City to the icy plains off the arctic Barents Sea, the elite force will crisscross the globe to stop an anarchist from unleashing chaos on the world&#39;s stage... and to bring home the man who made them a family.</p>\r\n', 5, '0', '0', 0, 0, 1),
(10, 2, '3', '', 'Sultan (2016 film)', '21919_maxresdefault.jpg', '98596_MV5BNDc0OTU3M2MtMGFhMi00ZGVlLWI4YmItODA1ZTc0OGY0NmJlXkEyXkFqcGdeQXVyNjQ2MjQ5NzM@._V1_.jpg', '', '', '<p>Sultan is a story of Sultan Ali Khan - a local wrestling champion with the world at his feet as he dreams of representing India at the Olympics. It&#39;s a story of Aarfa - a feisty young girl from the same small town as Sultan with her own set of dreams. When the 2 local wrestling legends lock horns, romance blossoms and their dreams and aspirations become intertwined and aligned. However, the path to glory is a rocky one and one must fall several times before one stands victorious - More often than not, this journey can take a lifetime. Sultan is a classic underdog tale about a wrestler&#39;s journey, looking for a comeback by defeating all odds staked up against him. But when he has nothing to lose and everything to gain in this fight for his life match... Sultan must literally fight for his life. Sultan believes he&#39;s got what it takes... but this time, it&#39;s going to take everything he&#39;s got.</p>\r\n', 2, '0', '0', 0, 0, 1),
(16, 4, '5', '', 'Baahubali 2: The Conclusion', '83394_baahubali-2-review-rating.jpg', '13060_711eHgGtnFL._SX522_.jpg', '', '', '<p>Yes, the movie cannot be skipped, as the first part and the twist question at the end ensure we all will flock to the theatres. So, I&#39;ll dwelve rather on what one expected from the movie and what one got.<br />\r\n<br />\r\nExp -Magnum opus with brilliant VFX Act - Brilliant VFX indeed with Kingdom, Dream sequences and war scenes portrayed effectively to border disbelief<br />\r\n<br />\r\nExp - Enhancing the character of Bahubali n son, Devsana, Bhallaldev, Sivagami and Kattappa with brilliant one- liners. Act - Characters watered down with very few one-liners to keep the audience hooked. Sivagami&#39;s fierceness gets lost, Kattappa&#39;s loyalty questioned, Bhallaldev&#39;s might becomes more brain than brawn and worst, even Bahubali ends up wasting his arm strength and skills<br />\r\n<br />\r\nExp- A nuanced script where politics and drama get overshadowed by pure heroics and camera following lead character all the time. Act- A muddled script reminiscent of good old Mahabharat serial of schemes and sub- schemes where Bahubali keeps losing without any retribution<br />\r\n<br />\r\nExp - Music which would create awe and timed beautifully to take the movie forward. Act - BGM remains good enough, but the songs didn&#39;t deliver, especially the romantic number between Devsana and Bahubali on which a good share of budget gets wasted<br />\r\n<br />\r\nExp - Last but not the least, an epic climax and final war, which would go on for an hour and where Sivadu finally manages to kill Bhallaldev against all odds Act - Kind of anti climax, which feels edited too much and put together fast enough to ensure reasonable running time and enough shows to hit Rs. 500 Crs collection in a week<br />\r\n<br />\r\nAll in all, somewhere the commercials seem to have overtaken the story, melodrama overshadowing an epic in making and VFX substituting genuine acting.<br />\r\n<br />\r\nIndependently, keeping aside the expectations, the film has been done well, with good BGM, main characters building up muscles, graphics team putting a lot of efforts and the costumes team doing well too. The love story between Bahubali and Devsana develops like a typical Bollywood potboiler with fake acting and a caricature wannabe boyfriend in the middle; finally blooming to a romance with a dream sequence in clouds on a flying ship. Anushka shetty as Devasena, to her credit delivers a wonderful performance as the young devasana with strong dialogues and attitude.<br />\r\n<br />\r\nHowever, as the &#39;Conclusion&#39; ends and a dialogue giving a hint of another sequel pours out, the excitement of crowd is nowhere to be seen. But for those times where you have open mouth stared and cheered for our hero when he nonchalantly massacred people, conquered animals and even challenged nature, &#39;Jai Mahishmati&#39;.</p>\r\n', 3, '0', '0', 1, 0, 1),
(17, 4, '7', '', 'Duvvada Jagannadham', '41676_59236474.jpg', '19335_rgxpyzifgbgbe.jpg', '', '', '<p>Duvvada Jagannadham or DJ is an Indian Telugu-language action comedy film written and directed by Harish Shankar and produced by Dil Raju under his banner Sri Venkateswara Creations. The film stars Allu Arjun and Pooja Hegde. Devi Sri Prasad composed the film&#39;s music while Ayananka Bose handled the cinematography. Principal photography commenced in August 2016 in Hyderabad.[1] Abu Dhabi[2] was also a filming location; the production crew chose Abu Dhabi, as they would benefit from the Emirate&#39;s 30% film production rebate.</p>\r\n', 29, '0', '0', 1, 0, 1),
(19, 7, '5', 'local', 'القادمة الرابعة بعد يوم', '35364_coming-forth-by-day-2012-001-old-vs-new-architecture.jpg', '16704_MV5BMjI5OTY0ODY5Ml5BMl5BanBnXkFtZTcwMjQzMzI2OQ@@._V1_.jpg', '18072019014024_19597.mp4', '', '<p>أولئك الذين استمتعوا بالكامل بأجسادهم لا يمكن أن يكونوا خاضعين. وأولئك الذين ليس لديهم أبدا؟ هل يمكنهم الصمود في عبودية العزلة والقبول العاجز لما لا يمكنهم تغييره أو احتضانه؟ هذه هي قصة كل يوم لامرأتين تعتنين برجلهم المريض.</p>', 44, '0', '0', 0, 0, 1),
(20, 1, '3', 'youtube_url', 'Avengers Endgame', '37351_09B_AEG_DomPayoff_1Sht_REV-7c16828.jpg', '66924_dHjLaIUHXcMBt7YxK1TKWK1end9.jpg', 'https://www.youtube.com/watch?v=TcMBFSGVi1c', 'TcMBFSGVi1c', '<p>Twenty-three days after&nbsp;Thanos&nbsp;used the&nbsp;Infinity Gauntlet&nbsp;to disintegrate half of all life in the universe, Carol Danvers&nbsp;rescues&nbsp;Tony Stark&nbsp;and&nbsp;Nebula&nbsp;from deep space and returns them to Earth. They reunite with the remaining&nbsp;Avengers&mdash;Bruce Banner,&nbsp;Steve Rogers,&nbsp;Rocket,&nbsp;Thor,&nbsp;Natasha Romanoff, and&nbsp;James Rhodes&mdash;and find Thanos on an uninhabited planet. They plan to retake and use the&nbsp;Infinity Stones&nbsp;to reverse the disintegrations, but Thanos reveals he destroyed them to prevent further use. An enraged Thor decapitates Thanos.</p>\r\n\r\n<p>Five years later,&nbsp;Scott Lang&nbsp;escapes from the&nbsp;quantum realm. He travels to the Avengers&#39; compound, where he explains to Romanoff and Rogers that he experienced only five hours while trapped. Theorizing the quantum realm could allow&nbsp;time travel, the three ask Stark to help them retrieve the Stones from the past to reverse Thanos&#39; actions in the present, but Stark refuses to help. After talking with his wife,&nbsp;Pepper Potts, Stark relents and works with Banner, who has since merged his intelligence with the Hulk&#39;s strength and body, and the two successfully build a time machine. Banner warns that changing the past does not affect their present and any changes instead create branched&nbsp;alternate realities. He and Rocket go to the Asgardian refugees&#39; new home in&nbsp;Norway&nbsp;to recruit Thor, now an overweight alcoholic, despondent over his failure in stopping Thanos. In&nbsp;Tokyo, Romanoff recruits&nbsp;Clint Barton, now a ruthless vigilante following the disintegration of his family.</p>', 280, '2', '4', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `rate` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reports`
--

CREATE TABLE `tbl_reports` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report` text NOT NULL,
  `type` varchar(60) NOT NULL,
  `report_on` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_season`
--

CREATE TABLE `tbl_season` (
  `id` int(10) NOT NULL,
  `series_id` int(10) NOT NULL,
  `season_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_season`
--

INSERT INTO `tbl_season` (`id`, `series_id`, `season_name`, `status`) VALUES
(1, 1, 'Season-1', 1),
(2, 1, 'Season-2', 1),
(3, 1, 'Season-3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_series`
--

CREATE TABLE `tbl_series` (
  `id` int(10) NOT NULL,
  `series_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `series_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `series_poster` text COLLATE utf8_unicode_ci NOT NULL,
  `series_cover` text COLLATE utf8_unicode_ci NOT NULL,
  `total_views` int(11) NOT NULL DEFAULT '0',
  `total_rate` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `rate_avg` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `is_featured` int(1) NOT NULL DEFAULT '0',
  `is_slider` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_series`
--

INSERT INTO `tbl_series` (`id`, `series_name`, `series_desc`, `series_poster`, `series_cover`, `total_views`, `total_rate`, `rate_avg`, `is_featured`, `is_slider`, `status`) VALUES
(1, 'Game Of Thrones', '<p><em><strong>Game of Thrones</strong></em>&nbsp;is an American&nbsp;fantasy&nbsp;drama&nbsp;television series created by&nbsp;David Benioff&nbsp;and&nbsp;D. B. Weiss&nbsp;for&nbsp;HBO. It is an adaptation of&nbsp;<em>A Song of Ice and Fire</em>,&nbsp;George R. R. Martin&#39;s series of fantasy novels, the first of which is&nbsp;<em>A Game of Thrones</em>. The show was both produced and filmed in&nbsp;Belfast&nbsp;and elsewhere in the&nbsp;United Kingdom. Filming locations also included Canada, Croatia, Iceland, Malta, Morocco, and Spain. The series premiered on&nbsp;HBO&nbsp;in the United States on April 17, 2011, and concluded on May 19, 2019, with 73 episodes broadcast over eight seasons.</p>', '36869_got.jpg', '48629_d0bd7hlw0aagvyc-cropped.jpg', 189, '0', '0', 0, 0, 1),
(2, 'Arrow', '<p><em><strong>Arrow</strong></em>&nbsp;is an American&nbsp;superhero&nbsp;television series developed by&nbsp;Greg Berlanti,&nbsp;Marc Guggenheim, and&nbsp;Andrew Kreisberg&nbsp;based on the&nbsp;DC Comics&nbsp;character&nbsp;Green Arrow, a costumed crime-fighter created by&nbsp;Mort Weisinger&nbsp;and&nbsp;George Papp, and is set in the&nbsp;Arrowverse, sharing continuity with other Arrowverse television series. The series premiered in the United States on&nbsp;The CW&nbsp;on October 10, 2012, with international broadcasting taking place in late 2012 and primarily filmed in&nbsp;Vancouver,&nbsp;British Columbia, Canada.&nbsp;<em>Arrow</em>&nbsp;follows billionaire playboy&nbsp;Oliver Queen&nbsp;(Stephen Amell), who claimed to have spent five years shipwrecked on&nbsp;Lian Yu, a mysterious island in the North China Sea, before returning home to&nbsp;Starling City&nbsp;(later renamed &quot;Star City&quot;) to fight crime and corruption as a secret vigilante whose weapon of choice is a bow and arrow.</p>\r\n\r\n<p>Music</p>', '1374_arrow1.jpg', '78883_arrow.jpg', 91, '1', '4', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `envato_buyer_name` varchar(255) NOT NULL,
  `envato_purchase_code` varchar(255) NOT NULL,
  `envato_buyer_email` varchar(150) NOT NULL,
  `envato_purchased_status` int(1) NOT NULL DEFAULT '0',
  `package_name` varchar(255) NOT NULL,
  `ios_bundle_identifier` varchar(255) NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `onesignal_app_id` varchar(500) NOT NULL,
  `onesignal_rest_key` varchar(500) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `api_latest_limit` int(3) NOT NULL,
  `api_page_limit` int(5) NOT NULL,
  `api_cat_order_by` varchar(255) NOT NULL,
  `api_cat_post_order_by` varchar(255) NOT NULL,
  `api_lan_order_by` varchar(20) NOT NULL,
  `api_gen_order_by` varchar(20) NOT NULL,
  `publisher_id` varchar(500) NOT NULL,
  `interstital_ad` varchar(500) NOT NULL,
  `interstital_ad_id` varchar(500) NOT NULL,
  `interstital_ad_click` varchar(500) NOT NULL,
  `banner_ad` varchar(500) NOT NULL,
  `banner_ad_id` varchar(500) NOT NULL,
  `publisher_id_ios` varchar(500) NOT NULL,
  `app_id_ios` varchar(500) NOT NULL,
  `interstital_ad_ios` varchar(500) NOT NULL,
  `interstital_ad_id_ios` varchar(500) NOT NULL,
  `interstital_ad_click_ios` varchar(500) NOT NULL,
  `banner_ad_ios` varchar(500) NOT NULL,
  `banner_ad_id_ios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `envato_buyer_name`, `envato_purchase_code`, `envato_buyer_email`, `envato_purchased_status`, `package_name`, `ios_bundle_identifier`, `email_from`, `onesignal_app_id`, `onesignal_rest_key`, `app_name`, `app_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `api_latest_limit`, `api_page_limit`, `api_cat_order_by`, `api_cat_post_order_by`, `api_lan_order_by`, `api_gen_order_by`, `publisher_id`, `interstital_ad`, `interstital_ad_id`, `interstital_ad_click`, `banner_ad`, `banner_ad_id`, `publisher_id_ios`, `app_id_ios`, `interstital_ad_ios`, `interstital_ad_id_ios`, `interstital_ad_click_ios`, `banner_ad_ios`, `banner_ad_id_ios`) VALUES
(1, '', '', '', 0, 'com.example.livetvseries', 'com.viaviwebtech.LiveTV', 'info@viaviweb.in', '3f4a514f-20fd-4b84-9f16-ed8f191f8da5', 'N2NlYTk4ZjYtYzE3NC00OWI0LTk2ZDctYjc4OTBhYTcyODg1', 'Live TV ', 'App_icon.png', 'info@viaviweb.com', '2.1.5', 'Viavi Webtech', '+919227777522', 'www.viaviweb.com', '<p>Watch your favorite TV channels Live in your mobile phone with this application on your device. that support almost all format.The application is specially optimized to be extremely easy to configure and detailed documentation is provided.</p>\r\n', 'Viavi Webtech', '<p><strong>We are committed to protecting your privacy</strong></p>\r\n\r\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\r\n\r\n<p><strong>Information Collected</strong></p>\r\n\r\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\r\n\r\n<p><strong>Information Use</strong></p>\r\n\r\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorised access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information which allows a website to recognise your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\r\n\r\n<p><strong>Disclosing Information</strong></p>\r\n\r\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\r\n\r\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\r\n\r\n<p>In addition Dummy may work with third parties for the purpose of delivering targeted behavioural advertising to the Dummy website. Through the use of cookies, anonymous information about your use of our websites and other websites will be used to provide more relevant adverts about goods and services of interest to you. For more information on online behavioural advertising and about how to turn this feature off, please visit youronlinechoices.com/opt-out.</p>\r\n\r\n<p><strong>Changes to this Policy</strong></p>\r\n\r\n<p>Any changes to our Privacy Policy will be placed here and will supersede this version of our policy. We will take reasonable steps to draw your attention to any changes in our policy. However, to be on the safe side, we suggest that you read this document each time you use the website to ensure that it still meets with your approval.</p>\r\n\r\n<p><strong>Contacting Us</strong></p>\r\n\r\n<p>If you have any questions about our Privacy Policy, or if you want to know what information we have collected about you, please email us at hd@dummy.com. You can also correct any factual errors in that information or require us to remove your details form any list under our control.</p>\r\n', 15, 10, 'category_name', 'channel_title', 'id', 'genre_name', 'pub-9456493320432553', 'true', 'ca-app-pub-3940256099942544/1033173712', '5', 'true', 'ca-app-pub-3940256099942544/6300978111', 'pub-8356404931736973', 'ca-app-pub-8356404931736973~1544820074', 'true', 'ca-app-pub-3940256099942544/4411468910', '5', 'true', 'ca-app-pub-3940256099942544/2934735716');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `confirm_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_channels`
--
ALTER TABLE `tbl_channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_episode`
--
ALTER TABLE `tbl_episode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_genres`
--
ALTER TABLE `tbl_genres`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `tbl_home`
--
ALTER TABLE `tbl_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_language`
--
ALTER TABLE `tbl_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_season`
--
ALTER TABLE `tbl_season`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_series`
--
ALTER TABLE `tbl_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_channels`
--
ALTER TABLE `tbl_channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_episode`
--
ALTER TABLE `tbl_episode`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_genres`
--
ALTER TABLE `tbl_genres`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_home`
--
ALTER TABLE `tbl_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_language`
--
ALTER TABLE `tbl_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_season`
--
ALTER TABLE `tbl_season`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_series`
--
ALTER TABLE `tbl_series`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
