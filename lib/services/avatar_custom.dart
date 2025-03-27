import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';

class AvatarCustom extends StatefulWidget {
  @override
  _AvatarCustomState createState() => _AvatarCustomState();
}

class _AvatarCustomState extends State<AvatarCustom> {
  final FluttermojiController _controller = Get.put(FluttermojiController());

  void _openCustomizationModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 450,
          child: Column(
            children: [
              const Text(
                "Customize Avatar",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FluttermojiCustomizer(
                  scaffoldWidth: double.infinity,
                  autosave: false,
                  theme: FluttermojiThemeData(
                    boxDecoration: BoxDecoration(color: Colors.black87),
                    labelTextStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _controller
                      .setFluttermoji();
                  _controller.updatePreview();
                  Navigator.pop(context);
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Save Changes",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FluttermojiCircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[200],
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.white),
          onPressed: () => _openCustomizationModal(context),
        ),
      ],
    );
  }
}
