import 'package:flutter/material.dart';
import 'navBar.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class searchPage extends StatefulWidget {
  searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  List<Article> articles = [];

  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    final url = Uri.parse("https://www.themoviedb.org/movie");
    final respose = await http.get(url);
    dom.Document html = dom.Document.html(respose.body);

    final titles = html
        .querySelectorAll('h2 > a')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll('h2 > a')
        .map((element) =>
            'https://www.themoviedb.org${element.attributes['href']}')
        .toList();

    final urlImages = html
        .querySelectorAll('div.image > div.wrapper > a > img')
        .map(
          (element) =>
              'https://www.themoviedb.org/${element.attributes['src']}',
        )
        .toList();

    print('Count: ${titles.length}');

    setState(() {
      articles = List.generate(
          titles.length,
          (index) => Article(
                url: urls[index],
                title: titles[index],
                urlImage: urlImages[index],
              ));
    });

    /* for (final title in titles) {
      debugPrint(title);
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Popular Movies'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 9, 69, 165),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            leading: Image.network(
              article.urlImage,
              width: 50,
              fit: BoxFit.fitHeight,
            ),
            title: Text(article.title),
            subtitle: Text(article.url),
          );
        },
      ),
      bottomNavigationBar: customNavBar(selectedMenu: menuState.search),
    );
  }
}

class Article {
  final String url;
  final String title;
  final String urlImage;

  const Article(
      {required this.url, required this.title, required this.urlImage});
}
