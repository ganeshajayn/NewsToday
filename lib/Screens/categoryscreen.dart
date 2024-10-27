import 'package:flutter/material.dart';
import 'package:newstoday/Model/model.dart';
import 'package:newstoday/Screens/newsdetail.dart';
import 'package:newstoday/services/services.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  String category;
  CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isloading = true;
  List<Newmsodel> articles = [];
  getnews() async {
    Newscategory news = Newscategory();
    await news.getnews(widget.category);
    articles = news.datastore;
  }

  @override
  void initState() {
    getnews();
    super.initState();
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          widget.category,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            newmsodel: article,
                          ),
                        ));
                      },
                      child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  article.urlimage!,
                                  height: 250,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                article.title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Divider(
                                color: Colors.white24,
                                thickness: 1,
                              )
                            ],
                          )),
                    );
                  }),
            ),
    );
  }
}
