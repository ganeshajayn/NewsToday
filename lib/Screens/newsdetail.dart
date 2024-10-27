import 'package:flutter/material.dart';

import 'package:newstoday/Model/model.dart';

class DetailScreen extends StatefulWidget {
  final Newmsodel newmsodel;
  const DetailScreen({super.key, required this.newmsodel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Text(
            widget.newmsodel.title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                  child: Text(
                "- ${widget.newmsodel.author}",
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Image.network(widget.newmsodel.urlimage!),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.newmsodel.description!,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
