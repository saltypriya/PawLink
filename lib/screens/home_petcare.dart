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
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsScreen(),
        '/account': (context) => AccountScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final NavigationController controller = NavigationController();

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
    HomePageContent(),
    GigsScreen(),
    SettingsScreen(),
    AccountScreen(),
  ];
}

class HomePageContent extends StatelessWidget {
  final int days = 45;
  final String name = "Pet Lover!";
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
            SizedBox(height: 10.0),
            Text(
              "Available Pet Caretakers:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildCaretakerCard(
              name: "Aarav Gupta",
              description: "Experienced pet lover, available on weekends",
              imageUrl: imageUrl,
              availability: "Full-time",
              location: "Gurugram, Haryana",
              dateAvailable: "April 10, 2024",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaretakerProfilePage(
                      name: "Aarav Gupta",
                      description: "Experienced pet lover, available on weekends",
                      availability: "Full-time",
                      location: "Gurugram, Haryana",
                      dateAvailable: "April 10, 2024",
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            _buildCaretakerCard(
              name: "Neha Sharma",
              description: "Loves animals, available during evenings",
              imageUrl: imageUrl,
              availability: "Part-time",
              location: "Noida, Uttar Pradesh",
              dateAvailable: "April 12, 2024",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaretakerProfilePage(
                      name: "Neha Sharma",
                      description: "Loves animals, available during evenings",
                      availability: "Part-time",
                      location: "Noida, Uttar Pradesh",
                      dateAvailable: "April 12, 2024",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaretakerCard({
    required String name,
    required String description,
    required String imageUrl,
    required String availability,
    required String location,
    required String dateAvailable,
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
            Text(
              'Availability: $availability',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'Location: $location',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'Date Available: $dateAvailable',
              style: TextStyle(fontSize: 14.0),
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Available Pet Caretakers (Gigs):",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.0),
          _buildCaretakerCard(
            name: "Rahul Verma",
            description: "Experienced caretaker, available on weekdays",
            location: "Delhi, India",
            dateAvailable: "April 15, 2024",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaretakerProfilePage(
                    name: "Rahul Verma",
                    description: "Experienced caretaker, available on weekdays",
                    availability: "2 pm - 4 pm",
                    location: "Delhi, India",
                    dateAvailable: "April 15, 2024",
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.0),
          _buildCaretakerCard(
            name: "Priya Singh",
            description: "Animal lover, available on weekends",
            location: "Ghaziabad, Uttar Pradesh",
            dateAvailable: "April 18, 2024",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaretakerProfilePage(
                    name: "Priya Singh",
                    description: "Animal lover, available on weekends",
                    availability: "10 am - 6 pm",
                    location: "Ghaziabad, Uttar Pradesh",
                    dateAvailable: "April 18, 2024",
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.0),
          _buildCaretakerCard(
            name: "Prabhat Thakur",
            description: "Flexible hours, loves pets",
            location: "Faridabad, Haryana",
            dateAvailable: "April 20, 2024",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaretakerProfilePage(
                    name: "Prabhat Thakur",
                    description: "Flexible hours, loves pets",
                    availability: "10 am - 6 pm",
                    location: "Faridabad, Haryana",
                    dateAvailable: "April 20, 2024",
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.0),
          // Add more gigs here
        ],
      ),
    );
  }

  Widget _buildCaretakerCard({
    required String name,
    required String description,
    required String location,
    required String dateAvailable,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'Location: $location',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'Date Available: $dateAvailable',
              style: TextStyle(fontSize: 14.0),
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
