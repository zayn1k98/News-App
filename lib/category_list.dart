import 'package:assgn_digia_tech/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel;

  categoryModel = CategoryModel(
    categoryName: "Technology",
  );
  category.add(categoryModel);

  categoryModel = CategoryModel(
    categoryName: "Business",
  );
  category.add(categoryModel);

  categoryModel = CategoryModel(
    categoryName: "Food",
  );
  category.add(categoryModel);

  return category;
}
