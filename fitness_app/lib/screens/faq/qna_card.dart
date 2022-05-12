import 'package:flutter/material.dart';

import 'qna_data.dart';

class QnACard extends StatefulWidget {
  final int idx;
  QnACard(this.idx);

  @override
  State<QnACard> createState() => _QnACardState();
}

class _QnACardState extends State<QnACard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0XFF152646),
              borderRadius: _expanded
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                  : BorderRadius.circular(10),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                splashFactory: NoSplash.splashFactory,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    questions[widget.idx],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0XFF172A4F),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  Text(
                    answers[widget.idx],
                  ),
                  const Spacer(),
                ],
              ),
            )
        ],
      ),
    );
  }
}
