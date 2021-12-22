import 'package:contact_app/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, String>> data = [
    {
      "name": "Jane Doe",
      "phone": "+233 254 506 258",
      "email": "someone@example.com",
      "country": "Ghana",
      "region": "Koforidua"
    },
    {
      "name": "Lilie Adwoa",
      "phone": "+233 250 506 208",
      "email": "la@gmail.com",
      "country": "Ghana",
      "region": "Bono"
    },
    {
      "name": "Mari bro",
      "phone": "+233 254 506 258",
      "email": "abdul@umail.com",
      "country": "Ghana",
      "region": "Nungua"
    },
    {
      "name": "John Doe",
      "phone": "+441 254 325 258",
      "email": "someone@example.com",
      "country": "Togo",
      "region": "Lome"
    },
    {
      "name": "Justice Abgo",
      "phone": "+550 778  2589",
      "email": "wedo@yahoo.com",
      "country": "China",
      "region": "Beijin"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'My Contact',
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/pic.jpeg'),
              radius: 25,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by name or number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ContactView(
                        contact: Contact(
                            name: "Bright Software",
                            phone: "+233 254 023 5555",
                            email: "example@someone.com",
                            country: "China",
                            region: "Nungua"),
                      );
                    }));
                  },
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/pic.jpeg'),
                  ),
                  title: Text(
                    'Bright Software',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  subtitle: Text('+233 54 025 5889'),
                  trailing: Icon(
                    Icons.more_horiz,
                    size: 30,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 3,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    groupByValue,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ContactView(contact: contact);
                        }));
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      subtitle: Text('${element['phone']}'),
                    ),
                    const Divider(),
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!),
              order: GroupedListOrder.ASC,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
        backgroundColor: Colors.black,
      ),
    );
  }
}