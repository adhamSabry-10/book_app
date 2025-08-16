import 'package:book_app/Features/home/data/Models/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
part 'newset_books_state.dart';

class NewSetBooksCubit extends Cubit<NewSetBooksState> {
  NewSetBooksCubit(this.homeRepo) : super(NewSetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewSetBooksLoading());
    var result = await homeRepo.fetchNewSetBooks();
    result.fold((failure) {
      emit(NewSetBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewSetBooksSuccess(books));
    });
  }
}
