import 'package:ahmuseum/domain/services/navigator_service.dart';
import 'package:ahmuseum/domain/view_models/error_view_model.dart';
import 'package:flutter/material.dart';

class DialogService {
  BuildContext? get context => NavigationService.navigatorKey.currentContext;

  Future<void> showErrorDialog(BaseErrorViewModel viewModel) async {
    await showModalBottomSheet(
      context: NavigationService.navigatorKey.currentContext!,
      builder: (context) => Center(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  const Icon(Icons.error_outline),
                  const SizedBox(height: 10),
                  Text(
                    viewModel.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(viewModel.description),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(viewModel.actionTitle),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
