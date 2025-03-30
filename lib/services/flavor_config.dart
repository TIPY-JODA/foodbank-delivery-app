enum Flavor { dev, prod }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String apiUrl;

  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required String apiUrl}) {
    _instance ??= FlavorConfig._internal(flavor, apiUrl);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.apiUrl)
    : name = flavor.toString().split('.').last;

  static FlavorConfig get instance => _instance!;
}
