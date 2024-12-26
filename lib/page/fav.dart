import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study1/state/app.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Phương thức để xóa phần tử khỏi danh sách yêu thích
  void removeItem(int index) {
    setState(() {
      // Xóa phần tử tại chỉ mục index từ danh sách yêu thích
      var appState = context.read<MyAppState>(); // Đọc appState
      appState.removeFavorite(
          index); // Giả sử bạn có phương thức này trong MyAppState
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState =
        context.watch<MyAppState>(); // Giám sát sự thay đổi của appState
    var fav = appState.favorites; // Lấy danh sách yêu thích từ appState

    if (fav.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('You have ${fav.length} favorites:'),
        ),

        // Sử dụng Expanded để GridView có không gian hiển thị
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Số cột
              mainAxisSpacing: 2, // Khoảng cách dọc giữa các hàng
              childAspectRatio: 2.5, // Tỉ lệ chiều rộng : chiều cao
            ),
            itemCount: fav.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Gọi phương thức để xóa phần tử khi nhấn nút xóa
                        removeItem(index);
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      fav[index].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
