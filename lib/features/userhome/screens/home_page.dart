
import 'package:flutter/material.dart';
import 'package:nourishnet/features/donate/models/donation_Model.dart';
import 'package:nourishnet/notification_service.dart';
import 'package:nourishnet/repository/Donation_Repository/donation_repository.dart';
import 'package:nourishnet/widgets/bottom_navbar_user.dart';
import 'package:nourishnet/widgets/custom_card.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int currentPage = 0;
  List<DonationModel> donations = [];
  NotificationServices notificationService = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.foregroundMessage();
    notificationService.firebaseInit(context);
    notificationService.isRefreshToken();
    notificationService.getDeviceToken().then((value) {
      print("Device Token $value");
    });
    fetchDonations();
  }

  void fetchDonations() async {
    try {
      var fetchedDonations = await DonationRepository.instance.fetchDonations();
      setState(() {
        donations = fetchedDonations;
      });
    } catch (error) {
      // Handle error
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 236),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 198, 168, 105),
        title: const Text(
          'NourishNet',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: donations.length,
          itemBuilder: (context, index) {
            return CustomCard(
              name: "bit",
              state: "hello",
              distance: 12.2,
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBarUser(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
