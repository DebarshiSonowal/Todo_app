import 'package:flutter/material.dart';

import '../services/Navigate.dart';

class ImagePopUpBody extends StatelessWidget {
  const ImagePopUpBody({
    super.key,
    required this.getImage,
  });

  final Function(int) getImage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Center(
            child: Text(
              "Add Photo",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            )),
        contentPadding: const EdgeInsets.only(top: 24, bottom: 30),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigation.instance.goBack();
                      getImage(0);
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.pink.shade300),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 42,
                ),
                InkWell(
                    onTap: () {
                      Navigation.instance.goBack();
                      getImage(1);
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.purple.shade300),
                          child: const Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}