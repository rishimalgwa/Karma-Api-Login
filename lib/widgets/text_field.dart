import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 16),
          labelStyle: TextStyle(color: Colors.black45, fontSize: 16),
          hintText: widget.hint,
          labelText: widget.hint,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _toggle();
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey.shade200,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: 'Search here...',
          suffixIcon: Icon(
            Icons.search_outlined,
            color: Colors.black,
            size: 25,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        ),
      ),
    );
  }
}

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);
  final String label, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            width: 150,
            child: CustomTextField(
              hint: '',
              controller: TextEditingController(text: text),
            ))
      ],
    );
  }
}
