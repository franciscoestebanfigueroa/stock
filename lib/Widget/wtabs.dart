import 'package:flutter/material.dart';
import 'package:stock/bloc/block_bloc.dart';

class WTabs extends StatefulWidget {
  ScrollController scrollController;

  WTabs({
    required this.state,
    required this.scrollController,
  });

  final BlockState state;

  @override
  _WTabsState createState() => _WTabsState();
}

class _WTabsState extends State<WTabs> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController =
        TabController(length: widget.state.datos.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> ltabs = widget.state.datos
        .map((e) => Tab(
              child: Text(
                '${e.categoria}'.toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
            ))
        .toList();

    return Container(
      color: Colors.amber,
      child: TabBar(
        onTap: (index) {
          setState(() {
            int x = 0;
            for (int i = 0; i < index; i++) {
              x += widget.state.datos[i].cantidadproductos;
            }
            widget.scrollController.animateTo(((x + index) * 50),
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate);
            print(widget.state.datos[index].cantidadproductos + 2);
          });
        },
        isScrollable: true,
        tabs: ltabs,
        controller: tabController,
      ),
      height: 50,
    );
  }
}
