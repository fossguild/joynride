import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:joynride_app/widgets/quantity_selector.dart';
import 'package:joynride_app/widgets/simple_button.dart';
import 'package:joynride_app/widgets/simple_textfield.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacing = 16;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final ValueNotifier<bool> autoAcceptNotifier = ValueNotifier<bool>(false);

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
                  'Ofereça sua carona com segurança',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2 * spacing,
                ),
                const SimpleTextField(
                  labelText: 'Local de Partida',
                  hintText: 'Ponto',
                  icon: Icon(Icons.trip_origin_rounded),
                ),
                const SizedBox(
                  height: spacing,
                ),
                const SimpleTextField(
                  labelText: 'Local de Chegada',
                  hintText: 'Ponto',
                  icon: Icon(Icons.place),
                ),
                const SizedBox(
                  height: spacing,
                ),
                const SimpleTextField(
                  labelText: 'Data e horário de partida',
                  hintText: 'dd/mm/yyyy - hh:mm',
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
                      'Quantidade \nde Vagas',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Icon(Icons.arrow_right),
                        Positioned(
                          left: 6,
                          child: Icon(Icons.arrow_right),
                        )
                      ],
                    ),
                    const SizedBox(width: spacing / 2),
                    Text(
                      'Reserva \n rápida',
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: spacing),
                    ValueListenableBuilder<bool>(
                      valueListenable: autoAcceptNotifier,
                      builder: (context, value, _) {
                        return CupertinoSwitch(
                          value: value,
                          onChanged: (bool newValue) {
                            autoAcceptNotifier.value = newValue;
                          },
                          activeColor: Colors.cyan.shade900,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: spacing,
                ),
                SimpleButton(
                  text: 'Oferecer',
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
