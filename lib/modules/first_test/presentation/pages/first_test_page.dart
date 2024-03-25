import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/dependency_manager.dart';
import '../../../../core/utils/navigator_manager.dart';
import '../../../app/presentation/app_routes.dart';
import '../../domain/entities/city_entity.dart';
import '../controllers/cities_controller.dart';
import '../controllers/current_weather_controller.dart';
import 'first_test_details_page.dart';

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
    controller.fetchCities();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged(String input) {
    setState(() {
      controller.onSearchChanged(() => controller.fetchCities(input));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste #1'),
      ),
      body: SafeArea(
        child: Padding(
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
              const SizedBox(height: 24),
              Expanded(
                child: CustomListenableBuilder(
                  controller: controller,
                  builder: (context, cities, isLoading, hasError, error) {
                    if (isLoading) {
                      return const Align(
                        alignment: Alignment.topCenter,
                        child: LinearProgressIndicator(),
                      );
                    } else if (hasError) {
                      return Center(
                        child: Text(
                          error?.message ??
                              'Ocorreu um erro ao buscar as cidades',
                        ),
                      );
                    }
                    return _CitiesListView(cities: cities);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CitiesListView extends StatelessWidget {
  const _CitiesListView({required this.cities});

  final List<CityEntity> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: cities.length,
      itemBuilder: (_, index) => _CardListItem(city: cities[index]),
    );
  }
}

class _CardListItem extends StatefulWidget {
  const _CardListItem({required this.city});

  final CityEntity city;

  @override
  State<_CardListItem> createState() => _CardListItemState();
}

class _CardListItemState extends State<_CardListItem> {
  final controller = DM.i.get<CurrentWeatherController>();

  @override
  void initState() {
    super.initState();
    controller.getWeatherCurrent(lat: widget.city.lat, lon: widget.city.lon);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {
          Nav.to.pushNamed(
            AppRoutes.firstTestDetails,
            arguments: FirstTestDetailsPageArgs(city: widget.city),
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.city.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                CustomListenableBuilder(
                  controller: controller,
                  builder: (context, current, isLoading, hasError, error) {
                    if (isLoading) {
                      return const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (hasError) {
                      return SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                          onPressed: () {
                            controller.getWeatherCurrent(
                              lat: widget.city.lat,
                              lon: widget.city.lon,
                            );
                          },
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.refresh_rounded, size: 24),
                        ),
                      );
                    }
                    return Text('${current.temp}ºF');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
