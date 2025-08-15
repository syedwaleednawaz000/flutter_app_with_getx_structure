import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure/view/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'welcome_user'.tr,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              controller.language();
              // TODO: Navigate to settings
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              controller.setting();
              // TODO: Navigate to settings
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: RefreshIndicator(
          onRefresh: () async{
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:         Center(
              child: Text(
                'home'.tr,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
  }
}
