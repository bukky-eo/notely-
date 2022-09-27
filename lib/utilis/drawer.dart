import 'package:flutter/material.dart';
import 'package:note_fly/utilis/widgets.dart';
import 'package:note_fly/utilis/constant.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBackground,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 125,
                padding: const EdgeInsets.only(
                    top: 25, right: 25, left: 25, bottom: 5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/fourth.jpg',
                    ))),
              ),
              const MyHeaderDrawer(icon: Icons.person, title: 'Buy Premium'),
              const MyHeaderDrawer(icon: Icons.create, title: 'Edit Profile'),
              const MyHeaderDrawer(
                  icon: Icons.wb_sunny_outlined, title: 'App Theme'),
              const MyHeaderDrawer(
                  icon: Icons.notifications, title: 'Notifications'),
              const MyHeaderDrawer(icon: Icons.cloud_done, title: 'Security'),
              const MyHeaderDrawer(
                  icon: Icons.logout_outlined, title: 'Log Out'),
            ],
            // MyDrawer(),
          ),
        ),
      ),
    );
  }
}
