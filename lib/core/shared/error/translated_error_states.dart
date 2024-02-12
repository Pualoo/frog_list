import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frog_list/core/shared/error/failures.dart';

String translateFailureToMessage({
  required Failure failure,
  required BuildContext context,
}) {
  final translate = AppLocalizations.of(context)!;
  switch (failure) {
    case CacheFailure _:
      return translate.errorCacheFailure;
    default:
      return translate.unexpectedFailure + failure.errorMessage;
  }
}
