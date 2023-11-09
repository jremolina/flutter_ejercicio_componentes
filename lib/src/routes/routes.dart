import 'package:flutter/material.dart';

import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/input_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext) => const HomePage(),
    'alert': (BuildContext) => const AlertPage(),
    'avatar': (BuildContext) => const AvatarPage(),
    'card': (BuildContext) => const CardPage(),
    'animated_container': (BuildContext) => const AnimatedContainerPage(),
    'inputs': (BuildContext) => const InputsPage(),
    'slider': (BuildContext) => const sliverPage(),
    'listas': (BuildContext) => const ListViewPage(),
  };
}
