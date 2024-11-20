import 'package:flutter/material.dart';

class LocationTimeline extends StatelessWidget {
  const LocationTimeline(this.timeline, {super.key});

  final Map<DateTime, String> timeline;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
        );

    final entries = timeline.entries.toList();

    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.trip_origin_rounded),
                if (entries.length > 2)
                  ...entries.sublist(1, entries.length - 1).map(
                    (entry) {
                      return const Icon(Icons.stop);
                    },
                  ),
                const Icon(Icons.stop_circle),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${entries.first.key.hour.toString().padLeft(2, '0')}:${entries.first.key.minute.toString().padLeft(2, '0')}',
                    style: textStyle,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    entries.first.value,
                    style: textStyle,
                  ),
                ],
              ),
              if (entries.length > 2)
                ...entries.sublist(1, entries.length - 1).map(
                  (entry) {
                    return Row(
                      children: [
                        Text(
                          '${entry.key.hour.toString().padLeft(2, '0')}:${entry.key.minute.toString().padLeft(2, '0')}',
                          style: textStyle,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          entry.value,
                          style: textStyle,
                        ),
                      ],
                    );
                  },
                ),
              Row(
                children: [
                  Text(
                    '${entries.last.key.hour.toString().padLeft(2, '0')}:${entries.last.key.minute.toString().padLeft(2, '0')}',
                    style: textStyle,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    entries.last.value,
                    style: textStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
