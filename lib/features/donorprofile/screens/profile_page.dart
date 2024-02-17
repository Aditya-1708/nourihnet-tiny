
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nourishnet/features/donorprofile/screens/profile_settings_page.dart';
import 'package:nourishnet/repository/Authentication_Repository/authentication_repository.dart';
import 'package:nourishnet/widgets/bottom_navbar_donor.dart';

class DonorProfilePage extends StatefulWidget {
  const DonorProfilePage({super.key});

  @override
  State<DonorProfilePage> createState() => _DonorProfilePageState();
}

class _DonorProfilePageState extends State<DonorProfilePage> {
  late User? currentUser;
  String? photoUrl;
  int currentPage = 3;
  @override
  void initState() {
    super.initState();
    final authRepo = AuthenticationRepository.instance;
    currentUser = authRepo.firebaseUser.value;
    authRepo.firebaseUser.listen((user) {
      setState(() {
        currentUser = user;
        if (user != null) {
          photoUrl = user.photoURL;
        }
      });
    });
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
          actions: [
            IconButton(
              icon: const Icon(Icons.settings), // Add your action icon here
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DonorProfilesetting();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: currentUser != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (photoUrl != null) // Check if photoUrl is available
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(photoUrl!), // Display profile picture
                      ),
                    Text(
                      'Name: ${currentUser!.displayName ?? 'N/A'}',
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Email: ${currentUser!.email ?? 'N/A'}',
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Add more user details as needed
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        bottomNavigationBar: CustomBottomNavigationBarDonor(
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ));
  }
}
