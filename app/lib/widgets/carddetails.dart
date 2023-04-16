import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hospitality_app/widgets/detailspage.dart';

class CardDetails extends StatefulWidget {
  final String id;
  final String name;
  final String incomeGroup;
  final String desease;
  int? minage;
  int? maxage;
  final String link;
  final String description;
  final String number;

  CardDetails(this.id, this.name, this.desease, this.incomeGroup, this.minage,
      this.maxage, this.description, this.link, this.number);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  int check = 0;

  @override
  Widget build(BuildContext context) {
    widget.minage = widget.minage == -1 ? 0 : widget.minage;
    widget.maxage = widget.maxage == -1 ? 100 : widget.maxage;
    String agegroup = (widget.minage == 0 && widget.maxage == 100)
        ? "All ages"
        : (widget.minage == 0)
            ? ("0-" + widget.maxage.toString())
            : (widget.maxage == 100)
                ? widget.minage.toString() + "+"
                : widget.minage.toString() + "-" + widget.maxage.toString();

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Transform.scale(
        scale: check == 1 ? 1 : 0.95,
        child: GridTile(
          child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            onTap: () {
              setState(() {
                check = 1;
              });
              Timer(Duration(seconds: 1), () {
                // <-- Delay here
                setState(() {
                  check = 0;
                });
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => DetailsPage(
                            widget.id,
                            widget.name,
                            widget.desease,
                            widget.incomeGroup,
                            widget.minage,
                            widget.maxage,
                            widget.description,
                            widget.link,
                            widget.number,
                          ))));
            },
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF247C7C).withOpacity(1),
                      Color(0xFF247C7C).withOpacity(0.1),
                      Color(0xFF247C7C).withOpacity(0.1),
                      Color(0xFF247C7C).withOpacity(0.1)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.05, 0, 0, 0],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      child: Text(
                        'Disease Benifits: ' + widget.desease,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      child: Text(
                        'For Group: ' + widget.incomeGroup,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      child: Text(
                        'Age Group: ' + agegroup,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFAFAFAF),
                            Color(0xFFB40000),
                            Color(0xFFB40000),
                            Color(0xFFAFAFAF),
                          ],
                          stops: [
                            widget.minage!.toDouble() / 100,
                            (widget.minage!.toDouble() / 100) + 0.01,
                            widget.maxage!.toDouble() / 100,
                            (widget.maxage!.toDouble() / 100) + 0.01
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
