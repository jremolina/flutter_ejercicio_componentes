import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();

  //List _listanumeros = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List _listanumeros = [];
  var _ultimoitem = 0;
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fecthdata();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: [_crearlista(), _crearLoading()],
        ));
  }

  _crearlista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listanumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listanumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?$imagen'),
            placeholder: const AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
     Timer(duration, () {
      _listanumeros.clear();
      _ultimoitem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoitem++;
      _listanumeros.add(_ultimoitem);
      setState(() {});
    }
  }

  Future fecthdata() async {
    _isloading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return Timer(duration, respHttp);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  void respHttp() {
    _isloading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 250));
    _agregar10();
  }

  _crearLoading() {
    return _isloading
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
              SizedBox(height: 15.0)
            ],
          )
        : Container();
  }
}
