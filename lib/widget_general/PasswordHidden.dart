import 'package:flutter/material.dart';

class PasswordHidden extends StatefulWidget {
  final Function? onChange;
  final Function? onSaved;
  final String field;
  final TextEditingController? controller;

  PasswordHidden({
    required this.field,
    this.onChange,
    this.onSaved,
    this.controller,
  });

  @override
  _PasswordHidden createState() => _PasswordHidden();
}

class _PasswordHidden extends State<PasswordHidden> {
  bool _obscureText = true;

  String? _password;
  late FocusNode focusNodePwd;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // focusNodePwd = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // focusNodePwd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Text('test');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          // ignore: unnecessary_new
          child: new TextFormField(
            controller: widget.controller,
            // focusNode: focusNodePwd,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              hintText: widget.field,
              // labelText: name,
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.black, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: new BorderRadius.circular(14),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: new BorderRadius.circular(14),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 2),
                child: IconButton(
                  onPressed: () => _toggle(),
                  icon: Icon(
                    // _obscureText ? FontAwesome.eye : FontAwesome.eye_slash
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.black,
                    size: 26.0,
                  ),
                ), // icon is 48px widget.
              ),
            ),
            onChanged: (val) => widget.onChange!(val),
            onSaved: (val) => widget.onSaved!(val),
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                print('Mohon masukkan password Anda');
                return 'Mohon masukkan password Anda';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  InputDecoration FormDecoration(String name) {
    return new InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      hintText: name,
      // labelText: name,
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.black, fontSize: 14),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: new BorderRadius.circular(14)),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: new BorderRadius.circular(14)),
    );
  }
}
