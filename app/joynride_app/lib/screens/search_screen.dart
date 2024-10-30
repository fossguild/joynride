import 'package:flutter/material.dart';
import 'package:joynride_app/widgets/simple_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var textStyle = theme.textTheme;

    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Busque sua carona \n com segurança',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                //style: textStyle.textTheme
              ),
              const SizedBox(
                height: 48.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Local de chegada',
                  hintText: 'ponto',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Local de partida',
                  hintText: 'ponto',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Data',
                  hintText: 'dd/mm/yyyy',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120.0,
              ),
              SimpleButton(
                text: 'Procurar',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
