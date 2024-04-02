// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Test1 extends StatelessWidget {
  Test1({super.key});

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Colors.grey,
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'test',
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55, right: 15, left: 15),
              child: AnimSearchBar(
                width: 500,
                textController: editingController,
                onSuffixTap: () {
                  Navigator.pop(context);
                },
                onSubmitted: (value) async {},
                helpText: 'Search...',
                rtl: true,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Righteous',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: CupertinoButton(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
