import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytrybe/components/country_list.dart';
import 'package:paytrybe/providers/country_provider.dart';
import 'package:paytrybe/providers/user_provider.dart';
import 'package:paytrybe/screens/otp.dart';

class GetStarted extends ConsumerStatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  ConsumerState<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends ConsumerState<GetStarted> {
  late TextEditingController controller;
  late ICountry selectedCountry;
  late CountryProvider countryProvider;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    selectedCountry = ref.read(countryStateProvider).selectedCountry;
    controller.text = "${selectedCountry.phoneCode} ";
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      ref.read(userStateProvider.notifier).state = UserProvider(
        phoneNumber: controller.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OTP(key: Key("otp")),
        ),
      );
    }
  }

  void _modalBottomSheetMenu() {
    final container = ProviderScope.containerOf(context);

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      backgroundColor: const Color.fromRGBO(247, 249, 253, 1),
      builder: (context) {
        return ProviderScope(
          parent: container,
          child: CountryList(
            key: const Key("countrylist"),
            controller: controller,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    countryProvider = ref.watch(countryStateProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 249, 253, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Color.fromRGBO(1, 27, 51, 1),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40.0)),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(1, 27, 51, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5.0)),
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please provide a valid phone number";
                      }
                      String valWithoutSpaces =
                          value.trim().replaceAll(" ", "");
                      if (valWithoutSpaces.length < 11) {
                        return "Phone number is shorter than standard length";
                      }
                      if (valWithoutSpaces.length > 14) {
                        return "Phone number is longer than standard length";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.isEmpty ||
                          value.length <
                              countryProvider.selectedCountry.phoneCode.length +
                                  1) {
                        controller.text =
                            "${countryProvider.selectedCountry.phoneCode} ";
                        controller.selection = TextSelection.collapsed(
                          offset: controller.text.length,
                        );
                      } else {
                        _formKey.currentState!.validate();
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      contentPadding: const EdgeInsets.only(
                        top: 17.0,
                        right: 0,
                        bottom: 17.0,
                        left: 17.0,
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () => _modalBottomSheetMenu(),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 5.0,
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          margin: const EdgeInsets.all(10.0),
                          width: 55.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 18.0,
                                height: 13.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      countryProvider.selectedCountry.flag,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(2.0),
                                  ),
                                ),
                              ),
                              Image.asset("assets/dropdown.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    controller: controller,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\+[0-9 ]+'))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40.0)),
                  const Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromRGBO(1, 27, 51, 1),
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: "By continuing, you agree to the Paytrybe ",
                        ),
                        TextSpan(
                          text: "Platform Terms & Conditions,",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: " "),
                        TextSpan(
                          text: "Rewards Policy",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(41.0),
                              side: const BorderSide(
                                color: Color.fromRGBO(65, 104, 246, 1),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(65, 104, 246, 1),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                              horizontal: 62.0,
                              vertical: 16.0,
                            ),
                          ),
                        ),
                        onPressed: submit,
                        child: const Text("Continue"),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 40.0)),
              const Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: "Have an account ? ",
                    ),
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                        color: Color.fromRGBO(65, 104, 246, 1),
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
