import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SetPinModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController1;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController1 = TextEditingController();
    pinCodeController2 = TextEditingController();
  }

  void dispose() {
    pinCodeController1?.dispose();
    pinCodeController2?.dispose();
  }

  /// Additional helper methods are added here.

}
