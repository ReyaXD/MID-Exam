import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

/// Bottom Navigation
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    AboutPage(),
    DashboardPage(),
    ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

/// Dashboard (Main Page with Logo + Links)
class DashboardPage extends StatelessWidget {
  final List<Map<String, String>> links = [
    {"title": "CCS", "img": "https://cdn-icons-png.flaticon.com/512/906/906324.png"},
    {"title": "Educ", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135755.png"},
    {"title": "COA", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135810.png"},
    {"title": "CBAE", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135731.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/970424554962092032/ZRQaOCir_400x400.jpg"),
            ),
          ),
          SizedBox(height: 20),
          // Horizontal Links
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: links.map((link) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                    onPressed: () {
                      if (link["title"] == "CCS") {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => CcsPage()));
                      } else if (link["title"] == "Educ") {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => EventPage()));
                      } else if (link["title"] == "COA") {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => OrgChartPage()));
                      }
                    },
                    icon: Image.network(link["img"]!, width: 30, height: 30),
                    label: Text(link["title"]!),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// CCS Page with Grid (Subjects + Images)
class CcsPage extends StatelessWidget {
  final List<Map<String, String>> subjects = [
    {"title": "Programming", "img": "https://cdn-icons-png.flaticon.com/512/2721/2721292.png"},
    {"title": "Networking", "img": "https://cdn-icons-png.flaticon.com/512/1055/1055687.png"},
    {"title": "Database", "img": "https://cdn-icons-png.flaticon.com/512/3416/3416074.png"},
    {"title": "Web Dev", "img": "https://cdn-icons-png.flaticon.com/512/888/888859.png"},
    {"title": "AI", "img": "https://cdn-icons-png.flaticon.com/512/4712/4712109.png"},
    {"title": "CyberSec", "img": "https://cdn-icons-png.flaticon.com/512/2910/2910768.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CCS")),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(subjects[index]["img"]!, width: 60, height: 60),
                SizedBox(height: 8),
                Text(subjects[index]["title"]!,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Events Page (with Event Icons)
class EventPage extends StatelessWidget {
  final List<Map<String, String>> events = [
    {"title": "Orientation Day", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"},
    {"title": "Sports Fest", "img": "https://cdn-icons-png.flaticon.com/512/1046/1046751.png"},
    {"title": "Foundation Day", "img": "https://cdn-icons-png.flaticon.com/512/3448/3448610.png"},
    {"title": "Seminar Workshop", "img": "https://cdn-icons-png.flaticon.com/512/3050/3050525.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(events[index]["img"]!, width: 40, height: 40),
              title: Text(events[index]["title"]!),
              subtitle: Text("Event details here..."),
            ),
          );
        },
      ),
    );
  }
}

/// Org Chart Style Page (with People Icons)
class OrgChartPage extends StatelessWidget {
  final List<Map<String, String>> positions = [
    {"title": "Dean", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"},
    {"title": "Program Head", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135731.png"},
    {"title": "Faculty A", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135768.png"},
    {"title": "Faculty B", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135768.png"},
    {"title": "Faculty C", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135768.png"},
    {"title": "Faculty D", "img": "https://cdn-icons-png.flaticon.com/512/3135/3135768.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CCS Org Chart")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: positions.map((pos) {
            return Container(
              width: 120,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(pos["img"]!, width: 40, height: 40),
                  SizedBox(height: 6),
                  Text(
                    pos["title"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// About Page
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(
        child: Text("About College App", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

/// Contact Page
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact")),
      body: Center(
        child: Text("Contact Information", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

