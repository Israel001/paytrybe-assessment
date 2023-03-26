import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytrybe/providers/country_provider.dart';

class CountryList extends ConsumerWidget {
  final TextEditingController controller;

  const CountryList({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: ((context, ref, _) {
      CountryProvider countryProvider = ref.watch(countryStateProvider);

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
        margin: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Select your country",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
                color: Color.fromRGBO(1, 27, 51, 1),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 25.0)),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              onChanged: (String country) {
                if (country.isEmpty) {
                  countryProvider = CountryProvider(
                    countries: countries,
                    selectedCountry: countries[0],
                  );
                } else {
                  countryProvider = CountryProvider(
                    countries: countryProvider.countries
                        .where((c) => c.name
                            .toLowerCase()
                            .contains(country.toLowerCase()))
                        .toList(),
                    selectedCountry: countryProvider.selectedCountry,
                  );
                }
                ref.read(countryStateProvider.notifier).state = countryProvider;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                hintText: 'Search country',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
              ),
              cursorColor: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0),
            ),
            Expanded(
              child: ListView(
                children: countryProvider.countries.map<Widget>((country) {
                  return Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        ref.read(countryStateProvider.notifier).state =
                            CountryProvider(
                          countries: countryProvider.countries,
                          selectedCountry: country,
                        );
                        controller.text = "${country.phoneCode} ";
                        controller.selection = TextSelection.collapsed(
                          offset: controller.text.length,
                        );
                      },
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(country.flag),
                      ),
                      title: Text(country.name),
                      trailing: Text(country.phoneCode),
                      isThreeLine: false,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
