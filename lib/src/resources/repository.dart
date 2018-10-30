import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../model/item_model.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsAPIProvider apiProvider = NewsAPIProvider();

  fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  fetchItems(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }

    item = await apiProvider.fetchItem(id);
    await dbProvider.addItem(item);
    return item;
  }
}
