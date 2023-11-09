import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = '';
  String _email = '';
  DateTime _fecha = DateTime.now();

  final _poderes = ['Volar', 'Rayos X'];
  String _selectedvalue = 'Volar';

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inputs de Texto")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ]),
      ),
    );
  }

  _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        counter: _nombre.isNotEmpty
            ? Text('Letras ${_nombre.length}')
            : const Text(''),
        hintText: 'Nombre del usuario',
        labelText: 'nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        // counter: _nombre.isNotEmpty
        //     ? Text('Letras ${_nombre.length}')
        //     : const Text(''),
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Solo el email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        // counter: _nombre.isNotEmpty
        //     ? Text('Letras ${_nombre.length}')
        //     : const Text(''),
        hintText: 'Password',
        labelText: 'Password',
        helperText: 'Solo el Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }

  _crearFecha() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        // counter: _nombre.isNotEmpty
        //     ? Text('Letras ${_nombre.length}')
        //     : const Text(''),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        helperText: 'Solo Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_month),
        icon: Icon(Icons.calendar_month_rounded),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked;
        _inputFieldDate.text = _fecha.toString();
      });
    }
  }

  _crearDropdown() {
    return DropdownButtonFormField(
      value: _selectedvalue,
      items: _poderes
          .map(
            (e) => DropdownMenuItem(
              value: (e),
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (val) {
        setState(() {
          _selectedvalue = val as String;
        });
      },
    );
  }
}
