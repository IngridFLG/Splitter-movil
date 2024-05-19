import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';

Widget separadorVertical(BuildContext context, double height) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * height / 100,
  );
}

Widget separadorHorizontal(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width / 100,
  );
}

Widget textoSombra(String text, String font, double size, Color color,
    TextAlign textalign, BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: font,
            fontSize: size,
            color: color,
            shadows: const [
              Shadow(
                  color: Color.fromARGB(73, 0, 0, 0),
                  blurRadius: 8,
                  offset: Offset(3, 3))
            ]),
        textAlign: textalign,
      ));
}

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final double width;
  final double height;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool? readOnly;
  final bool obscureText;
  final Icon? icon;
  final TextEditingController controller;
  final int? sizeMinLines;
  final int? sizeMaxLines;
  final int? sizeMaxLength;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? colorMaxLength;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  late Color? errorColor;
  late double? sizeBorderRadius;

  CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      required this.controller,
      required this.width,
      required this.height,
      this.borderColor,
      this.hintColor,
      this.keyboardType,
      this.readOnly,
      this.icon,
      this.errorMessage,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.errorColor,
      this.textColor,
      this.colorMaxLength,
      this.sizeMinLines,
      this.sizeMaxLines,
      this.sizeMaxLength,
      this.sizeBorderRadius}) {
    errorColor = errorColor ?? rojoColor;
    sizeBorderRadius = sizeBorderRadius ?? 40.0;
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide:
            BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        borderRadius: BorderRadius.circular(sizeBorderRadius!));

    return SizedBox(
      width: width,
      child: TextFormField(
        minLines:
            sizeMinLines, //Para aumentar el tamaño vertical del TextFormField
        maxLines:
            sizeMaxLines, //Limitar el tamañao vertical por lineas escritas
        maxLength: sizeMaxLength, //Limitar el tamaño total de palabras
        readOnly: readOnly ?? false,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        style: TextStyle(
            color: textColor ?? grisColor,
            fontSize: mediumSize,
            fontFamily: fontApp),
        autovalidateMode: autovalidateMode,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            // contentPadding:
            //     EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            fillColor: readOnly == true ? grisTransColor : blancoColor,
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 10),
            isCollapsed: true,
            filled: true,
            enabledBorder: border,
            prefixIcon: icon,
            hintStyle: TextStyle(
              fontFamily: fontApp,
              color:
                  readOnly == true ? azulOscColor : hintColor ?? azulClaroColor,
              fontSize: mediumSize,
            ),
            focusedBorder: border,
            errorBorder:
                border.copyWith(borderSide: BorderSide(color: errorColor!)),
            focusedErrorBorder:
                border.copyWith(borderSide: BorderSide(color: errorColor!)),
            errorStyle: TextStyle(
              color: errorColor,
              fontFamily: fontApp,
            ),
            label: label != null ? Text(label!) : null,
            hintText: hint,
            counterStyle: TextStyle(color: colorMaxLength ?? blancoClaroColor)),
      ),
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  final double width;
  final double height;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Color? borderColor;
  final Color? hintColor;

  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  late Color? errorColor;

  PasswordTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    required this.controller,
    required this.width,
    required this.height,
    this.borderColor,
    this.hintColor,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.errorColor,
  }) {
    errorColor = errorColor ?? rojoColor;
  }

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isEnable = true;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(
            color: widget.borderColor ?? Colors.transparent, width: 1),
        borderRadius: BorderRadius.circular(40));

    return SizedBox(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: widget.autovalidateMode,
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: isEnable,
        style: TextStyle(
          fontFamily: fontApp,
          color: widget.hintColor ?? azulClaroColor,
          fontSize: mediumSize,
        ),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 20),
            fillColor: blancoColor,
            filled: true,
            enabledBorder: border,
            hintStyle: TextStyle(
                fontFamily: fontApp,
                color: widget.hintColor ?? azulClaroColor,
                fontSize: mediumSize),
            focusedBorder: border,
            errorBorder: border.copyWith(
                borderSide: BorderSide(color: widget.errorColor!)),
            focusedErrorBorder: border.copyWith(
                borderSide: BorderSide(color: widget.errorColor!)),
            errorStyle: TextStyle(
                color: widget.errorColor,
                fontFamily: fontApp,
                fontSize: mediumSize),
            isDense: true,
            label: widget.label != null ? Text(widget.label!) : null,
            hintText: widget.hint,
            errorText: widget.errorMessage,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isEnable = !isEnable;
                });
              },
              icon: Icon(isEnable ? Icons.visibility : Icons.visibility_off),
              color: negroColor,
            )),
      ),
    );
  }
}

class BotonAgregar extends StatefulWidget {
  final String textButton;
  final double widthButton;
  final double heightButton;
  final double size;
  final Color color;
  final Color hoverColor;
  final int duration; //en milisegundos
  final Icon? icono;
  final Function()? onTap;
  final Image? image;
  late Color? borderColor;
  late Color? textColor;

  BotonAgregar({
    super.key,
    required this.textButton,
    required this.widthButton,
    required this.heightButton,
    required this.size,
    required this.color,
    required this.hoverColor,
    required this.duration,
    this.icono,
    this.image,
    this.onTap,
    this.borderColor,
    this.textColor,
  }) {
    borderColor = borderColor ?? Colors.transparent;
    textColor = textColor ?? blancoColor;
  }

  @override
  // ignore: library_private_types_in_public_api
  _BotonAgregarState createState() => _BotonAgregarState();
}

class _BotonAgregarState extends State<BotonAgregar> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (bool isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.duration),
        width: widget.widthButton,
        height: widget.heightButton,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: grisClaColor.withOpacity(0.5),
              spreadRadius: -2,
              blurRadius: 3,
              offset: const Offset(4, 4),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            color: widget.borderColor!,
            width: (widget.borderColor != null) ? 1.5 : 0,
          ),
          gradient: LinearGradient(
            colors: _isHovered
                ? [
                    Color.lerp(
                        widget.color, widget.color, widget.duration as double)!,
                    Color.lerp(widget.hoverColor, widget.hoverColor,
                        widget.duration as double)!,
                  ]
                : [widget.hoverColor, widget.color],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          widget.icono != null
              ? widget.icono!
              : widget.image != null
                  ? widget.image!
                  : const SizedBox(),
          Text(
            widget.textButton,
            style: TextStyle(
              fontSize: widget.size,
              color: widget.textColor,
              fontFamily: fontBold,
            ),
          ),
        ]),
      ),
    );
  }
}

Widget texto(
  String text,
  String font,
  double size,
  Color color,
  TextAlign textalign,
) {
  return SizedBox(
      child: Text(
    text,
    style: TextStyle(
      fontFamily: font,
      fontSize: size,
      color: color,
    ),
    textAlign: textalign,
  ));
}
