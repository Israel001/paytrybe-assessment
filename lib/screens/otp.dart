import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paytrybe/components/countdown.dart';
import 'package:paytrybe/providers/user_provider.dart';
import 'package:paytrybe/screens/final_auth.dart';

class OTP extends ConsumerStatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  ConsumerState<OTP> createState() => _OTPState();
}

class _OTPState extends ConsumerState<OTP> with TickerProviderStateMixin {
  late UserProvider userProvider;
  late AnimationController _countdownController;
  int clockLevel = 60;
  late List<FocusNode> focusNodes;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _countdownController.dispose();
    focusNodes.map((focusNode) => focusNode.dispose());
    _countdownController.removeListener(() {});
    super.dispose();
  }

  @override
  void initState() {
    _countdownController = AnimationController(
      vsync: this,
      duration: Duration(seconds: clockLevel),
    );
    _countdownController.forward();
    _countdownController.addListener(() {
      setState(() {});
    });
    focusNodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode()
    ];
    super.initState();
  }

  Widget otpField(FocusNode focusNode, {FocusNode? nextFocusNode}) {
    return SizedBox(
      width: 52.0,
      height: 52.0,
      child: TextFormField(
        focusNode: focusNode,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "";
          }
          return null;
        },
        onChanged: (value) {
          _formKey.currentState!.validate();
          if (value.isNotEmpty && nextFocusNode != null) {
            focusNode.unfocus();
            nextFocusNode.requestFocus();
          }
        },
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(150, 163, 177, 1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(6.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          counterText: "",
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          )
        ],
        maxLength: 1,
      ),
    );
  }

  void submit() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FinalAuth(key: Key("finalauth")),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = ref.watch(userStateProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 249, 253, 1),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset("assets/back.png"),
        ),
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(247, 249, 253, 1),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Verify Phone number",
                    style: TextStyle(
                      color: Color.fromRGBO(1, 27, 51, 1),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50.0)),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        const TextSpan(text: "Enter 6 digit OTP code sent to "),
                        TextSpan(
                          text: userProvider.phoneNumber,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20.0)),
                  Form(
                    key: _formKey,
                    child: Row(
                      children: List.generate(6, (i) {
                        if (i == 5) return otpField(focusNodes[i]);
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: otpField(
                            focusNodes[i],
                            nextFocusNode: focusNodes[i + 1],
                          ),
                        );
                      }),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50.0)),
                  _countdownController.value == 1.0
                      ? Center(
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(41.0),
                                  side: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 12.0),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: "A new code is sent to your phone number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                _countdownController = AnimationController(
                                  vsync: this,
                                  duration: Duration(seconds: clockLevel),
                                );
                                _countdownController.forward();
                                _countdownController.addListener(() {
                                  setState(() {});
                                });
                              });
                            },
                            child: const Text("Resend code"),
                          ),
                        )
                      : Countdown(
                          key: const Key("countdown"),
                          animation:
                              StepTween(begin: clockLevel, end: 0).animate(
                            _countdownController,
                          ),
                        ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
