import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('About ServeSphere'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 8),
            Text(
              'Our mission',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ServeSphere connects you with trusted local professionals for everyday home and electronic services. '
              'From AC repair and cleaning to computer support, we focus on making booking simple, transparent, and reliable.',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            SizedBox(height: 24),
            Text(
              'What you can do with ServeSphere',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Discover verified service providers for your needs\n'
              '• Compare services and view detailed profiles\n'
              '• Track your requests and booking status in one place\n'
              '• Use our Self-Fix assistant for quick troubleshooting tips before booking',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            SizedBox(height: 24),
            Text(
              'Your safety and trust',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We continuously work to keep your experience safe and smooth. '
              'Please always verify provider details and communicate inside the app wherever possible.',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            SizedBox(height: 24),
            Text(
              'Version',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ServeSphere Customer App\nBuild v1.0.0',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
