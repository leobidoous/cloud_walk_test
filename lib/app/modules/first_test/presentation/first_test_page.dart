import 'package:flutter/material.dart';

import '../../../core/utils/dependency_manager.dart';
import 'controllers/cities_controller.dart';

class FirstTestPage extends StatefulWidget {
  const FirstTestPage({super.key});

  @override
  State<FirstTestPage> createState() => _FirstTestPageState();
}

class _FirstTestPageState extends State<FirstTestPage> {
  final controller = DM.i.get<CitiesController>();
  final searchController = TextEditingController();

  @override
  void initState() {
    controller.fetchSponsors();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged(String input) {
    setState(() {
      controller.onSearchChanged(() => controller.fetchSponsors(input));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste #1'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded),
                        hintText: 'O que você procura?',
                        suffixIcon: AnimatedScale(
                          scale: searchController.text.isNotEmpty ? 1 : 0,
                          duration: const Duration(milliseconds: 250),
                          child: SizedBox(
                            width: 32,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  searchController.clear();
                                  onSearchChanged(searchController.text);
                                },
                                icon: const Icon(Icons.close_rounded),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onChanged: onSearchChanged,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
