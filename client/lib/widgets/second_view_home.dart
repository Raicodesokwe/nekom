import 'package:app/screens/search_suppliers.dart';
import 'package:app/widgets/second_homebox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/home_model.dart';
import '../screens/add_supplier_page.dart';
import '../screens/all_suppliers.dart';
import '../utils/supplier_data.dart';

class SecondViewHome extends StatefulWidget {
  const SecondViewHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SecondViewHome> createState() => _SecondViewHomeState();
}

class _SecondViewHomeState extends State<SecondViewHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Here are the various supplier\nactions you can undertake',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: widget.size.height * 0.04),
        ),
        SizedBox(
          height: widget.size.height * 0.04,
        ),
        Text(
          'We offer various tools enabling you\nto manage your suppliers effectively',
          style: GoogleFonts.prompt(
              fontWeight: FontWeight.w500, fontSize: widget.size.height * 0.02),
        ),
        SizedBox(
          height: widget.size.height * 0.04,
        ),
        Center(
          child: Wrap(
            spacing: widget.size.width * 0.03,
            runSpacing: widget.size.height * 0.03,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.hardEdge,
            children: List.generate(
                firstHomeList.length,
                (index) => InkWell(
                      onTap: () {
                        setState(() {
                          SupplierData.status = firstHomeList[index].name;
                        });
                        firstHomeList[index].name == 'Add supplier' ||
                                firstHomeList[index].name == 'Update supplier'
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddSupplierPage()))
                            : null;
                      },
                      child: SecondHomeBox(
                          name: firstHomeList[index].name,
                          icon: firstHomeList[index].icon),
                    )),
          ),
        ),
        SizedBox(
          height: widget.size.height * 0.03,
        ),
        Center(
          child: Wrap(
            spacing: widget.size.width * 0.03,
            runSpacing: widget.size.height * 0.03,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.hardEdge,
            children: List.generate(
                secondHomeList.length,
                (index) => GestureDetector(
                      onTap: () {
                        secondHomeList[index].name == 'All suppliers'
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AllSuppliers()))
                            : secondHomeList[index].name == 'Search supplier'
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SearchSuppliers()))
                                : null;
                      },
                      child: SecondHomeBox(
                          name: secondHomeList[index].name,
                          icon: secondHomeList[index].icon),
                    )),
          ),
        ),
      ],
    );
  }
}
