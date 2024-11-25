import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 45, 70, 105)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Top Movies & Series'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _images = [
    'https://ntvb.tmsimg.com/assets/p12991665_b_h8_aj.jpg?w=1280&h=720',
    'https://static.wikia.nocookie.net/tvdatabase/images/7/79/Breaking_Bad.jpg/revision/latest?cb=20150305174548',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGNtiIcwTKSUr3gb__ffEqxWw3AXNhmOjGrw&s',
    'https://m.media-amazon.com/images/M/MV5BOWE1MWE3ZDktOThlZS00ZmRiLWE4ZGEtNWJkMTVlZjdhZDIyXkEyXkFqcGdeQW1pYnJ5YW50._V1_QL75_UX500_CR0,0,500,281_.jpg',
    'https://i.ytimg.com/vi/lyocCkQ_99A/maxresdefault.jpg',
    'https://images.adsttc.com/media/images/55e7/0d19/8450/b545/5500/14a1/newsletter/city-skyline-ipad-backgrounds.jpg?1441205523',
    'https://www.rogerebert.com/wp-content/uploads/2024/03/Hannibal-is-the-Best-Drama-on-Television.jpg',
    'https://www.lab111.nl/wp-content/uploads/2023/11/V-For-Vendetta-Banner.jpg',
  ];

  final List<String> _titles = [
    'Stranger Things',
    'Breaking Bad',
    'Inception',
    'The Godfather',
    'Watchmen',
    'The Dark Knight',
    'Hannibal',
    'V for Vendetta',
  ];

  final List<String> _descriptions = [
    'A supernatural sci-fi thriller',
    'A chemistry teacher turned drug lord.',
    'A mind-bending journey through dreams.',
    'A mafia classic, one of the greatest films ever.',
    'x-heroes uncover a world-threatening conspiracy.',
    'A dark superhero fights crime in Gotham.',
    'An investigator and psychiatrist play a psychological game',
    'A vigilante fights government to inspire revolution.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 70, 105),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 35, 50),
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        image: DecorationImage(
                          image: NetworkImage(_images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _titles[index],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      _descriptions[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Add code to handle viewing details or streaming
                    },
                    child: const Text('Watch Now'),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
