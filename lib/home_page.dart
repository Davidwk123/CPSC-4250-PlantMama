import 'package:flutter/material.dart';
// Import GalleryPage and MyCollectionPage widgets
// import 'gallery_page.dart';
// import 'my_collection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    const Home(),
    //const GalleryPage(),
    //const MyCollectionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Mama'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'My Collection',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlantSection(title: 'Explore', plants: explorePlants),
          PlantSection(title: 'Featured Plants', plants: featuredPlants),
          PlantSection(title: 'Recommended Plants', plants: recommendedPlants),
        ],
      ),
    );
  }
}

class PlantSection extends StatelessWidget {
  final String title;
  final List<String> plants;

  const PlantSection({required this.title, required this.plants, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          GridView.builder(
            itemCount: plants.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return PlantCard(plant: plants[index]);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


class PlantCard extends StatelessWidget {
  final String plant;

  const PlantCard({required this.plant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Text(plant)),
          ),
        ),
      ),
    );
  }
}

final List<String> explorePlants = [
  'Explore Plant 1',
  'Explore Plant 2',
  'Explore Plant 3',
  'Explore Plant 4',
  'Explore Plant 5',
];

final List<String> featuredPlants = [
  'Explore Plant 1',
  'Explore Plant 2',
  'Explore Plant 3',
  'Explore Plant 4',
  'Explore Plant 5',
];

final List<String> recommendedPlants = [
  'Explore Plant 1',
  'Explore Plant 2',
  'Explore Plant 3',
  'Explore Plant 4',
  'Explore Plant 5',
];