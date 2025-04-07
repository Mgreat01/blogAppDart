import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/pages/articleList/listArticleState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class ListArticleCtrl extends StateNotifier<ListArticleState> {
  var blogNetwork = getIt.get<BlogNetworkService>();
  var like = getIt.get<BlogNetworkService>();
  ListArticleCtrl() : super(ListArticleState()) {
    recupererArticle();
  }

  get data => null;

  Future<void> recupererArticle() async {
    state = state.copyWith(isLoading: true);
    var res = await blogNetwork.recupererArticle();
    state = state.copyWith(isLoading: false, article: res);
  }

  Future<void> rechercherArticle(String texte) async {}

  Future<void> liker(int articleid) async {
    state = state.copyWith(isLoading: true);
    await blogNetwork.liker(articleid);
    await recupererArticle(); // Rafraîchir la liste
    state = state.copyWith(isLoading: false);
  }

  Future<void> partager(int articleid) async {}
  Future<void> filtrParCatgeories(int categoriid) async {}
  Future<void> trier(String colonne, String ordre) async {}
  Future<void> chargerPage() async {}
}

final listArticleCtrlPorvider =
StateNotifierProvider<ListArticleCtrl, ListArticleState>((ref) {
  return ListArticleCtrl();
});

