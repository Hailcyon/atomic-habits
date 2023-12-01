import 'bloc/loading_bloc.dart';
import 'models/loading_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LoadingBloc>(
      create: (context) => LoadingBloc(LoadingState(
        loadingModelObj: LoadingModel(),
      ))
        ..add(LoadingInitialEvent()),
      child: LoadingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 257.v),
              child: Column(
                children: [
                  SizedBox(height: 5.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgVectorAmber200,
                    height: 209.adaptSize,
                    width: 209.adaptSize,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
