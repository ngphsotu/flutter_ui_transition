import 'package:flutter/material.dart';

import '/data/locations.dart';
import 'location_widget.dart';

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({super.key});

  @override
  State<LocationsWidget> createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  int pageIndex = 0;
  final pageController = PageController(viewportFraction: .8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];
              return LocationWidget(location: location);
            },
            onPageChanged: (index) => setState(() => pageIndex = index),
          ),
        ),
        Text(
          '${pageIndex + 1}/${locations.length}',
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
