import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Botones",
    subtitle: "Varios botones en Flutter",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Tarjetas",
    subtitle: "Un contenedor estilizado",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: "Progress indicators",
    subtitle: "Indicadores de Progreso",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: "Snackbars and Dialogs",
    subtitle: "Snackbars & Modales",
    link: "/snackbars",
    icon: Icons.info_outline,
  ),

  MenuItem(
    title: "Animated Container",
    subtitle: "StatefulWidget animated",
    link: "/animated",
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: "UI Controls + Tiles",
    subtitle: "Una serie de controles en Flutter",
    link: "/ui-controls",
    icon: Icons.car_rental_outlined,
  ),
];
