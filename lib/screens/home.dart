import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 80.0,
                  bottom: 70.0,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(50, 105, 252, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/dashboard_logo.png"),
                        Image.asset("assets/notification.png")
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 30.0)),
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 0.68)),
                          children: [
                            TextSpan(text: "\$"),
                            TextSpan(
                              text: "100",
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(text: ".00")
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 25.0)),
                    Center(
                      child: Container(
                        width: 139.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.45),
                          border: Border.all(
                            color: const Color.fromRGBO(235, 240, 255, 1),
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/canada.png"),
                              radius: 10,
                            ),
                            Text(
                              "CAD Dollar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 25.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(50, 105, 252, 1),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                horizontal: 52.0,
                                vertical: 12.0,
                              ),
                            ),
                          ),
                          onPressed: null,
                          child: const Text("Add Money"),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(50, 105, 252, 1),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                horizontal: 52.0,
                                vertical: 12.0,
                              ),
                            ),
                          ),
                          onPressed: null,
                          child: const Text("Send Money"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -70,
                left: 20.0,
                right: 20.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 30.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/plus.png"),
                            const Padding(padding: EdgeInsets.only(top: 10.0)),
                            const Text(
                              "Request Money",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/exchange_currency.png"),
                            const Padding(padding: EdgeInsets.only(top: 10.0)),
                            const Text(
                              "Exchange Currency",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 70.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/buy_airtime.png"),
                            const Padding(padding: EdgeInsets.only(top: 10.0)),
                            const Text(
                              "Buy Airtime",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 130.0,
              horizontal: 20.0,
            ),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Getting started",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color.fromRGBO(1, 26, 50, 0.68),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                Column(
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "Verify Email",
                            style: TextStyle(
                              color: Color.fromRGBO(1, 27, 51, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        leading: SvgPicture.asset("assets/mail.svg"),
                        subtitle: const Text(
                          "To protect your account we need to verify your e-mail address",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(2, 53, 100, 0.7),
                          ),
                        ),
                        trailing: SvgPicture.asset("assets/verified.svg"),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 10.0,
                        ),
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "Verify Identity",
                            style: TextStyle(
                              color: Color.fromRGBO(1, 27, 51, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        leading: SvgPicture.asset("assets/verify_identity.svg"),
                        subtitle: const Text(
                          "To protect your account we need to verify your e-mail address",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(2, 53, 100, 0.7),
                          ),
                        ),
                        trailing: SvgPicture.asset("assets/verified.svg"),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 10.0,
                        ),
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "Fund Account",
                            style: TextStyle(
                              color: Color.fromRGBO(1, 27, 51, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        leading: SvgPicture.asset("assets/fund_account.svg"),
                        subtitle: const Text(
                          "To protect your account we need to verify your e-mail address",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(2, 53, 100, 0.7),
                          ),
                        ),
                        trailing: SvgPicture.asset("assets/unverified.svg"),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 10.0,
                        ),
                      )
                    ],
                  ).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
