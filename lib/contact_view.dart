
import 'package:flutter/material.dart';

import 'contact_model.dart';


class ContactView extends StatelessWidget {
  const ContactView({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Contacts',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
        elevation: 0,
      ),
      body: ListView(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.png'),
            radius: 75,
          ),
          const SizedBox(
            height: 20,
          ),
           Center(
            child: Text(
              contact.name,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
           Center(
            child: Text(
              '${contact.region}, ${contact.country}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: const Color(0xff9AADBE),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Mobile',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(contact.phone),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.chat,
                          color: Colors.black,
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder()),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder()),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(contact.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder()),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Group',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('UI Group'),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Account Linked',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            color: const Color(0xff9AADBE),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Telegram',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  trailing: Image.asset('assets/telegram.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text(
                    'WhatsApp',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  trailing: Image.asset('assets/whatsapp.png'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'More Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            color: const Color(0xff9AADBE),
            child: Column(
              children: const [
                ListTile(
                  title: Text(
                    'Share Contact',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                ListTile(
                  title: Text(
                    'QR Code',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}