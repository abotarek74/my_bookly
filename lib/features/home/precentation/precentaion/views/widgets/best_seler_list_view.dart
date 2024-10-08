import 'package:bookly/features/home/precentation/precentaion/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSelerListView extends StatelessWidget {
  const BestSelerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}
