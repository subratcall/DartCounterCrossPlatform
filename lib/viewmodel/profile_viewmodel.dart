import 'package:dart_counter/model/carrer_stats.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class ProfileViewModel extends ViewModel {

  Future<Profile> fetchProfile() async {
    // TODO fetch data
    await Future.delayed(const Duration(seconds: 1), () {});
    return Profile('www.example.com', 'mrjosch', CarrerStats(88.3, 'up', 43.3, 'down', 95.42, 'up', 144, 100,44));
  }
}
