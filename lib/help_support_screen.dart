import 'package:flutter/material.dart';
import 'package:serviceprovider/self_fix_chatbot_screen.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Quick help',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'If you are facing an issue with a service, booking, or payment, you can start by:',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 8),
          const Text(
            '• Checking your booking status under My Requests\n'
            '• Using the ServeSphere Assistant on the home screen for guided help\n'
            '• Contacting your provider using the details shown on the booking details page',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 24),
          const Text(
            'Frequently asked questions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          _FaqTile(
            question: 'How do I update my profile details?',
            answer:
                'Go to Profile > Edit Profile. You can update your name, phone number and address. The email address is fixed to keep your account secure.',
          ),
          _FaqTile(
            question: 'Where can I see all my service requests?',
            answer:
                'Open the My Requests tab from the bottom navigation bar. You can tap any request to see its detailed timeline and status.',
          ),
          _FaqTile(
            question: 'How do I reschedule or cancel a booking?',
            answer:
                'Open the request from My Requests and use the options provided there. If you do not see a reschedule option, contact the provider directly.',
          ),
          _FaqTile(
            question: 'What should I do if something goes wrong with a service?',
            answer:
                'We are here to help. Contact support with your booking ID and a short description of the issue so we can review it.',
          ),
          const SizedBox(height: 24),
          const Text(
            'Contact support',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.email_outlined, color: Colors.deepPurple),
              title: const Text('Email'),
              subtitle: const Text('support@servesphere.app'),
              onTap: () {
                // You can integrate url_launcher here in the future
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.chat_bubble_outline, color: Colors.deepPurple),
              title: const Text('Chat with assistant'),
              subtitle: const Text('Use ServeSphere Assistant on the home dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SelfFixChatbotScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        leading: const Icon(Icons.help_outline, color: Colors.deepPurple),
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
