import 'package:flutter/material.dart';
import 'CaretakerProfilePage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pet Caretaker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePagePet(),
        '/settings': (context) => SettingsScreen(),
        '/account': (context) => AccountScreen(),
      },
    );
  }
}

class HomePagePet extends StatelessWidget {
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Find your Pet ", style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
          controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Gigs'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Account')
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Pet ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite Caretakers'),
              onTap: () {
                // Navigate to favorite caretakers screen
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search for Caretakers'),
              onTap: () {
                // Navigate to search for caretakers screen
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Booking History'),
              onTap: () {
                // Navigate to booking history screen
              },
            ),
            ListTile(
              leading: Icon(Icons.event_available),
              title: Text('Upcoming Bookings'),
              onTap: () {
                // Navigate to upcoming bookings screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomePageContent(), // Home
    GigsScreen(), // Gigs
    SettingsScreen(), // Settings
    AccountScreen(), // Account
  ];
}

class HomePageContent extends StatelessWidget {
  final String name = "Human!";
  final String imageUrl = "assets/images/curve.png";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                width: 320,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Search for Pet :",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPetTypeButton("Dog", Icons.pets, onPressed: () {
                    // Add your logic for selecting dog caretakers
                  }),
                  SizedBox(width: 10),
                  _buildPetTypeButton("Cat", Icons.pets, onPressed: () {
                    // Add your logic for selecting cat caretakers
                  }),
                  SizedBox(width: 10),
                  _buildPetTypeButton("Bird", Icons.pets, onPressed: () {
                    // Add your logic for selecting bird caretakers
                  }),
                  SizedBox(width: 10),
                  _buildPetTypeButton("Other", Icons.pets, onPressed: () {
                    // Add your logic for selecting other types of pets
                  }),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Available Pet:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildCaretakerCard(
              name: "Simba",
              description: "Pet Grooming for Mr. Gupta",
              imageUrl: imageUrl,
              onPressed: () {
                // Navigate to caretaker profile page
              },
            ),
            SizedBox(height: 10.0),
            _buildCaretakerCard(
              name: "Rocky",
              description: "Pet Walking for Mrs. Desai",
              imageUrl: imageUrl,
              onPressed: () {
                // Navigate to caretaker profile page
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _buildPetTypeButton(String text, IconData icon,
      {required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildCaretakerCard({
    required String name,
    required String description,
    required String imageUrl,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 30.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text("Select"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GigsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gigs'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          PetGigCard(
            gigName: 'Pet Grooming for Mr. Gupta',
            date: 'April 25, 2024',
            time: '10:00 AM - 12:00 PM',
            location: 'Delhi NCR',
            petName: 'Simba',
            petType: 'Cat',
            petBreed: 'Siamese',
            petAge: '2 years',
          ),
          PetGigCard(
            gigName: 'Pet Walking for Mrs. Desai',
            date: 'April 28, 2024',
            time: '2:00 PM - 4:00 PM',
            location: 'Delhi NCR',
            petName: 'Rocky',
            petType: 'Dog',
            petBreed: 'Labrador',
            petAge: '4 years',
          ),
          PetGigCard(
            gigName: 'Pet Sitting for Mr. Singhania',
            date: 'May 1, 2024',
            time: '4:00 PM - 6:00 PM',
            location: 'Delhi NCR',
            petName: 'Max',
            petType: 'Dog',
            petBreed: 'German Shepherd',
            petAge: '3 years',
          ),
          // Add more PetGigCard instances here as needed
        ],
      ),
    );
  }
}

class PetGigCard extends StatelessWidget {
  final String gigName;
  final String date;
  final String time;
  final String location;
  final String petName;
  final String petType;
  final String petBreed;
  final String petAge;

  const PetGigCard({
    Key? key,
    required this.gigName,
    required this.date,
    required this.time,
    required this.location,
    required this.petName,
    required this.petType,
    required this.petBreed,
    required this.petAge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.deepPurple[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gigName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Location: $location',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Time: $time',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Pet Information:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Name: $petName',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Type: $petType',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Breed: $petBreed',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Age: $petAge',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  final double height;
  final double elevation;
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final List<NavigationDestination> destinations;

  const NavigationBar(
      {Key? key,
        required this.height,
        required this.elevation,
        required this.selectedIndex,
        required this.onDestinationSelected,
        required this.destinations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: selectedIndex,
      onTap: onDestinationSelected,
      items: destinations
          .map((destination) => BottomNavigationBarItem(
        icon: destination.icon,
        label: destination.label,
      ))
          .toList(),
    );
  }
}

class NavigationDestination {
  final Icon icon;
  final String label;

  const NavigationDestination({required this.icon, required this.label});
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Edit Profile'),
            onTap: () {
              // Navigate to Edit Profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {
              // Navigate to Change Password screen
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy'),
            onTap: () {
              // Navigate to Privacy settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () {
              // Navigate to Notification settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Updates'),
            onTap: () {
              // Navigate to Updates settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            onTap: () {
              // Toggle dark mode
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Navigate to Language settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Region'),
            onTap: () {
              // Navigate to Region settings screen
            },
          ),
        ],
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment'),
            onTap: () {
              // Navigate to Payment settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Tell your friends'),
            onTap: () {
              // Share app with friends
            },
          ),
          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text('Promotions'),
            onTap: () {
              // Navigate to Promotions screen
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              // Perform log out operation
            },
          ),
        ],
      ),
    );
  }
}
