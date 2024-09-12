import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tedx/Speakers/catalog.dart';
import 'package:tedx/widgets/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/speakers.json");
    final decodedData = jsonDecode(catalogJson);
    var speakersData = decodedData["speakers"];
    Speakers.items = List.from(speakersData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Image.asset(
          "assets/tedx black logo.png",
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
          height: 55,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(500),
                    child: Container(
                      height: 362,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 72,),
                          Text(
                              "THEME 2024",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontFamily: GoogleFonts.firaSans().fontFamily,
                              ),
                            ),
                          Text(
                            "Beyond",
                            style: TextStyle(
                                shadows: [
                                      Shadow(
                                        offset: Offset(2.0, 2.0), // Position of the shadow
                                        blurRadius: 5.0, // How blurred the shadow is
                                        color: Colors.black.withOpacity(0.5), // Color of the shadow
                                      ),
                                    ],
                              fontSize: 74,
                              color: Colors.white,
                              fontFamily: GoogleFonts.ultra().fontFamily,
                            ),
                          ),
                          Text(
                            "The Canvas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: GoogleFonts.firaSans().fontFamily,
                               shadows: [
                                      Shadow(
                                        offset: Offset(2.0, 2.0), // Position of the shadow
                                        blurRadius: 5.0, // How blurred the shadow is
                                        color: Colors.black.withOpacity(0.2), // Color of the shadow
                                      ),
                                    ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 74),
                  Text(
                    'ABOUT THE THEME',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(255, 245, 54, 40),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Lorem ipsum dolor sit doloremque corporis numquam debitis et dicta necessitatibus corrupti laboriosam vel error porro rerum! Ipsam ratione inventore cupiditate harum consequuntur eum neque sapiente quibusdam...',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 74),
                  const Text(
                    'SPEAKERS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 245, 54, 40),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= Speakers.items.length) {
                  return null;
                }
                final item = Speakers.items[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: item.image.isNotEmpty
                          ? NetworkImage(item.image)
                          : null,
                      child: item.image.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      item.desc,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    tileColor: Color.fromARGB(255, 248, 249, 250),
                  ),
                );
              },
              childCount: Speakers.items.length,
            ),
          ),
          // Horizontal Scrollable Cards Section
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 74),
                const Text("SPONSORS",
                style: TextStyle( fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 245, 54, 40),

                ),),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: 5, // Number of cards
                    controller: PageController(viewportFraction: 0.8),
                    physics: const PageScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.orangeAccent,
                            ),
                            child: Center(
                              child: Text(
                                'Sponsors ${index + 1}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                 const SizedBox(height: 74),
                const Text("ABOUT TEDx",
                style: TextStyle( fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 245, 54, 40),

                ),),
                //const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Lorem ipsum dolor sit doloremque corporis numquam debitis et dicta necessitatibus corrupti laboriosam vel error porro rerum! Ipsam ratione inventore cupiditate harum consequuntur eum neque sapiente quibusdam...',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: const MyDrawer(),
    );
  }
}
