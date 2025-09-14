enum AppImages {
  // Lottie animations
  moviePosterShake('assets/lotties/movie_poster_shake.json'),

  // Images
  appIcon('assets/images/appIcon.png'),

  bonusPremium('assets/images/premium.png'),
  bonusMatch('assets/images/match.png'),
  bonusHighlight('assets/images/highlight.png'),
  bonusLikes('assets/images/moreLikes.png');

  const AppImages(this.path);
  final String path;
}
