import 'package:flutter/material.dart';
import 'caretaker_profile_page.dart';
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
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsScreen(),
        '/account': (context) => AccountScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final NavigationController controller = NavigationController(); // Create a new instance here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Find your Pet Caretaker", style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), label: 'Gigs'),
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
                'Pet Caretaker',
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
    Container(color: Colors.purple), // Gigs
    SettingsScreen(), // Settings
    AccountScreen(), // Account
  ];
}

class HomePageContent extends StatelessWidget {
  final int days = 45;
  final String name = "Human!";

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
            Text(
              "Available Pet Caretakers:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildCaretakerCard(
              name: "John Doe",
              description: "Experienced caretaker, available on weekends",
              imageUrl: "https://via.placeholder.com/150", // Example image URL
              onPressed: () {
                // Navigate to caretaker profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaretakerProfilePage(
                      name: "John Doe",
                      description: "Experienced caretaker, available on weekends",
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            _buildCaretakerCard(
              name: "Emily Smith",
              description: "Loves animals, flexible hours",
              imageUrl: "https://via.placeholder.com/150", // Example image URL
              onPressed: () {
                // Navigate to caretaker profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaretakerProfilePage(
                      name: "Emily Smith",
                      description: "Loves animals, flexible hours",
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            // Add more caretaker cards here as needed
          ],
        ),
      ),
    );
  }

  Widget _buildCaretakerCard(
      {required String name,
        required String description,
        required String imageUrl,
        required VoidCallback onPressed}) {
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
                onPressed: onPressed, // Call the onPressed callback
                child: Text("Select"),
              ),
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

  const NavigationBar({
    Key? key,
    required this.height,
    required this.elevation,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  }) : super(key: key);

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
