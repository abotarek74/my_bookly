import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/widgets/custom_widget_error.dart';
import 'package:bookly/features/home/precentation/precentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/precentation/precentaion/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSolcckLf6Ah5YuSuJqKs-4CxiZOYUEUezcCg&s',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFaliure) {
          return CustomWidgetError(errorMessage: state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
