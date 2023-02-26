import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        _Header(),
                        _DataInfo(),
                        _ProjectsSection()
                      ],
                    ),
                  )
                : ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'CAMBIAR TEMA',
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      const SizedBox(
                        height: 30,
                      ),
                      const _ContactSection(),
                      const _SoftSkillsSection(),
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

class _SoftSkillsSection extends StatelessWidget {
  const _SoftSkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'SOFT SKILLS',
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.voice_chat,
                color: Colors.teal,
              ),
              title: const Text('Comunicación'),
              trailing: Image.asset('assets/comunicacion.png'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.check_box_outlined,
                color: Colors.teal,
              ),
              title: const Text('Responsabilidad'),
              trailing: Image.asset('assets/responsable.png'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.voice_chat,
                color: Colors.teal,
              ),
              title: const Text('Trabajo en Equipo'),
              trailing: Image.asset('assets/equipo.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'CONTACTO',
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 150,
            minWidth: 150,
          ),
          child: Image.asset('assets/qr-code.png'),
        )
      ],
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'PROYECTOS',
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.count(
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            const Card(
              color: Colors.black,
              child: Image(
                image: AssetImage('assets/wemerang.png'),
              ),
            ),
            Card(
              color: Colors.grey[300],
              child: const Image(
                image: AssetImage('assets/simapaj.png'),
              ),
            ),
            Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const Image(
                  image: AssetImage('assets/kulhman.jpg'),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const Image(
                  image: AssetImage('assets/banner.jpeg'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
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
  const _DataInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Card(
          child: ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.teal,
            ),
            title: Text('+52 492 795 4036'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: Colors.teal,
            ),
            title: Text('ramortega1594@gmail.com'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.location_city,
              color: Colors.teal,
            ),
            title: Text('Zacatecas, México'),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

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
        const SizedBox(
          height: 10,
        ),
        Text(
          'Ramón de Jesús Ortega',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'FLUTTER DEVELOPER',
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
