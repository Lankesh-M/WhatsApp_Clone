import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/color.dart';
import 'package:whatsapp_clone/dumydata.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/my_dp.jpeg'),
                radius: 30,
              ),
              title: Text('My status'),
              subtitle: Text('tap to add status update'),
            ),
          ),
          const Divider(),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              '     Recent updates',
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
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: statusColor,
                                width: 3.0,
                              ),
                            ),
                            child: index != 1
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      dummyData[index]['profilePic'].toString(),
                                    ),
                                    radius: 30,
                                  )
                                : const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/Me.jpg'),
                                    radius: 30,
                                  ),
                          ),
                          title: Text(dummyData[index]['name'].toString()),
                          subtitle: Text((index % 2 == 0)
                              ? 'Today ${dummyData[index]['time']}'
                              : 'Yesterday ${dummyData[index]['time']}'),
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
