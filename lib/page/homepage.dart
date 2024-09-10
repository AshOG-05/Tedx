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
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.black,
        //elevation: 4,  // Adds shadow under AppBar
        //centerTitle: true,  // Centers the logo
        title: Image.asset(
          "assets/Tedx logo -Photoroom.png",
          fit: BoxFit.contain,
          height: 50,
          width: 210,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  const Text("Theme 2k24",
                  textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      
                      color: Color.fromARGB(255, 245, 54, 40),),),
                  
                  Text("Beyond",
                    style: TextStyle(
                      fontSize: 74,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: GoogleFonts.ultra().fontFamily,
                      )),


                    const Text("The Canvas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                     // fontFamily: GoogleFonts.ultra().fontFamily,
                      color: Colors.white,)),    
                       const SizedBox(height:74), 
                       const Text(
                    'About the theme ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 245, 54, 40),),),
                        const Text(
                          textAlign:TextAlign.center,
                    'Lorem ipsum dolor sit doloremque corporis numquam debitis et dicta necessitatibus corrupti laboriosam vel error porro rerum! Ipsam ratione inventore cupiditate harum consequuntur eum neque sapiente quibusdam, expedita quidem reiciendis a fugit cumque quas veritatis error. Perspiciatis error, aliquid, voluptatum exercitationem, libero similique totam at voluptates aspernatur voluptatibus odio velit tenetur esse nihil doloremque possimus soluta magni nesciunt eligendi sed tempore pariatur culpa. Aliquid delectus fugiat velit eos, aliquam similique iure distinctio, ex, laboriosam laborum exercitationem expedita magnam ducimus suscipit! Voluptatibus, magnam nostrum! Omnis corporis ipsa veritatis vero nobis. ',
                    style: TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 255, 255, 255),),),
                      const SizedBox(height: 74,),
                  const Text(
                    'Speakers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                 // SizedBox(height:24), // Spacing between text and list
                ],
              ),
            ),
          ),
           SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= Speakers.items.length) {
                  return null; // No more items to display
                }
                final item = Speakers.items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: item.image.isNotEmpty
                          ? NetworkImage(item.image) // NetworkImage for loading from the network
                          : null,
                      child: item.image.isEmpty
                          ? const Icon(Icons.person, size: 35, color: Colors.white) // Fallback icon if image fails to load
                          : null,
                    ),
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      item.desc,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    tileColor: Colors.black,
                  ),
                );
              },
              childCount: Speakers.items.length,
            ),
          ),
        ],
      ),
      endDrawer: const MyDrawer(),
    );
  }
}
