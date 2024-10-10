import 'package:bookly/core/widgets/custom_loadind_indicator.dart';
import 'package:bookly/core/widgets/custom_widget_error.dart';
import 'package:bookly/features/home/precentation/precentaion/manager/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/precentation/precentaion/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturesBooksListView extends StatelessWidget {
  const FeaturesBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomWidgetError(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadindIndicator();
        }
      },
    );
  }
}
