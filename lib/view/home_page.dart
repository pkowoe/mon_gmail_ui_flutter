import 'dart:math';

import 'package:flutter/material.dart';
import 'package:essai/dataset/messages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFF1F4F8),
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),

            child: CircleAvatar(
              // l'avatar à droite remplacant l'image du compte google
              radius: 18,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
            ),
          ),
        ],

        title: Container(
          margin: const EdgeInsets.only(right: 12),
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            //partie recherche au milieu
            child: Text(
              "Search messages",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, bottom: 6),
            child: const Text(
              "Main",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            shape: Border(bottom: BorderSide(color: Colors.green, width: 0.3)),
            isThreeLine: true,
            leading: CircleAvatar(
              //le cercle au avant les Noms
              radius: 25,

              child: Text("A"),
              backgroundColor: Colors
                  .primaries[Random().nextInt(Colors.primaries.length)]
                  .shade200,
              foregroundColor: Colors.black,
            ),

            title: Text(
              messages[index]["title"]!,
            ), // appeler le titre redigé sur la page messages
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messages[index]["body"]!,
                ), // appeler le body redigé sur la page messages
                Text(
                  messages[index]["message"]!,
                ), // appeler le message redigé sur la page messages
              ],
            ),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  TimeOfDay.fromDateTime(
                    DateTime.parse(
                      messages[index]["date"].toString(),
                    ), // appeler l'heure et la date depuis la pages messages
                  ).format(context),
                ),
                const Icon(Icons.star_outline), // Icone Star
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        // les bouton de navig. mail
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 91, 144, 168),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.mail),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: BoxConstraints(minWidth: 5, minHeight: 5),
                    child: Text(
                      '99+',
                      style: TextStyle(color: Colors.white, fontSize: 5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: "",
          ),

          BottomNavigationBarItem(
            // les bouton de navig. videocam
            icon: Stack(
              children: [
                Icon(Icons.videocam),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(width: 10, height: 10),
                ),
              ],
            ),
            label: "",
          ),
        ],
      ),

      drawer: Drawer(
        // le menu et ses composants
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Gmail",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.all_inbox),
              title: Text("All inboxes"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Primary"),
              trailing: Text("99+"),
            ),

            const ListTile(
              leading: Icon(Icons.discount_outlined),
              title: Text("Promotions"),
              trailing: Chip(
                backgroundColor: Color.fromARGB(255, 170, 218, 116),
                label: Text("211 news"),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.group_outlined),
              title: Text("Social"),
              trailing: Chip(
                backgroundColor: Color.fromARGB(255, 193, 214, 235),
                label: Text("102 news"),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Notifications"),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                "All labels",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),

            const ListTile(
              leading: Icon(Icons.star_outline),
              title: Text("Starred"),
              trailing: Text("2"),
            ),

            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Snoozed"),
            ),
            const ListTile(
              leading: Icon(Icons.label_important_outline),
              title: Text("Important"),
              trailing: Text("3"),
            ),
            const ListTile(
              leading: Icon(Icons.payment_outlined),
              title: Text("Purchases"),
              trailing: Text("99+"),
            ),
            const ListTile(
              leading: Icon(Icons.receipt_long_outlined),
              title: Text("Invoices"),
              trailing: Text("9"),
            ),
            const ListTile(leading: Icon(Icons.send), title: Text("Sent")),
            const ListTile(
              leading: Icon(Icons.schedule_send_outlined),
              title: Text("Schedule"),
            ),
            const ListTile(leading: Icon(Icons.outbox), title: Text("Outbox")),
            const ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Drafts"),
              trailing: Text("6"),
            ),
            const ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text("All mail"),
              trailing: Text("99+"),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Spam"),
              trailing: Text("26"),
            ),
            const ListTile(
              leading: Icon(Icons.delete_outline),
              title: Text("Trash"),
            ),
            const ListTile(
              leading: Icon(Icons.unsubscribe),
              title: Text("Manage subscriptions"),
              trailing: Chip(
                backgroundColor: Color.fromARGB(255, 193, 214, 235),
                label: Text("New"),
              ),
            ),

            const ListTile(
              leading: Icon(Icons.add),
              title: Text("Create a label"),
              trailing: Chip(
                backgroundColor: Color.fromARGB(255, 193, 214, 235),
                label: Text("New"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                "Google Apps",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 136, 129, 129),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Agenda"),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Contacts"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text("Help and feedback"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // bouton Nouveau message
        foregroundColor: const Color.fromARGB(255, 101, 104, 105),
        backgroundColor: Color(0xFFF1F4F8),
        onPressed: () {},
        icon: Icon(Icons.edit),
        label: Text("New message"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
    );
  }
}
