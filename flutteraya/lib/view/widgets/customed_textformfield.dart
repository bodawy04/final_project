import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomedTextField extends StatefulWidget {
  String? _hintText;
  IconData? _prefixIcon;
  IconData? _suffixIcon=FontAwesomeIcons.eye;
  TextEditingController? _textEditingController;
  late bool _obs;
  late bool _obsConst;
  late String form;

  CustomedTextField(String hint,IconData prefix_icon,{TextEditingController? TEC,IconData? suffix_icon,bool? obs,String? name}){
    _hintText=hint;
    _prefixIcon=prefix_icon;
    _textEditingController=TEC;
    // _suffixIcon=suffix_icon??FontAwesomeIcons.eye;
    _obs=obs??false;
    _obsConst=obs??false;
    form=name??"Unknown";
  }

  @override
  State<CustomedTextField> createState() => _CustomedTextFieldState();
}

class _CustomedTextFieldState extends State<CustomedTextField> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._textEditingController,
      obscureText: widget._obs!,
      obscuringCharacter: '●',
      decoration: InputDecoration(
          hintText: widget._hintText,
          prefixIcon: Icon(
            widget._prefixIcon,
            color: Color(0xffD1D5DB),
          ),
          suffixIcon: widget._obsConst?IconButton(
            onPressed: () {
              setState(() {
                widget._obs = !(widget._obs!);
                widget._obs?widget._suffixIcon=FontAwesomeIcons.eye:widget._suffixIcon=FontAwesomeIcons.eyeSlash;
              });
            },
            icon: Icon(widget._suffixIcon),
          ):null,
          suffixIconColor: Color(0xffD1D5DB),
          iconColor: Colors.black,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
              borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
