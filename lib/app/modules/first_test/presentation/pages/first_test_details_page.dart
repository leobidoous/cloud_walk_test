import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/dependency_manager.dart';
import '../../domain/entities/city_entity.dart';
import '../controllers/weathers_controller.dart';

class FirstTestDetailsPageArgs {
  FirstTestDetailsPageArgs({this.city});

  final CityEntity? city;
}

class FirstTestDetailsPage extends StatefulWidget {
  const FirstTestDetailsPage({super.key, required this.args});

  final FirstTestDetailsPageArgs args;

  @override
  State<FirstTestDetailsPage> createState() => _FirstTestPageState();
}

class _FirstTestPageState extends State<FirstTestDetailsPage> {
  final controller = DM.i.get<WeathersController>();
  final searchController = TextEditingController();

  @override
  void initState() {
    controller.fetchWeatherForecast(
      lat: widget.args.city?.lat ?? 0,
      lon: widget.args.city?.lon ?? 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.city?.name ?? 'Detalhes'),
      ),
      body: SafeArea(
        child: CustomListenableBuilder(
          controller: controller,
          builder: (context, state, isLoading, hasError, error) {
            if (isLoading) {
              return const LinearProgressIndicator();
            } else if (hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    error?.message ??
                        'Ocorreu um erro ao buscar os detalhes da cidade.',
                  ),
                ),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            );
          },
        ),
      ),
    );
  }
}
