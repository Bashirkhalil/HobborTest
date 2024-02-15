abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  List<dynamic> bannerList = [];
  NewsSuccessState(this.bannerList);
}

class NewsErrorState extends NewsState {
  String onError ;
  NewsErrorState(this.onError);
}



