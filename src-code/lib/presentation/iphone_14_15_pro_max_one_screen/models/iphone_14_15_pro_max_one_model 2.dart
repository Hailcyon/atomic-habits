// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'reducefriction_item_model.dart';

/// This class defines the variables used in the [iphone_14_15_pro_max_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone1415ProMaxOneModel extends Equatable {
  Iphone1415ProMaxOneModel({this.reducefrictionItemList = const []}) {}

  List<ReducefrictionItemModel> reducefrictionItemList;

  Iphone1415ProMaxOneModel copyWith(
      {List<ReducefrictionItemModel>? reducefrictionItemList}) {
    return Iphone1415ProMaxOneModel(
      reducefrictionItemList:
          reducefrictionItemList ?? this.reducefrictionItemList,
    );
  }

  @override
  List<Object?> get props => [reducefrictionItemList];
}
