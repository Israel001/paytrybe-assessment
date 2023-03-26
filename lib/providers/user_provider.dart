import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider {
  String phoneNumber;

  UserProvider({required this.phoneNumber});
}

final userStateProvider = StateProvider<UserProvider>((ref) {
  return UserProvider(phoneNumber: "");
});
