import 'package:flutter/material.dart';
import 'package:joynride_app/utils/strings/ride_strings.dart';
import 'package:joynride_app/utils/strings/search_strings.dart';
import 'package:joynride_app/widgets/quantity_selector.dart';
import 'package:joynride_app/widgets/simple_button.dart';
import 'package:joynride_app/widgets/simple_textfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacing = 16;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(spacing),
      child: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(spacing),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  SearchStrings.searchTitle,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2 * spacing,
                ),
                const SimpleTextField(
                  labelText: RideStrings.departureLocation,
                  hintText: 'Ponto',
                  icon: Icon(Icons.trip_origin_rounded),
                ),
                const SizedBox(
                  height: spacing,
                ),
                const SimpleTextField(
                    labelText: RideStrings.arrivalLocation,
                    hintText: 'Ponto',
                    icon: Icon(Icons.place)),
                const SizedBox(
                  height: spacing,
                ),
                const SimpleTextField(
                  labelText: RideStrings.date,
                  hintText: 'dd/mm/yyyy',
                  icon: Icon(Icons.today),
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: spacing,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quantidade \nde Viajantes',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: spacing,
                    ),
                    QuantitySelector(
                      min: 1,
                      initialValue: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: spacing,
                ),
                SimpleButton(
                  text: SearchStrings.searchButton,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
