import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/dependency_manager.dart';
import '../../domain/entities/city_entity.dart';
import '../controllers/current_weather_controller.dart';
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
  final currentController = DM.i.get<CurrentWeatherController>();
  final controller = DM.i.get<WeathersController>();
  final searchController = TextEditingController();
  DateTime? dateSelected;

  @override
  void initState() {
    currentController.getWeatherCurrent(
      lat: widget.args.city?.lat ?? 0,
      lon: widget.args.city?.lon ?? 0,
    );
    controller
        .fetchWeatherForecast(
      nNextDays: 39,
      lat: widget.args.city?.lat ?? 0,
      lon: widget.args.city?.lon ?? 0,
    )
        .then((value) {
      if (controller.days.isNotEmpty) {
        setState(() {
          dateSelected = controller.days.first;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    currentController.dispose();
    searchController.dispose();
    controller.dispose();
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
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: CustomListenableBuilder(
                          controller: currentController,
                          builder: (_, current, isLoading, hasError, error) {
                            if (isLoading) {
                              return const SizedBox(
                                width: 48,
                                child: LinearProgressIndicator(),
                              );
                            } else if (hasError) {
                              return TextButton(
                                onPressed: () {
                                  currentController.getWeatherCurrent(
                                    lat: widget.args.city?.lat ?? 0,
                                    lon: widget.args.city?.lon ?? 0,
                                  );
                                },
                                child: const Text('Toque para recarregar'),
                              );
                            }
                            return Text(
                              '${current.temp}ºF',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineLarge,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.days
                          .map(
                            (date) => Padding(
                              padding: EdgeInsets.only(
                                right: date == controller.days.last ? 0 : 16,
                              ),
                              child: _buildDateChip(date),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildListView,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateChip(DateTime date) {
    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {
          setState(() {
            dateSelected = date;
          });
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: dateSelected == date ? Colors.blue : Colors.black,
            ),
            color: dateSelected == date ? Colors.blue : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              DateFormat.toDate(date),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: dateSelected == date ? Colors.white : null,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _buildListView {
    final weathers = controller.getWeathersByDate(dateSelected!);
    return ListView.separated(
      itemBuilder: (_, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(DateFormat.toTime(weathers[index].dtTxt)),
                const SizedBox(width: 8),
                Text('${weathers[index].temp}ºF'),
              ],
            ),
          ),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemCount: weathers.length,
    );
  }
}
