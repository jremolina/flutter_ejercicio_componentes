import 'package:flutter/material.dart';

class sliverPage extends StatefulWidget {
  const sliverPage({super.key});

  @override
  State<sliverPage> createState() => _sliverPageState();
}

class _sliverPageState extends State<sliverPage> {
  double _valorSlider = 100;
  bool _bloquearchek = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliders')),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: _bloquearchek
          ? null
          : (double valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  _crearImagen() {
    return Image(
        width: _valorSlider,
        fit: BoxFit.contain,
        image: const NetworkImage(
            'https://logodownload.org/wp-content/uploads/2017/04/nintendo-logo-0.png'));
  }

  _crearCheckbox() {
    return CheckboxListTile(
        title: Text('bloquear slider'),
        value: _bloquearchek,
        onChanged: (valor) {
          setState(() {
            _bloquearchek = valor!;
          });
        });
  }

  _crearSwitch() {
    return SwitchListTile(
        title: Text('bloquear slider'),
        value: _bloquearchek,
        onChanged: (valor) {
          setState(() {
            _bloquearchek = valor;
          });
        });
  }
}
