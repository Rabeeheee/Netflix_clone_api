import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'App Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Video Playback',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                tileColor: Colors.grey[900],
                leading: Icon(Icons.signal_cellular_alt, color: Colors.white),
                title: const Text(
                  'Mobile Data Usage',
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                subtitle: const Text(
                  'Automatic',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                },
              ),
              const SizedBox(height: 16),

              const Text(
                'Downloads',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                tileColor: Colors.grey[900],
                leading: Icon(Icons.wifi, color: Colors.white),
                title: const Text(
                  'Wi-Fi Only',
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                trailing: Switch(
                  value: true,
                  onChanged: (bool value) {
                  },
                  activeColor: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                tileColor: Colors.grey[900],
                leading: Icon(Icons.download, color: Colors.white),
                title: const Text(
                  'Smart Downloads',
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                subtitle: const Text(
                  'Download next episode',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                },
              ),
              const SizedBox(height: 8),
              ListTile(
                tileColor: Colors.grey[900],
                leading: Icon(Icons.video_settings, color: Colors.white),
                title: const Text(
                  'Video Quality',
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                subtitle: const Text(
                  'Standard',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                },
              ),
              const SizedBox(height: 8),
              ListTile(
                tileColor: Colors.grey[900],
                leading: Icon(Icons.delete, color: Colors.white,),
                title: const Text(
                  'Delete All Downloads',
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                onTap: () {
                },
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'iPhone XS',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Used: Netflix',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: 0.7, 
                  color: Colors.red,
                  backgroundColor: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
