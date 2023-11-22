// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'sixtyone_item_model.dart';

/// This class defines the variables used in the [rd_law_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RdLawPageModel extends Equatable {
  RdLawPageModel({this.sixtyoneItemList = const []}) {}

  List<SixtyoneItemModel> sixtyoneItemList;

  RdLawPageModel copyWith({List<SixtyoneItemModel>? sixtyoneItemList}) {
    return RdLawPageModel(
      sixtyoneItemList: sixtyoneItemList ?? this.sixtyoneItemList,
    );
  }

  @override
  List<Object?> get props => [sixtyoneItemList];
}
