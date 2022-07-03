class AppStrings {
  AppStrings._();

  static String getAcronymCategory(String category) {
    switch (category) {
      case 'noun':
        return 'n.';
      case 'adjective':
        return 'adj.';
      case 'adverb':
        return 'adv.';
      case 'verb':
        return 'v.';
      case 'determiner':
        return 'det.';
      case 'preposition':
        return 'prep.';
      case 'conjunction':
        return 'conj.';
      default:
        return category;
    }
  }

  static const world = 'World';
  static const phonetic = '/wɝld/';
  static const example = 'People are dying of starvation all over the world.';
  static const englishCard = 'English Card';
  static const nunito = 'Nunito';
  static const loremShort = 'lorem ipsum';
  static const loremLong =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}
