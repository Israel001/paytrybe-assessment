import 'package:flutter_riverpod/flutter_riverpod.dart';

class ICountry {
  final String flag;
  final String name;
  final String phoneCode;

  ICountry({required this.flag, required this.name, required this.phoneCode});
}

class CountryProvider {
  List<ICountry> countries;
  ICountry selectedCountry;

  CountryProvider({required this.countries, required this.selectedCountry});
}

List<ICountry> countries = <ICountry>[
  ICountry(flag: "assets/canada.png", name: "Canada", phoneCode: "+1"),
  ICountry(flag: "assets/nigeria.png", name: "Nigeria", phoneCode: "+234"),
  ICountry(flag: "assets/ghana.png", name: "Ghana", phoneCode: "+223"),
  ICountry(flag: "assets/kenya.png", name: "Kenya", phoneCode: "+254"),
  ICountry(flag: "assets/england.png", name: "England", phoneCode: "+44"),
  ICountry(flag: "assets/rwanda.png", name: "Rwanda", phoneCode: "+250"),
];

final countryStateProvider = StateProvider<CountryProvider>((ref) {
  return CountryProvider(
    countries: countries,
    selectedCountry: countries[0],
  );
});
