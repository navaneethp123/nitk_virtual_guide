import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './data/events.dart';
import './data/news.dart';

import './ui/screens/add_event_screen.dart';
import './ui/screens/add_news_article_screen.dart';
import './ui/screens/article-screen.dart';
import './ui/screens/events-screen.dart';
import './ui/screens/news-screen.dart';
import './ui/screens/mess-screen.dart';
import './ui/screens/splash-screen.dart';
import './ui/transitions/custom_page_route.dart';
import './ui/transitions/display_screen_page_transition_builder.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Events>(create: (_) => Events()),
        ChangeNotifierProvider<News>(create: (_) => News()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: kToolbarHeight * 0.6,
                fontFamily: 'Quicksand',
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: DisplayScreenPageTransitionBuilder(),
              TargetPlatform.iOS: DisplayScreenPageTransitionBuilder(),
            },
          ),
        ),
        home: SplashScreen(child: EventsScreen()),
        routes: {
          EventsScreen.routeName: (context) => EventsScreen(),
          MessScreen.routeName: (context) => MessScreen(),
          NewsScreen.routeName: (context) => NewsScreen()
        },
        onGenerateRoute: (settings) {
          Widget screen;
          TransitionType transitionType;

          switch (settings.name) {
            case AddEventsScreen.routeName:
              screen = AddEventsScreen();
              transitionType = TransitionType.SLIDE;
              break;
            case AddNewsArticleScreen.routeName:
              screen = AddNewsArticleScreen();
              transitionType = TransitionType.SLIDE;
              break;
            case ArticleScreen.routeName:
              screen = ArticleScreen();
              transitionType = TransitionType.SIZE;
          }

          return CustomPageRoute<dynamic>(
            builder: (context) => screen,
            transitionType: transitionType,
            settings: settings,
          );
        },
      ),
    );
  }
}
