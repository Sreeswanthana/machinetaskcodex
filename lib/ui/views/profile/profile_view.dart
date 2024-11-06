import 'package:flutter/material.dart';
import 'package:machietaskcodexes/ui/views/login/login_view.dart';
import 'package:machietaskcodexes/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';


class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (model) {

      },
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
        
            title: Center(child: Text('Profile')),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  await model.logout();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    CircleAvatar(
    radius: 50,
    backgroundImage: AssetImage('assets/images/asset.png'),

    ),
    SizedBox(height: 16),


    Text(
    'sree swanthana',
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),

    // Email
    Text(
    'johndoe@example.com',
    style: TextStyle(
    fontSize: 16,
    color: Colors.grey[600],
    ),
    ),

    SizedBox(height: 24),


    Card(
    elevation: 3,
    child: ListTile(
    leading: Icon(Icons.info),
    title: Text('About Me'),
    subtitle: Text('Flutter developer with experience in building high-quality apps.'),
    ),
    ),
    SizedBox(height: 16),


    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    ElevatedButton.icon(
    onPressed: () {

    },
    icon: Icon(Icons.edit, color: Colors.white),
    label: Text('Edit Profile'),
    style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.grey,
    side: BorderSide(color: Colors.white),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
    ),    ),
    ),
    // Settings Button
    ElevatedButton.icon(
    onPressed: () {
    },
    icon: Icon(Icons.settings, color: Colors.white),
    label: Text('Settings'),
    style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.grey,
    side: BorderSide(color: Colors.white),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
      ),
    );
  }
}