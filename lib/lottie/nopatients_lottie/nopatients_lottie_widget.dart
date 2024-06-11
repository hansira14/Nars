import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'nopatients_lottie_model.dart';
export 'nopatients_lottie_model.dart';

class NopatientsLottieWidget extends StatefulWidget {
  const NopatientsLottieWidget({super.key});

  @override
  State<NopatientsLottieWidget> createState() => _NopatientsLottieWidgetState();
}

class _NopatientsLottieWidgetState extends State<NopatientsLottieWidget> {
  late NopatientsLottieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NopatientsLottieModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/lottie_animations/nothing.json',
          width: 258.0,
          height: 128.0,
          fit: BoxFit.cover,
          animate: true,
        ),
      ],
    );
  }
}
