import 'package:flutter/material.dart';

import '../modules/album/controller/AlbumController.dart';
import '../modules/album/model/Album.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({required this.album});

  final List<Album> album;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 400,
      child: ListView.builder(
        itemCount: album.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              "${album[index].id}",
              style: const TextStyle(fontSize: 20),
            ),
            title: Text(
              "${album[index].title}",
              style: const TextStyle(fontSize: 20),
            ),
            trailing: IconButton(
                onPressed: () {
                  Future<Album> albumDeleted =
                      AlbumController.deleteAlbum(album[index].id.toString());
                  albumDeleted.then((value) => {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(value.title ?? 'Deleted!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          ),
                        )
                      });
                },
                icon: Icon(Icons.delete)),
          );
          //return Text("${album[index].title}");
        },
      ),
    );
  }
}
