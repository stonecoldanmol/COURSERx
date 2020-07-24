class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {
    "name": "Development",
    'courses': 17,
    'image': "assets/images/Development.png"
  },
  {"name": "Design", 'courses': 25, 'image': "assets/images/Design.png"},
  {
    "name": "Programming",
    'courses': 13,
    'image': "assets/images/Programming.png"
  },
  {"name": "IT and Software", 'courses': 17, 'image': "assets/images/IT.png"},
];
