import 'dart:io';

import 'package:attendance_app/utils/colors.dart';
import 'package:flutter/material.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Do you want to exit?",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomeColors.secondary),
                      child: const Text("Yes"),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child:
                        const Text("No", style: TextStyle(color: Colors.black)),
                  ))
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
