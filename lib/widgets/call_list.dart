import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/color.dart';
import 'package:whatsapp_clone/dumydata.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/WhatsApp_Icon.jpeg'),
                radius: 30,
              ),
              title: Text('Create call link'),
              subtitle: Text('Share a link for your WhatsApp call'),
            ),
          ),
          const Divider(),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              '     Recent',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: ListTile(
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
                          title: Text(dummyData[index]['name'].toString()),
                          subtitle: Text(
                              "${dummyData[index]['date'].toString()}, ${dummyData[index]['time']}"),
                          trailing: const Icon(
                            Icons.phone,
                            color: tabColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
