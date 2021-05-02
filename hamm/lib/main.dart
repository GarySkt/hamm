import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hamm/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final HttpLink httpLink = new HttpLink(uri: 'http://3.128.156.146:4000/');

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client =
        new ValueNotifier<GraphQLClient>(
            GraphQLClient(link: httpLink, cache: InMemoryCache()));
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'log_in',
        routes: appRoutes,
      ),
    );
  }
}
