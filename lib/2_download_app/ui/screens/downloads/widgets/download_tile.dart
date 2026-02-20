import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: () => controller.startDownload(),
            title: Text(controller.ressource.name),
            subtitle: Text(controller.progressDetails),
            trailing: controller.status.downloadIcon,
          ),
        );
      },
    );

    // TODO
  }
}
