import 'package:flutter/material.dart';


final emailPattern =
    RegExp(r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$');

/* *
 * Valida si el formato de un correo electrónico es válido.
 * En el caso de que el correo cumpla el patron retorna null en caso contrario retorna
 * un mensaje con información del fallo
 * recibe un String.
 * respuestas:
 * El correo no puede estar vacio
 * Por favor, ingrese un correo electrónico válido
 * null
 */
String? patronCorreo(String? email) {
  if (email == null || email.isEmpty) {
    return 'El correo no puede estar vacio';
  }

  if (!emailPattern.hasMatch(email)) {
    return 'Por favor, ingrese un correo electrónico válido';
  }
  return null;
}

/* *
 * Valida si una contraseña tiene una estructura válida.
 * En el caso de que la contraseña cumpla retorna null en caso contrario retorna
 * un mensaje con información del fallo
 * respuestas:
 * La contraseña no puede estar vacía
 * Debe tener entre 8 y 16 caracteres
 * Debe contener al menos un dígito numérico
 * Debe contener al menos una letra mayúscula
 * Debe contener al menos una letra minúscula
 * Debe contener al menos un carácter especial'
 * null
 */
String? patronContrasena(String? contrasena) {
  if (contrasena == null || contrasena.isEmpty) {
    return 'La contraseña no puede estar vacía';
  }

  if (contrasena.length < 8 || contrasena.length > 16) {
    return 'Debe tener entre 8 y 16 caracteres';
  }

  if (!contrasena.contains(RegExp(r'\d'))) {
    return 'Debe contener al menos un dígito numérico';
  }

  if (!contrasena.contains(RegExp(r'[A-Z]'))) {
    return 'Debe contener al menos una letra mayúscula';
  }

  if (!contrasena.contains(RegExp(r'[a-z]'))) {
    return 'Debe contener al menos una letra minúscula';
  }

  if (!contrasena.contains(RegExp(r'[\W_]'))) {
    return 'Debe contener al menos un carácter especial';
  }
  return null;
}

/* *
 * Valida si una cadena no es null o no esta vacia.
 * En el caso de que la cadena cumpla retorna null en caso contrario retorna un mensaje
 * respuestas:
 * Este campo no puede estar vacío
 * null
 */
String? isRequired(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo no puede estar vacío';
  }
  return null;
}


class ResponsiveLayout {
  static bool isSmallScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width < 375 ||
        size.height < 667; // Menor que iPhone 8 (750x1334)
  }

  static bool isMediumScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return (size.width >= 375 &&
            size.width <
                414) || // Entre iPhone 8 (750x1334) y iPhone XS (1125x2436)
        (size.height >= 667 &&
            size.height <
                812); // Consideramos la altura para iPhone X, XS, 11 Pro
  }

  static bool isLargeScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width >= 414 ||
        size.height >=
            812; // Mayor o igual que iPhone XS (1125x2436) o altura mayor o igual a iPhone X, XS, 11 Pro
  }
}
