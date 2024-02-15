import 'package:flutter/cupertino.dart';

import '../../injection_container.dart';
import '../cubit/user_cubit.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  NewsCubit mNewsCubit = sl<NewsCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mNewsCubit.getNewsApi();

  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(

    );
  }
}
