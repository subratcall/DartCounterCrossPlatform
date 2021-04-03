import 'package:dart_counter/app_errors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Our design contains Neumorphism design and i made a extention for it
// We can apply it on any  widget

extension Neumorphism on Widget {
  addNeumorphism({
    double borderRadius = 10.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 10,
    Color topShadowColor = CupertinoColors.white,
    Color bottomShadowColor = const Color(0x26234395),
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
          ),
        ],
      ),
      child: this,
    );
  }
}

extension ErrorMessage on Widget {
  String getErrorMessage(BuildContext context, Error error) {
    if(error is InvalidEmailAddressOrPasswordError) {
      return AppLocalizations.of(context).errorInvalidEmailAddressOrPassword;
    } else if(error is InvalidEmailAddressError) {
      return AppLocalizations.of(context).errorInvalidEmailAddress;
    } else if(error is EmptyEmailAddressError) {
      return AppLocalizations.of(context).errorEmptyEmailAddress;
    } else if(error is InvalidUsernameError) {
      return AppLocalizations.of(context).errorInvalidUsername;
    } else if(error is EmptyUsernameError) {
      return AppLocalizations.of(context).errorEmptyUsername;
    } else if(error is UsernameToShortError) {
      return AppLocalizations.of(context).errorUsernameToShort;
    } else if(error is UsernameToLongError) {
      return AppLocalizations.of(context).errorUsernameToLong;
    } else if(error is InvalidPasswordError) {
      return AppLocalizations.of(context).errorInvalidPassword;
    } else if(error is EmptyPasswordError) {
      return AppLocalizations.of(context).errorEmptyPassword;
    } else if(error is EmptyPasswordAgainError) {
      return AppLocalizations.of(context).errorEmptyPasswordAgain;
    } else if(error is PasswordNotEqualPasswordAgainError) {
      return AppLocalizations.of(context).errorPasswordNotEqualPasswordAgain;
    } else if(error is PasswordToShortError) {
      return AppLocalizations.of(context).errorPasswordToShort;
    } else if(error is PasswordToLongError) {
      return AppLocalizations.of(context).errorPasswordToLong;
    } else if(error is NetworkError) {
      return AppLocalizations.of(context).errorNetwork;
    } else if(error is EmailAddressAlreadyInUseError) {
      return AppLocalizations.of(context).errorEmailAddressAlreadyInUse;
    } else if(error is UsernameAlreadyInUseError) {
      return AppLocalizations.of(context).errorUsernameAlreadyInUse;
    } else if(error is InvalidFormDataError) {
      return AppLocalizations.of(context).errorInvalidFormData;
    }
  }
}