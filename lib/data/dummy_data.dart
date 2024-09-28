import 'package:date_app/models/post_model.dart';
import 'package:date_app/models/user_model.dart';

final listUserModel = [
  UserModel(
    id: '1',
    name: 'Nguyễn Văn Minh',
    image:
        'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
    age: 25,
    location: 'Hà Nội',
    storyStatus: true,
    howFar: 5,
  ),
  UserModel(
    id: '2',
    name: 'Trần Thị Hằng',
    image:
        'https://cdn.pixabay.com/photo/2024/06/24/04/05/woman-8849047_1280.jpg',
    age: 30,
    location: 'Hồ Chí Minh',
    storyStatus: false,
    howFar: 10,
  ),
  UserModel(
    id: '3',
    name: 'Lê Văn Quang',
    image:
        'https://img.freepik.com/free-photo/abstract-autumn-beauty-multi-colored-leaf-vein-pattern-generated-by-ai_188544-9871.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1726358400&semt=ais_hybrid',
    age: 22,
    location: 'Đà Nẵng',
    storyStatus: true,
    howFar: 3,
  ),
  UserModel(
    id: '4',
    name: 'Phạm Thị Trang',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_FWF2judaujT30K9sMf-tZFhMWpgP6xCemw&s',
    age: 28,
    location: 'Hải Phòng',
    storyStatus: false,
    howFar: 8,
  ),
  UserModel(
    id: '5',
    name: 'Hoàng Văn Đức',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4INv3ejNI3atXgQ60T7RAO1u7YmKM3BJ6uqZ2DG3BdOJrEg46P9LkuhZ1oW7_eQXeB0M&usqp=CAU',
    age: 35,
    location: 'Cần Thơ',
    storyStatus: true,
    howFar: 15,
  ),
  UserModel(
    id: '6',
    name: 'Vũ Thị Dương',
    image: 'https://th.bing.com/th/id/OIG3.Z11n1VN6NRw.IXOddq9X',
    age: 20,
    location: 'Nha Trang',
    storyStatus: false,
    howFar: 2,
  ),
  UserModel(
    id: '7',
    name: 'Đỗ Văn Trung',
    image:
        'https://th.bing.com/th/id/OIP.TaD-Sw3TdIco5YCJOtJPggHaJ4?rs=1&pid=ImgDetMain',
    age: 33,
    location: 'Huế',
    storyStatus: true,
    howFar: 12,
  ),
  UserModel(
    id: '8',
    name: 'Ngô Thị Huyền',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlJ2u482NBtw501OOICaZxGrIcxNtG5SuqWQ&s',
    age: 27,
    location: 'Hà Giang',
    storyStatus: false,
    howFar: 20,
  ),
  UserModel(
    id: '9',
    name: 'Bùi Văn Quân',
    image:
        'https://cdn.pixabay.com/photo/2024/06/20/17/03/fishing-8842590_640.jpg',
    age: 29,
    location: 'Vũng Tàu',
    storyStatus: true,
    howFar: 7,
  ),
  UserModel(
    id: '10',
    name: 'Dương Thị Kim',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCG-_KsP4komtB9zyV8aujkl7CLuMfnFvdiL7dyIlwfqEsGAPxj4JKbtWrx3UpLKGNTY&usqp=CAU',
    age: 31,
    location: 'Đà Lạt',
    storyStatus: false,
    howFar: 1,
  ),
];
final listPost = [
  PostModel(
    user: listUserModel[0],
    type: TypeFavorite.photography,
    image:
        'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
    content: 'Chụp được một bức ảnh đẹp hôm nay!',
    like: 250,
    comment: 35,
    share: 10,
  ),
  PostModel(
    user: listUserModel[1],
    type: TypeFavorite.music,
    content: 'Đang nghe một bản nhạc tuyệt vời!',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s',
    like: 180,
    comment: 22,
    share: 104,
  ),
  PostModel(
    user: listUserModel[2],
    type: TypeFavorite.football,
    content: 'Trận đấu hôm qua thật tuyệt!',
    image:
        'https://st.depositphotos.com/1057668/4156/i/450/depositphotos_41568091-stock-photo-seljalandfoss-waterfall.jpg',
    like: 300,
    comment: 40,
    share: 18,
  ),
  PostModel(
    user: listUserModel[3],
    type: TypeFavorite.nature,
    content: 'Thiên nhiên thật đẹp!',
    image:
        'https://i0.wp.com/picjumbo.com/wp-content/uploads/amazing-stone-path-in-forest-free-image.jpg?w=600&quality=80',
    like: 220,
    comment: 30,
    share: 88,
  ),
  PostModel(
    user: listUserModel[4],
    type: TypeFavorite.language,
    content: 'Đang học một ngôn ngữ mới!',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQphO1iGa3a8wJpd43zAbREvXa8q4DmAIKww&s',
    like: 150,
    comment: 18,
    share: 109,
  ),
  PostModel(
    user: listUserModel[5],
    type: TypeFavorite.writing,
    content: 'Viết xong một bài thơ mới!',
    image:
        'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/09/instagram-image-size.jpg',
    like: 200,
    comment: 25,
    share: 105,
  ),
  PostModel(
    user: listUserModel[6],
    type: TypeFavorite.photography,
    content: 'Bắt được khoảnh khắc hoàng hôn tuyệt đẹp!',
    image: 'https://www.w3schools.com/w3css/img_lights.jpg',
    like: 280,
    comment: 38,
    share: 190,
  ),
  PostModel(
    user: listUserModel[7],
    type: TypeFavorite.music,
    content: 'Khám phá một ban nhạc mới!',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkyq5M9l9X5QDHKbR1Pv78y0NTOydF-M9PWg&s',
    like: 170,
    comment: 20,
    share: 12,
  ),
  PostModel(
    user: listUserModel[8],
    type: TypeFavorite.football,
    content: 'Háo hức chờ đợi trận đấu cuối tuần!',
    image:
        'https://img.freepik.com/premium-photo/image-colorful-galaxy-sky-generative-ai_791316-9864.jpg',
    like: 230,
    comment: 32,
    share: 90,
  ),
  PostModel(
    user: listUserModel[9],
    type: TypeFavorite.nature,
    content: 'Đi dạo trong rừng thật thư giãn!',
    image:
        'https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-autumn-nature-with-a-river-in-the-middle-of-the-forest-free-image.jpeg?w=600&quality=80',
    like: 210,
    comment: 28,
    share: 40,
  ),
];

Map<TypeFavorite, String> favoriteToValue = {
  TypeFavorite.football: 'assets/types/football.png',
  TypeFavorite.nature: 'assets/types/nature.png',
  TypeFavorite.language: 'assets/types/language.png',
  TypeFavorite.photography: 'assets/types/photo.png',
  TypeFavorite.music: 'assets/types/music.png',
  TypeFavorite.writing: 'assets/types/writing.png',
};

String getValueForType(TypeFavorite type) {
  return favoriteToValue[type]!;
}

String getCapitalizedValue(TypeFavorite type) {
  String value = type.toString().split('.').last;
  return value[0].toUpperCase() + value.substring(1);
}

String getLastName(String name) => name.split(' ').last;
