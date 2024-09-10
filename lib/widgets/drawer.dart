import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tedx/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,  
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Ashish"), 
            accountEmail: Text("ashish@gmail.com"),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 21, 6),  
            ),
            // iska image change karna hai 
            currentAccountPicture: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/undraw_Male_avatar_g98d-ai-brush-removebg-re28fm5.png",
                ),
                radius: 30,
              ),
            ),
          ),
          ListTile(
           onTap: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
            leading: const Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,  
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.briefcase,
              color: Colors.black,
            ),
            title: Text(
              "Requirements",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,  
              ),
            ),
          ),
         const ListTile(
            leading: Icon(
              CupertinoIcons.time,
              color: Colors.black,
            ),
            title: Text(
              "Past Events",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,  
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.black,
            ),
            title: Text(
              "Contact Us",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,  
              ),
            ),
          ),  
        ],
      ),
    );
  }
}

