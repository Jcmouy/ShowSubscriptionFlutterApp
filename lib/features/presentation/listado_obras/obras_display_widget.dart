import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:flutter/material.dart';

class ObrasDisplay extends StatelessWidget {
  final List<Obra> obras;

  const ObrasDisplay({
    Key key,
    @required this.obras,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: <Widget>[
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: obras == null ? 0 : obras.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber,
                child: Center(child: Text('Entry ${obras[index]}, datos: ${obras[index].id}, ${obras[index].fecha}, ${obras[index].nombre}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ],
      ),
    );
  }
}
