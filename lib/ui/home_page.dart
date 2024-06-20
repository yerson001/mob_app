import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:mob_school_assistance/services/theme_services.dart';
import 'package:mob_school_assistance/ui/theme.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _buildDrawer(),
      body: Column(children: [
        _addDateBar(),
        const SizedBox(
          height: 10,
        ),
      ]),
      bottomNavigationBar: _bottonNavigationBar(),
    );
  }

  _appBar() {
    return AppBar(
      title: Transform.translate(
        offset: const Offset(-25, 0),
        child: const Text(
          " Hoy",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),

      actions: <Widget>[
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.nightlight_round), // Icono de notificaciones
              onPressed: () {
                ThemeService().switchTheme();
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications), // Icono de notificaciones
              onPressed: () {
                // Agregar acción al hacer tap en el icono de notificaciones
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings), // Icono de configuración
              onPressed: () {
                // Agregar acción al hacer tap en el icono de configuración
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle), // Icono de usuario
              onPressed: () {
                // Agregar acción al hacer tap en el icono de usuario
              },
            ),
          ],
        ),
      ],
    );
  }
  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5, top: 8),
      child: DatePicker(
        DateTime.now(),
        locale: 'es',

        onDateChange: (selectedDate) {
          /*setState(() {
            _selectedDate = DateFormat.yMMMEd().format(selectedDate);
          });*/
        },
        height: 94,
        width: 65,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: greyColor,
            )),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: greyColor,
            )),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: greyColor,
            )),
        daysCount: 7,
      ),

    );
  }


  _bottonNavigationBar(){
    return   BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.check_box_rounded),
          label: 'Hoy',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.app_registration_rounded),
          label: 'Registros',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Más',
        ),
      ],
      currentIndex: 1, // Índice del elemento actualmente seleccionado
      selectedItemColor: Colors.blue, // Color del elemento seleccionado
      onTap: (int index) {
        // Agregar acción al hacer tap en un elemento del BottomNavigationBar
      },
    );
  }

  _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Agregar acción al hacer tap en el primer elemento del Drawer
              setState(() {
                //_isDrawerOpen = false;
              });
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Agregar acción al hacer tap en el segundo elemento del Drawer
              setState(() {
                //_isDrawerOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

}
