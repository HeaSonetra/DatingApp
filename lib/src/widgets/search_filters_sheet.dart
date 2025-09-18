import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../localization/app_localizations.dart';
import '../providers/profile_provider.dart';

class SearchFiltersSheet extends ConsumerStatefulWidget {
  const SearchFiltersSheet({super.key});

  @override
  ConsumerState<SearchFiltersSheet> createState() => _SearchFiltersSheetState();
}

class _SearchFiltersSheetState extends ConsumerState<SearchFiltersSheet> {
  late RangeValues _ageRange;
  late double _maxDistance;
  late bool _onlineOnly;
  late List<String> _selectedInterests;

  final List<String> _availableInterests = [
    'Travel',
    'Food',
    'Photography',
    'Music',
    'Art',
    'Hiking',
    'Nature',
    'Technology',
    'Coffee',
    'Reading',
    'Gaming',
    'Yoga',
    'Fitness',
    'Meditation',
    'Healthy Living',
    'Cooking',
    'Blogging',
    'Business',
    'Learning',
    'Networking',
    'History',
    'Culture',
    'Storytelling',
    'Design',
    'Creativity',
    'Fashion',
    'Teaching',
    'Performance',
  ];

  @override
  void initState() {
    super.initState();
    final currentFilters = ref.read(searchFiltersNotifierProvider);
    _ageRange = RangeValues(
      currentFilters.minAge.toDouble(),
      currentFilters.maxAge.toDouble(),
    );
    _maxDistance = currentFilters.maxDistance;
    _onlineOnly = currentFilters.onlineOnly;
    _selectedInterests = List.from(currentFilters.interests);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      l10n.filter,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _resetFilters,
                      child: const Text('Reset'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _applyFilters,
                      child: const Text('Apply'),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Filters content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Age range
                      Text(
                        l10n.ageRange,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      RangeSlider(
                        values: _ageRange,
                        min: 18,
                        max: 70,
                        divisions: 52,
                        labels: RangeLabels(
                          _ageRange.start.round().toString(),
                          _ageRange.end.round().toString(),
                        ),
                        onChanged: (values) {
                          setState(() {
                            _ageRange = values;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${_ageRange.start.round()} ${l10n.yearsOld}'),
                          Text('${_ageRange.end.round()} ${l10n.yearsOld}'),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Distance
                      Text(
                        l10n.distance,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Slider(
                        value: _maxDistance,
                        min: 1,
                        max: 100,
                        divisions: 99,
                        label: '${_maxDistance.round()} km',
                        onChanged: (value) {
                          setState(() {
                            _maxDistance = value;
                          });
                        },
                      ),
                      Text('Up to ${_maxDistance.round()} ${l10n.kmAway}'),

                      const SizedBox(height: 24),

                      // Online only
                      Row(
                        children: [
                          Icon(Symbols.circle, color: Colors.green, size: 12),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Show only online users',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Switch(
                            value: _onlineOnly,
                            onChanged: (value) {
                              setState(() {
                                _onlineOnly = value;
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Interests
                      Text(
                        l10n.interests,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Select interests to find people with similar hobbies',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _availableInterests.map((interest) {
                          final isSelected = _selectedInterests.contains(
                            interest,
                          );
                          return FilterChip(
                            label: Text(interest),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedInterests.add(interest);
                                } else {
                                  _selectedInterests.remove(interest);
                                }
                              });
                            },
                            selectedColor: Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.2),
                            checkmarkColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _resetFilters() {
    setState(() {
      _ageRange = const RangeValues(18, 60);
      _maxDistance = 50.0;
      _onlineOnly = false;
      _selectedInterests.clear();
    });
  }

  void _applyFilters() {
    ref
        .read(searchFiltersNotifierProvider.notifier)
        .updateFilters(
          ref
              .read(searchFiltersNotifierProvider)
              .copyWith(
                minAge: _ageRange.start.round(),
                maxAge: _ageRange.end.round(),
                maxDistance: _maxDistance,
                onlineOnly: _onlineOnly,
                interests: _selectedInterests,
              ),
        );

    Navigator.of(context).pop();
  }
}
