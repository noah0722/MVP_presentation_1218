class AppConstants {
  // App information
  static const String appName = 'Commune';
  static const String appVersion = '1.0.0';

  // Admin
  static const String adminEmail = 'youngkwonyu@gmail.com';

  // Firestore collections
  static const String usersCollection = 'users';
  static const String musCollection = 'mus';
  static const String postsCollection = 'posts';
  static const String commentsCollection = 'comments';
  static const String commoreTransactionsCollection = 'commoreTransactions';

  // Storage paths
  static const String muProfileImagesPath = 'mu_profile_images';
  static const String muBannerImagesPath = 'mu_banner_images';
  static const String postImagesPath = 'post_images';
  static const String postVideosPath = 'post_videos';

  // Commore points
  static const int joinMuPoints = 50;
  static const int createPostPoints = 10;
  static const int commentPoints = 5;
  static const int replyPoints = 3;

  // Post types
  static const String postTypeText = 'text';
  static const String postTypeImage = 'image';
  static const String postTypeVideo = 'video';
  static const String postTypeLink = 'link';
  static const String postTypePoll = 'poll';

  // Mu categories
  static const Map<String, List<String>> muCategories = {
    '정치': ['기관', '정치인', '정당', '뉴스', '여론조사', '선거'],
  };

  // Initial Mus
  static const Map<String, Map<String, String>> initialMus = {
    '기관': {
      '국회': 'institution',
    },
    '정치인': {
      '이재명': 'congressman',
      '안철수': 'congressman',
      '이준석': 'congressman',
      '김재섭': 'congressman',
      '조국': 'congressman',
      '홍준표': 'governor',
      '윤석열': 'president',
      '한동훈': 'politician',
    },
    '정당': {
      '국민의힘': 'party',
      '더불어민주당': 'party',
    },
    '뉴스': {
      '연합뉴스': 'media',
      '조선일보': 'media',
      '한겨레': 'media',
    },
    '여론조사': {
      '한국갤럽': 'pollster',
      '리얼미터': 'pollster',
    },
    '선거': {
      '대선': 'election',
      '총선': 'election',
      '지방선거': 'election',
      '재보궐 선거': 'election',
    },
  };

  // Feed algorithms
  static const int bestPostsHours = 6;
  static const int maxRecentMus = 3;
  static const int maxMyMus = 3;
  static const int maxRandomMus = 20;

  // Validation
  static const int minUsernameLength = 2;
  static const int maxMuDescriptionLength = 50;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
  static const double defaultIconSize = 24.0;
  static const double profileImageSize = 40.0;
  static const double muBannerHeight = 200.0;

  // Time formats
  static const Map<String, int> timeFormats = {
    'hours': 24,
    'days': 7,
    'weeks': 4,
    'months': 11,
  };
}
