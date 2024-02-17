import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:nourishnet/features/donate/screens/donate_page.dart';
import 'package:nourishnet/features/community/screens/community_page.dart';
import 'package:nourishnet/features/donorhome/screens/home_page.dart';
import 'package:nourishnet/features/donorprofile/screens/profile_page.dart';
import 'package:nourishnet/features/maps/screens/location_page.dart';
import 'package:nourishnet/features/posts/screens/post_page.dart';
import 'package:nourishnet/features/userhome/screens/home_page.dart';
import 'package:nourishnet/features/userprofile/screens/profile_page.dart';
import 'package:nourishnet/firebase_options.dart';
import 'package:nourishnet/repository/Authentication_Repository/authentication_repository.dart';
import 'package:nourishnet/repository/Donation_Repository/donation_repository.dart';
import 'package:nourishnet/repository/Donor_Repository/donor_repository.dart';
import 'package:nourishnet/repository/User_Repository/user_repository.dart';
import 'package:nourishnet/widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    Get.put<DonationRepository>(DonationRepository());
    Get.put(AuthenticationRepository());
    Get.put(UserRepository());
    Get.put(DonorRepository());
  } catch (error) {
    print("Error initializing Firebase: $error");
  } 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NourishNet',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/homedonor': (context) => const DonorHomePage(),
        '/homeuser': (context) => const UserHomePage(),
        '/donate': (context) => const DonatePage(),
        '/post': (context) => const PostPage(),
        '/profiledonor': (context) => const DonorProfilePage(),
        '/profileuser': (context) => const UserProfilePage(),
        '/community': (context) => const CommunityPage(),
        '/maps': (context) => const LocationPage(),
      },
    );
  }
}
