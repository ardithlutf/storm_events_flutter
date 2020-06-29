import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:stormeventslima/data/models/fitur.dart';
import 'package:stormeventslima/data/repositories/markdown_repository.dart';
import 'package:stormeventslima/screens/fitur_details/widgets/fitur_details_header.dart';
import 'package:stormeventslima/widgets/fade_slide_transition.dart';
import 'package:stormeventslima/widgets/platform_specific/platform_back_button.dart';

import '../../constants.dart';

class FiturDetails extends StatefulWidget {
  final Fitur designPattern;
  final Widget example;

  const FiturDetails({
    @required this.designPattern,
    @required this.example,
  })  : assert(designPattern != null),
        assert(example != null);

  @override
  _FiturDetailsState createState() => _FiturDetailsState();
}

class _FiturDetailsState extends State<FiturDetails>
    with TickerProviderStateMixin {
  final MarkdownRepository repository = MarkdownRepository();

  final double _contentAnimationIntervalStart = 0.65;
  final double _preferredAppBarHeight = 56.0;

  AnimationController _fadeSlideAnimationController;
  ScrollController _scrollController;
  TabController _tabController;
  double _appBarElevation = 0.0;
  double _appBarTitleOpacity = 0.0;
  double _bottomNavigationBarElevation = 4.0;

  @override
  void initState() {
    super.initState();

    _fadeSlideAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarElevation =
              _scrollController.offset > _scrollController.initialScrollOffset
                  ? 4.0
                  : 0.0;
          _appBarTitleOpacity = _scrollController.offset >
                  _scrollController.initialScrollOffset +
                      _preferredAppBarHeight / 2
              ? 1.0
              : 0.0;
          _bottomNavigationBarElevation = _scrollController.offset ==
                  _scrollController.position.maxScrollExtent
              ? 0.0
              : 4.0;
        });
      });

    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _fadeSlideAnimationController.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void onBottomNavigationBarItemTap(int index) {
    setState(() {
      _appBarElevation = 0.0;
      _appBarTitleOpacity = 0.0;
      _bottomNavigationBarElevation = 4.0;
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FadeSlideTransition(
        controller: _fadeSlideAnimationController,
        slideAnimationTween: Tween<Offset>(
          begin: Offset(0.0, 1.0),
          end: Offset(0.0, 0.0),
        ),
        begin: _contentAnimationIntervalStart,
        end: 1.0,
        child: BottomNavigationBar(
          currentIndex: _tabController.index,
          backgroundColor: lightBackgroundColor,
          elevation: _bottomNavigationBarElevation,
          selectedIconTheme: IconThemeData(size: 20.0),
          selectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(size: 20.0),
          unselectedItemColor: Colors.black45,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('Deskripsi'),
              icon: Icon(FontAwesomeIcons.fileAlt),
            ),
            BottomNavigationBarItem(
              title: Text('Contoh'),
              icon: Icon(FontAwesomeIcons.lightbulb),
            ),
          ],
          onTap: onBottomNavigationBarItemTap,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: "${widget.designPattern.id}_background",
            child: Container(
              color: lightBackgroundColor,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                FadeSlideTransition(
                  controller: _fadeSlideAnimationController,
                  slideAnimationTween: Tween<Offset>(
                    begin: Offset(0.0, 0.5),
                    end: Offset(0.0, 0.0),
                  ),
                  begin: 0.0,
                  end: _contentAnimationIntervalStart,
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(_preferredAppBarHeight),
                    child: AppBar(
                      title: AnimatedOpacity(
                        opacity: _appBarTitleOpacity,
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          widget.designPattern.title,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      backgroundColor: lightBackgroundColor,
                      elevation: _appBarElevation,
                      leading: PlatformBackButton(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      ScrollConfiguration(
                        behavior: ScrollBehavior(),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: const EdgeInsets.fromLTRB(
                            paddingL,
                            paddingZero,
                            paddingL,
                            paddingL,
                          ),
                          child: Column(
                            children: <Widget>[
                              FadeSlideTransition(
                                controller: _fadeSlideAnimationController,
                                slideAnimationTween: Tween<Offset>(
                                  begin: Offset(0.0, 0.25),
                                  end: Offset(0.0, 0.0),
                                ),
                                begin: 0.0,
                                end: _contentAnimationIntervalStart,
                                child: FiturDetailsHeader(
                                  designPattern: widget.designPattern,
                                ),
                              ),
                              const SizedBox(height: spaceL),
                              FadeSlideTransition(
                                controller: _fadeSlideAnimationController,
                                slideAnimationTween: Tween<Offset>(
                                  begin: Offset(0.0, 0.01),
                                  end: Offset(0.0, 0.0),
                                ),
                                begin: _contentAnimationIntervalStart,
                                end: 1.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.example,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
