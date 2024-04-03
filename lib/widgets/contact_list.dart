import 'package:flutter/material.dart';
import 'package:whatsapp_clone/dumydata.dart';
import 'package:whatsapp_clone/widgets/chat.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => ChatScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  title: Text(
                    dummyData[index]['name'].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      dummyData[index]['message'].toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  leading: index != 1
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                            dummyData[index]['profilePic'].toString(),
                          ),
                          radius: 30,
                        )
                      : const CircleAvatar(
                          backgroundImage: AssetImage('assets/Me.jpg'),
                          radius: 30,
                        ),
                  trailing: Text(
                    dummyData[index]['time'].toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
