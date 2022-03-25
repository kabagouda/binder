// ignore_for_file: file_names

class GridOption {
  final String value;
  const GridOption(this.value);
}
class GridOptions {
  static const GridOption extraSmall = GridOption('xs');
  static const GridOption small = GridOption('sm');
  static const GridOption medium = GridOption('md');
  static const GridOption large = GridOption('lg');
  static const GridOption extraLarge = GridOption('xl');
  static const GridOption extraExtraLarge = GridOption('xxl');
}