import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int themeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                themeIndex == 0
                    ? 'assets/background2.jpg'
                    : 'assets/background1.jpg',
              ),
            ),
          ),
          SafeArea(
            child: selectedIndex == 0
                ? ListView(
                    children: const [
                      _Header(),
                      _DataInfo(),
                    ],
                  )
                : ListView(
                    children: [
                      const Text(
                        'Cambia el fondo',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          _ButtonTheme(
                              imageUrl: 'assets/background1.jpg',
                              onPressed: () {
                                setState(() {
                                  themeIndex = 1;
                                });
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          _ButtonTheme(
                            imageUrl: 'assets/background2.jpg',
                            onPressed: () {
                              setState(() {
                                themeIndex = 0;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

class _ButtonTheme extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imageUrl;

  const _ButtonTheme({
    Key? key,
    required this.onPressed,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        icon: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
        ),
      ),
    );
  }
}

class _DataInfo extends StatelessWidget {
  const _DataInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.teal,
            ),
            title: Text('+52 492 795 4036'),
          ),
          ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: Colors.teal,
            ),
            title: Text('ramortega1594@gmail.com'),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/ramon.jpeg',
              ),
            ),
          ),
        ),
        const Text(
          'Ramón de Jesús Ortega',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'FLUTTER DEVELOPER',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
