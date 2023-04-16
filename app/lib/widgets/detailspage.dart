import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  final String name;
  final String incomeGroup;
  final String desease;
  int? minage;
  int? maxage;
  final String description;

  DetailsPage(this.id, this.name, this.desease, this.incomeGroup, this.minage,
      this.maxage, this.description);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            onTap: null,
            child: Container(
              height: double.infinity,
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50, bottom: 30),
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
                          height: 15,
                          width: 200,
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
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          softWrap: false,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFF247C7C),
                              ),
                            ),
                            onPressed: null,
                            child: const Text(
                              "Link To Apply",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                backgroundColor: Color(0xFF247C7C),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
