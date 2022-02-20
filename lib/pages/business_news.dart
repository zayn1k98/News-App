import 'package:flutter/material.dart';
import 'package:assgn_digia_tech/models/news_model.dart';
import 'package:assgn_digia_tech/services/business_news_service.dart';
import 'package:assgn_digia_tech/widgets/search_bar.dart';
import 'package:assgn_digia_tech/widgets/nav_drawer.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({Key? key}) : super(key: key);

  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  bool _loading = true;
  var newsList;
  List<NewsModel> businessArticles = [];
  void getBusinessNews() async {
    BusinessNewsService apiNews = BusinessNewsService();
    await apiNews.getBusinessNews();
    businessArticles = apiNews.apiBizNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getBusinessNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News API',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.cyan[50],
          iconTheme: IconThemeData(color: Colors.black),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 26),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
              ),
            ),
          ],
        ),
        drawer: navDrawer(),
        body: SafeArea(
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Container(
                          child: ListView.builder(
                            itemCount: businessArticles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        businessArticles[index].urlToImage,
                                      ),
                                      SizedBox(height: 8.0),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          businessArticles[index].title,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5.0,
                                          bottom: 8.0,
                                        ),
                                        child: Text(
                                          businessArticles[index].description,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
    ;
  }
}
