class GeneralErrorViewModel extends BaseErrorViewModel {
  GeneralErrorViewModel({
    String? title,
    String? description,
    String? actionTitle,
  }) : super(
          title: title ?? 'Oops... ',
          description: description ?? 'Something went wrong. Please try later',
          actionTitle: actionTitle ?? 'Close',
        );
}

abstract class BaseErrorViewModel {
  final String title;
  final String description;
  final String actionTitle;

  BaseErrorViewModel({
    required this.title,
    required this.description,
    required this.actionTitle,
  });
}
