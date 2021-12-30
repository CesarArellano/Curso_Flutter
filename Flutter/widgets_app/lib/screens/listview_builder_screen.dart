import 'package:flutter/material.dart';
import 'package:widgets_app/theme/app_theme.dart';


class ListViewBuilderScreen extends StatefulWidget {

  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> _imagesIds = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() { 
      if( ( _scrollController.position.pixels + 500 ) >= _scrollController.position.maxScrollExtent ) {
        fetchData();
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void addFiveItems() {
    
    final lastId = _imagesIds.last;

    _imagesIds.addAll(
      [ 1, 2, 3, 4, 5 ].map((e) => lastId + e)
    );

    setState(() {});
  }

  Future<void> fetchData() async {
    if( isLoading ) return;

    isLoading = true;
    setState(() { });

    await Future.delayed( const Duration( seconds: 1 ) );
    addFiveItems();

    isLoading = false;
    setState(() { });

    if( _scrollController.position.pixels + 100 <= _scrollController.position.maxScrollExtent ) return;

    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      duration: const Duration( milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed( const Duration( seconds: 2 ) );
    final lastId = _imagesIds.last;
    _imagesIds.clear();
    _imagesIds.add( lastId + 1 );
    addFiveItems();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primaryColor,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                itemCount: _imagesIds.length,
                itemBuilder: ( _, int i) => FadeInImage(
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage('https://picsum.photos/500/300?images=${ _imagesIds[i] }')
                )
              ),
            ),
            
            if( isLoading )
              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon()
              )
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100)
      ),
      child: const CircularProgressIndicator.adaptive( backgroundColor: AppTheme.primaryColor )
    );
  }
}