/// This class is used in the [reducefriction_item_widget] screen.
class ReducefrictionItemModel {
  ReducefrictionItemModel({
    this.reduceFriction,
    this.reduceFriction1,
    this.reduceFriction2,
    this.id,
  }) {
    reduceFriction = reduceFriction ?? "Reduce Friction";
    reduceFriction1 = reduceFriction1 ?? "Reduce Friction";
    reduceFriction2 = reduceFriction2 ?? "Reduce Friction";
    id = id ?? "";
  }

  String? reduceFriction;

  String? reduceFriction1;

  String? reduceFriction2;

  String? id;
}
