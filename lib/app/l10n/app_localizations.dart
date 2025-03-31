import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_fr.dart' deferred as app_localizations_fr;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fr'),
    Locale('en')
  ];

  /// La langue courante
  ///
  /// In fr, this message translates to:
  /// **'Français'**
  String get language;

  /// No description provided for @chargement.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez patienter le temps que nous effectuons cette opération'**
  String get chargement;

  /// No description provided for @accessContactDataDenied.
  ///
  /// In fr, this message translates to:
  /// **'Accès aux données de contact refusé'**
  String get accessContactDataDenied;

  /// No description provided for @contactDataNotAvailable.
  ///
  /// In fr, this message translates to:
  /// **'Les données de contact ne sont pas disponibles'**
  String get contactDataNotAvailable;

  /// No description provided for @errorInternet.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur s\'est produit. Verifiez votre connexion internet'**
  String get errorInternet;

  /// No description provided for @userAuthenticationFailedMessage.
  ///
  /// In fr, this message translates to:
  /// **'Authentification incorrecte'**
  String get userAuthenticationFailedMessage;

  /// A vos marques !
  ///
  /// In fr, this message translates to:
  /// **'A vos marques !'**
  String get onYourMarks;

  /// Nous avons besoin de votre numéro de téléphone portable pour commencer
  ///
  /// In fr, this message translates to:
  /// **'Nous avons besoin de votre numéro de téléphone portable pour commencer'**
  String get subMsgPhone;

  /// Votre nº de téléphone portable *
  ///
  /// In fr, this message translates to:
  /// **'Nº de téléphone ici ...'**
  String get enterPhoneNumber;

  /// Veuillez entrer votre numéro de téléphone mobile
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer votre numéro de téléphone mobile'**
  String get errorEmptyNumber;

  /// Votre numéro de téléphone est incorrecte
  ///
  /// In fr, this message translates to:
  /// **'Votre numéro de téléphone est incorrecte'**
  String get errorNumberIncorrect;

  /// Suivant
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get next;

  /// No description provided for @ready.
  ///
  /// In fr, this message translates to:
  /// **'Prêt !'**
  String get ready;

  /// No description provided for @msgSend.
  ///
  /// In fr, this message translates to:
  /// **'Nous avons envoyé un code de vérification par SMS. Copiez et collez ci-dessous pour vérifier votre compte'**
  String get msgSend;

  /// Votre code reçu par SMS *
  ///
  /// In fr, this message translates to:
  /// **'Votre code reçu par SMS *'**
  String get codeSend;

  /// No description provided for @codeShort.
  ///
  /// In fr, this message translates to:
  /// **'Votre code est trop court'**
  String get codeShort;

  /// No description provided for @back.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get back;

  /// No description provided for @check.
  ///
  /// In fr, this message translates to:
  /// **'Verifier'**
  String get check;

  /// No description provided for @unauthorisedDistributorMessage.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'associer votre compte à un distributeur non autorisé à effectuer des opérations'**
  String get unauthorisedDistributorMessage;

  /// No description provided for @noDistributorMatchesMessage.
  ///
  /// In fr, this message translates to:
  /// **'Aucun distributeur ne correspond au code saisi'**
  String get noDistributorMatchesMessage;

  /// No description provided for @errorPreventsUpdateMessage.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur empêche la mise à jour des éléments'**
  String get errorPreventsUpdateMessage;

  /// No description provided for @lastnameOfSubscribeIsRequiredMessage.
  ///
  /// In fr, this message translates to:
  /// **'Le nom de famille de l\'abonné(e) est obligatoire'**
  String get lastnameOfSubscribeIsRequiredMessage;

  /// No description provided for @rejectedForInvalidPhonenumberMessage.
  ///
  /// In fr, this message translates to:
  /// **'Rejeté pour numéro de téléphone portable invalide'**
  String get rejectedForInvalidPhonenumberMessage;

  /// No description provided for @cityOfSubscriberIsRequiredMessage.
  ///
  /// In fr, this message translates to:
  /// **'La ville de résidence de l\'abonné(e) est obligatoire'**
  String get cityOfSubscriberIsRequiredMessage;

  /// No description provided for @rejectedForInvalidWhatsappnumberMessage.
  ///
  /// In fr, this message translates to:
  /// **'Rejeté pour numéro WhatsApp invalide'**
  String get rejectedForInvalidWhatsappnumberMessage;

  /// No description provided for @incompleteDataToIdentifySubscriberMessage.
  ///
  /// In fr, this message translates to:
  /// **'Données manquantes pour identifier l\'abonné(e)'**
  String get incompleteDataToIdentifySubscriberMessage;

  /// No description provided for @errorPreventsSubscriberIdentificationMessage.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur empêche l\'identification de l\'abonné'**
  String get errorPreventsSubscriberIdentificationMessage;

  /// No description provided for @linkAssocie.
  ///
  /// In fr, this message translates to:
  /// **'Voulez-vous associer votre compte à:'**
  String get linkAssocie;

  /// No description provided for @no.
  ///
  /// In fr, this message translates to:
  /// **'Non'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In fr, this message translates to:
  /// **'Oui'**
  String get yes;

  /// No description provided for @loadingData.
  ///
  /// In fr, this message translates to:
  /// **'Chargement des données, veuillez patienter'**
  String get loadingData;

  /// No description provided for @serviceContinuity.
  ///
  /// In fr, this message translates to:
  /// **'Continuité du service'**
  String get serviceContinuity;

  /// No description provided for @noInternet.
  ///
  /// In fr, this message translates to:
  /// **'Pas d\'Internet'**
  String get noInternet;

  /// No description provided for @tryAgain.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get tryAgain;

  /// No description provided for @veoCode.
  ///
  /// In fr, this message translates to:
  /// **'*054#'**
  String get veoCode;

  /// No description provided for @ifYouExperienceAnInternetOutageDial.
  ///
  /// In fr, this message translates to:
  /// **'En cas de panne d\'Internet, composez le'**
  String get ifYouExperienceAnInternetOutageDial;

  /// No description provided for @forAllYourResubscriptionOperations.
  ///
  /// In fr, this message translates to:
  /// **'pour toutes vos opérations de réabonnement'**
  String get forAllYourResubscriptionOperations;

  /// No description provided for @distributor.
  ///
  /// In fr, this message translates to:
  /// **'Distributeur !'**
  String get distributor;

  /// No description provided for @internetConnection.
  ///
  /// In fr, this message translates to:
  /// **'Connexion internet'**
  String get internetConnection;

  /// No description provided for @mainServer.
  ///
  /// In fr, this message translates to:
  /// **'Serveur principal'**
  String get mainServer;

  /// No description provided for @operationsServer.
  ///
  /// In fr, this message translates to:
  /// **'Serveur des opérations'**
  String get operationsServer;

  /// No description provided for @recheck.
  ///
  /// In fr, this message translates to:
  /// **'Revérifier'**
  String get recheck;

  /// No description provided for @detectedErrorConnection.
  ///
  /// In fr, this message translates to:
  /// **'Nous avons détecté une erreur lors de la connexion'**
  String get detectedErrorConnection;

  /// No description provided for @paymentServer.
  ///
  /// In fr, this message translates to:
  /// **'Serveur de payement'**
  String get paymentServer;

  /// No description provided for @entrerCodeDistributor.
  ///
  /// In fr, this message translates to:
  /// **'Code de votre distributeur *'**
  String get entrerCodeDistributor;

  /// Entrez votre identifiant ...
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre identifiant ...'**
  String get enterLogin;

  /// Entrez votre identifiant
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre identifiant Svp!'**
  String get errorLogin;

  /// Entrez votre identifiant correcte
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre identifiant correcte'**
  String get errorLoginIncorrect;

  /// Entrez votre mot de passe ...
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre mot de passe ...'**
  String get password;

  /// Mot de passe
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get passwordEnter;

  /// Entrez votre mot de passe
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre mot de passe Svp!'**
  String get errorPassword;

  /// Password is too short
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe trop court'**
  String get errorPasswordShort;

  /// Restez connecter
  ///
  /// In fr, this message translates to:
  /// **'Restez connecter'**
  String get remember;

  /// Mot de passe oublié?
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié?'**
  String get forgetPw;

  /// Connexion
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get connect;

  /// Le format du numéro est incorrect
  ///
  /// In fr, this message translates to:
  /// **'Le format du numéro est incorrect'**
  String get numberIncorrect;

  /// L'authentification de l'utilisateur a échoué! Veuillez réessayer
  ///
  /// In fr, this message translates to:
  /// **'L\'authentification de l\'utilisateur a échoué! Veuillez réessayer'**
  String get userAuthenticationFailed;

  /// Votre compte est bloqué! Veuillez contacter votre gestionnaire de compte
  ///
  /// In fr, this message translates to:
  /// **'Votre compte est bloqué! Veuillez contacter votre gestionnaire de compte'**
  String get yourAccountIsBlocked;

  /// Authentification refusée! Aucun distributeur n'est associé à votre compte
  ///
  /// In fr, this message translates to:
  /// **'Authentification refusée! Aucun distributeur n\'est associé à votre compte'**
  String get noDistributorAssociated;

  /// Authentification refusée! L'heure n'est pas autorisée pour les opérations
  ///
  /// In fr, this message translates to:
  /// **'Authentification refusée! L\'heure n\'est pas autorisée pour les opérations'**
  String get hourNotAllowed;

  /// Authentification refusée! Le profil associé à votre compte est bloqué
  ///
  /// In fr, this message translates to:
  /// **'Authentification refusée! Le profil associé à votre compte est bloqué'**
  String get profileIsBlocked;

  /// Authentification refusée! Aucun profil n'est associé à votre compte
  ///
  /// In fr, this message translates to:
  /// **'Authentification refusée! Aucun profil n\'est associé à votre compte'**
  String get noProfileAssociated;

  /// Authentification refusée! Le distributeur associé à votre compte est bloqué
  ///
  /// In fr, this message translates to:
  /// **'Authentification refusée! Le distributeur associé à votre compte est bloqué'**
  String get distributorIsBlocked;

  /// Rechercher un abonné soit par son nom et/ou prénom, son numéro de téléphone mobile ou son numéro de décodeur
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un abonné soit par son nom et/ou prénom, son numéro de téléphone mobile ou son numéro de décodeur'**
  String get msgHeaderSearch;

  /// Saisir nom et/ou prénom de l'abonné
  ///
  /// In fr, this message translates to:
  /// **'Saisir nom et/ou prénom de l\'abonné'**
  String get typeNameSubscriber;

  /// Saisir le n° de téléphone à rechercher
  ///
  /// In fr, this message translates to:
  /// **'Saisir le n° de téléphone à rechercher'**
  String get typePhoneSearch;

  /// Entrez un numéro de téléphone portable valide
  ///
  /// In fr, this message translates to:
  /// **'Entrez un numéro de téléphone portable valide'**
  String get typePhoneError;

  /// Saisir le numéro du décodeur à rechercher
  ///
  /// In fr, this message translates to:
  /// **'Saisir le numéro du décodeur à rechercher'**
  String get typeDeviceNumber;

  /// Entrer un numéro de décodeur valide
  ///
  /// In fr, this message translates to:
  /// **'Entrer un numéro de décodeur valide'**
  String get typeDeviceNumberError;

  /// RECHERCHER
  ///
  /// In fr, this message translates to:
  /// **'RECHERCHER'**
  String get search;

  /// Abonné(es) trouvé(es)
  ///
  /// In fr, this message translates to:
  /// **'Abonné(es) trouvé(es)'**
  String get subscriberFound;

  /// No description provided for @subscriber.
  ///
  /// In fr, this message translates to:
  /// **'ABONNÉ(E)'**
  String get subscriber;

  /// CONTACT
  ///
  /// In fr, this message translates to:
  /// **'CONTACT'**
  String get contact;

  /// VILLE
  ///
  /// In fr, this message translates to:
  /// **'VILLE'**
  String get city;

  /// ADRESSE / QUARTIER
  ///
  /// In fr, this message translates to:
  /// **'ADRESSE / QUARTIER'**
  String get addressDistrict;

  /// ACTION(S)
  ///
  /// In fr, this message translates to:
  /// **'ACTION(S)'**
  String get action;

  /// CHOISIR
  ///
  /// In fr, this message translates to:
  /// **'CHOISIR'**
  String get select;

  /// Carte d'abonné
  ///
  /// In fr, this message translates to:
  /// **'Carte d\'abonné'**
  String get subscriberCard;

  /// IMPORTER DECODEUR
  ///
  /// In fr, this message translates to:
  /// **'IMPORTER DECODEUR'**
  String get importDecoder;

  /// RECRUTER DECODEUR
  ///
  /// In fr, this message translates to:
  /// **'RECRUTER DECODEUR'**
  String get recruitDecoder;

  /// EDITER DECODEUR
  ///
  /// In fr, this message translates to:
  /// **'EDITER DECODEUR'**
  String get editDecoder;

  /// Importer un décodeur
  ///
  /// In fr, this message translates to:
  /// **'Importer un décodeur'**
  String get importTheDecoder;

  /// Informations sur le décodeur
  ///
  /// In fr, this message translates to:
  /// **'Informations sur le décodeur'**
  String get decoderInformation;

  /// Numéro de série
  ///
  /// In fr, this message translates to:
  /// **'Numéro de série'**
  String get serialNumber;

  /// Emplacement du décodeur (ex. MAISON / SALON)
  ///
  /// In fr, this message translates to:
  /// **'Emplacement du décodeur (ex. MAISON / SALON)'**
  String get decoderLocation;

  /// Numéro d'abonné CGA
  ///
  /// In fr, this message translates to:
  /// **'Numéro d\'abonné CGA'**
  String get cgaSubscriberId;

  /// Choisir une formule
  ///
  /// In fr, this message translates to:
  /// **'Choisir une formule'**
  String get chooseFormula;

  /// Fin d'abonnement *
  ///
  /// In fr, this message translates to:
  /// **'Fin d\'abonnement *'**
  String get endOfSubscription;

  /// Remarque dans le CGA (nom différent, n° téléphone différent, ...)
  ///
  /// In fr, this message translates to:
  /// **'Remarque dans le CGA (nom différent, n° téléphone différent, ...)'**
  String get remarkInCga;

  /// IMPORTER
  ///
  /// In fr, this message translates to:
  /// **'IMPORTER'**
  String get import;

  /// Opération terminée avec succès
  ///
  /// In fr, this message translates to:
  /// **'Opération terminée avec succès'**
  String get importSuccess;

  /// Vérifiez les champs obligatoires
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez les champs obligatoires'**
  String get requirementMsg;

  /// Ce décodeur n'est pas disponible pour le recrutement
  ///
  /// In fr, this message translates to:
  /// **'Ce décodeur n\'est pas disponible pour le recrutement'**
  String get indispoForRecruitment;

  /// N° décodeur introuvable
  ///
  /// In fr, this message translates to:
  /// **'N° décodeur introuvable'**
  String get decoderNoFound;

  /// Rechercher un décodeur
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un décodeur'**
  String get searchDevice;

  /// Aperçu du décodeur
  ///
  /// In fr, this message translates to:
  /// **'Aperçu du décodeur'**
  String get decoderOverview;

  /// N° de réabonnement
  ///
  /// In fr, this message translates to:
  /// **'N° de réabonnement'**
  String get resubscriptionNumber;

  /// Emplacement
  ///
  /// In fr, this message translates to:
  /// **'Emplacement'**
  String get location;

  /// Formule / Option(s)
  ///
  /// In fr, this message translates to:
  /// **'Formule / Option(s)'**
  String get formulaOption;

  /// Remarque CGA
  ///
  /// In fr, this message translates to:
  /// **'Remarque CGA'**
  String get cgaRemark;

  /// REABONNEMENT
  ///
  /// In fr, this message translates to:
  /// **'REABONNEMENT'**
  String get resubscription;

  /// upgrade
  ///
  /// In fr, this message translates to:
  /// **'UPGRADE'**
  String get upgrade;

  /// AJOUT D'OPTION(S)
  ///
  /// In fr, this message translates to:
  /// **'AJOUT D\'OPTION(S)'**
  String get addOption;

  /// CHADEC
  ///
  /// In fr, this message translates to:
  /// **'CHADEC'**
  String get chadec;

  /// MODIFIER
  ///
  /// In fr, this message translates to:
  /// **'MODIFIER'**
  String get edit;

  /// SMS
  ///
  /// In fr, this message translates to:
  /// **'SMS'**
  String get sms;

  /// Avis d'échéance
  ///
  /// In fr, this message translates to:
  /// **'Avis d\'échéance'**
  String get deadlineNotice;

  /// A envoyer à
  ///
  /// In fr, this message translates to:
  /// **'A envoyer à'**
  String get toBeSendTo;

  /// SUBMIT
  ///
  /// In fr, this message translates to:
  /// **'SUBMIT'**
  String get submit;

  /// Votre message a été envoyé avec succès
  ///
  /// In fr, this message translates to:
  /// **'Votre message a été envoyé avec succès'**
  String get smsSuccess;

  /// Changer de decodeur
  ///
  /// In fr, this message translates to:
  /// **'Changer de decodeur'**
  String get changeDecoder;

  /// Date of operation
  ///
  /// In fr, this message translates to:
  /// **'Date de l\'opération'**
  String get dateOfOperation;

  /// EVALUER
  ///
  /// In fr, this message translates to:
  /// **'EVALUER'**
  String get evaluate;

  /// Monsieur
  ///
  /// In fr, this message translates to:
  /// **'M.'**
  String get genreMan;

  /// Madame
  ///
  /// In fr, this message translates to:
  /// **'Mme'**
  String get genreWoman;

  /// Une erreur empêche l'opération de se dérouler correctement (DECODEUR INTROUVABLE)
  ///
  /// In fr, this message translates to:
  /// **'Une erreur empêche l\'opération de se dérouler correctement (DECODEUR INTROUVABLE)'**
  String get changeDecoderNotFound;

  /// Le décodeur 87788774474455 n'est pas disponible pour le changement
  ///
  /// In fr, this message translates to:
  /// **'Le décodeur {numDecoder} n\'est pas disponible pour le changement'**
  String changeDecoderNotChange(String numDecoder);

  /// Le décodeur 87788774474455 n'existe pas dans cette plate-forme, vous pouvez l'importer
  ///
  /// In fr, this message translates to:
  /// **'Le décodeur {numDecoder} n\'existe pas dans cette plate-forme, vous pouvez l\'importer'**
  String decoderNoExist(String numDecoder);

  /// Decoder 87788774474455 is not available for change
  ///
  /// In fr, this message translates to:
  /// **'ECHU DEPUIS {numDecoder} JOUR(S)'**
  String expiredSince(String numDecoder);

  /// Decoder 87788774474455 is not available for change
  ///
  /// In fr, this message translates to:
  /// **'Vous avez annulé votre opération sur le décodeur {numDecoder}. {solde} CFA et {equipement} ont été reversés respectivement sur votre compte principal et équipements'**
  String operationAnnuler(String numDecoder, String solde, String equipement);

  /// Numéro d'abonné CGA
  ///
  /// In fr, this message translates to:
  /// **'Numéro d\'abonné CGA'**
  String get numberSubcriberCGA;

  /// Quelque chose ne marche pas avec les paramètres de ce formulaire
  ///
  /// In fr, this message translates to:
  /// **'Quelque chose ne marche pas avec les paramètres de ce formulaire'**
  String get parameterWrongSearch;

  /// Aucun abonné ne correspond aux données fournies, veuillez réessayer
  ///
  /// In fr, this message translates to:
  /// **'Aucun abonné ne correspond aux données fournies, veuillez réessayer'**
  String get subscriberNotFound;

  /// Veuillez entrez les parametres de rechercher
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrez les parametres de rechercher'**
  String get emptyParameter;

  /// Veuillez patientez le temps que nous effectuons cette opération
  ///
  /// In fr, this message translates to:
  /// **'Veuillez patientez le temps que nous effectuons cette opération '**
  String get waitEndOperation;

  /// Informations sur l'abonnement
  ///
  /// In fr, this message translates to:
  /// **'Informations sur l\'abonnement'**
  String get subscriptionInformation;

  /// Inclure option(s)
  ///
  /// In fr, this message translates to:
  /// **'Inclure option(s)'**
  String get includeOption;

  /// Informations sur l'abonné
  ///
  /// In fr, this message translates to:
  /// **'Informations sur l\'abonné'**
  String get subscriberInformation;

  /// Cet abonné n'a pas de décodeur
  ///
  /// In fr, this message translates to:
  /// **'Cet abonné n\'a pas de décodeur'**
  String get noDecoderForthisSubcriber;

  /// Pas l'opération pour ce decodeur
  ///
  /// In fr, this message translates to:
  /// **'Pas l\'opération pour ce decodeur'**
  String get noOperationForthisDecoder;

  /// Option(s)
  ///
  /// In fr, this message translates to:
  /// **'Option(s)'**
  String get options;

  /// Formule
  ///
  /// In fr, this message translates to:
  /// **'Formule'**
  String get formula;

  /// Une erreur s'est produit. Verifiez votre connexion internet
  ///
  /// In fr, this message translates to:
  /// **'Une erreur s\'est produit. Verifiez votre connexion internet '**
  String get connexionError;

  /// Informations sur le réabonnement
  ///
  /// In fr, this message translates to:
  /// **'Informations sur le réabonnement'**
  String get informationResubscription;

  /// The conventional newborn programmer greeting
  ///
  /// In fr, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// Initial welcome message
  ///
  /// In fr, this message translates to:
  /// **'Welcome {firstName}'**
  String welcome(Object firstName);

  /// Number of new messages in inbox.
  ///
  /// In fr, this message translates to:
  /// **'{newMessages, plural, =0 {No new messages} =1 {One new message} other {{newMessages} new messages}}'**
  String newMessages(num newMessages);

  /// Articles screen title
  ///
  /// In fr, this message translates to:
  /// **'Your content digest'**
  String get articlesTitle;

  /// Alt text for the articles thumbnails
  ///
  /// In fr, this message translates to:
  /// **'Article Thumbnail'**
  String get articleThumbnailAlt;

  /// No articles found alert text
  ///
  /// In fr, this message translates to:
  /// **'No articles found'**
  String get noArticlesFound;

  /// Comma-separated list of organization names.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =0{Unknown organizations} =1{Organization: {organizations}} other{Organizations: {organizations}}}'**
  String contentCardOrganizationsLabel(num count, String organizations);

  /// No description provided for @savedNewsArticlesPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'All saved news articles ({count})'**
  String savedNewsArticlesPageTitle(int count);

  /// No description provided for @dialogAppUpdateTitle.
  ///
  /// In fr, this message translates to:
  /// **'Update Available'**
  String get dialogAppUpdateTitle;

  /// No description provided for @dialogAppUpdateDescription.
  ///
  /// In fr, this message translates to:
  /// **'A new version of fluttertemplate is available. Please update now.'**
  String get dialogAppUpdateDescription;

  /// No description provided for @dialogAppUpdateConfirmationButton.
  ///
  /// In fr, this message translates to:
  /// **'Update'**
  String get dialogAppUpdateConfirmationButton;

  /// No description provided for @dialogAppUpdateDismissButton.
  ///
  /// In fr, this message translates to:
  /// **'Not Now'**
  String get dialogAppUpdateDismissButton;

  /// No description provided for @error.
  ///
  /// In fr, this message translates to:
  /// **'Error'**
  String get error;

  /// Text for an unexpected error
  ///
  /// In fr, this message translates to:
  /// **'It seems something has broken!'**
  String get defaultErrorPageTitle;

  /// Text for an unexpected error
  ///
  /// In fr, this message translates to:
  /// **'Let\'s help get you back'**
  String get defaultErrorPageDescription;

  /// Text for an unexpected empty page
  ///
  /// In fr, this message translates to:
  /// **'Nothing to see here'**
  String get defaultEmptyPageTitle;

  /// Text for an unexpected empty page
  ///
  /// In fr, this message translates to:
  /// **'It seems this page has no content...'**
  String get defaultEmptyPageDescription;

  /// Text for a page that failed to load due to no internet connection
  ///
  /// In fr, this message translates to:
  /// **'Whoops!'**
  String get defaultNoInternetPageTitle;

  /// Text for a page that failed to load due to no internet connection
  ///
  /// In fr, this message translates to:
  /// **'Slow or no internet connection.\nPlease check your internet settings.'**
  String get defaultNoInternetPageDescription;

  /// Text for a button that refreshes the page
  ///
  /// In fr, this message translates to:
  /// **'Refresh'**
  String get refreshAction;

  /// Text for a button that takes the user back to the previous page
  ///
  /// In fr, this message translates to:
  /// **'Go Back'**
  String get backAction;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return app_localizations_en.loadLibrary().then((dynamic _) => app_localizations_en.AppLocalizationsEn());
    case 'fr': return app_localizations_fr.loadLibrary().then((dynamic _) => app_localizations_fr.AppLocalizationsFr());
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
