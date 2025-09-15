enum AppIcons {
  // Navigation
  home('assets/icons/Home.svg'),
  homeFill('assets/icons/Home-fill.svg'),
  profile('assets/icons/Profile.svg'),
  profileFill('assets/icons/Profile-fill.svg'),

  // Auth
  mail('assets/icons/Mail.svg'),
  lock('assets/icons/Lock.svg'),
  user('assets/icons/User.svg'),

  // Actions
  arrow('assets/icons/Arrow.svg'),
  plus('assets/icons/Plus.svg'),
  x('assets/icons/X.svg'),

  // Visibility
  see('assets/icons/See.svg'),
  hide('assets/icons/Hide.svg'),

  // Favorites
  heart('assets/icons/Heart.svg'),
  heartFill('assets/icons/Heart-fill.svg'),

  // Premium
  gem('assets/icons/Gem.svg'),

  // Social
  google('assets/icons/Google.svg'),
  apple('assets/icons/Apple.svg'),
  facebook('assets/icons/Facebook.svg');

  const AppIcons(this.path);
  final String path;
}
