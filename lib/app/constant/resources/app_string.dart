class AppString {
  AppString._();

  static const String appName = 'Talkware Member App';
  static const String profileTitle = 'Talkware Member Profile';
  static const String profileMenuTitle = 'Profile';
  static const String walletMenuTitle = 'Wallet';
  static const String signInBrandName = 'Talkware Journey';
  static const String signInTitle = 'Log In';
  static const String signInSubtitle = 'Please log in to continue.';
  static const String signInWithGoogle = 'Sign in with Google';
  static const String signInLoadingLabel = 'Please wait...';
  static const String signingInMessage = 'Opening Google Sign-In...';
  static const String restoreSessionMessage =
      'Checking for an existing Google session...';
  static const String restoreSessionErrorMessage =
      'Could not restore a previous Google session. Please sign in again.';
  static const String signInErrorTitle = 'Sign-in failed';
  static const String signInErrorMessage =
      'Please check Google Sign-In setup and try again.';
  static const String googleSignInErrorPrefix = 'Google error: ';
  static const String googleSignInUnsupportedMessage =
      'This platform requires the Google-rendered sign-in button. Try Android/iOS for now, or configure the web Google Sign-In flow.';
  static const String signInCanceledMessage = 'Sign-in was canceled.';
  static const String termsOfService = 'Terms of Service';
  static const String privacyPolicy = 'Privacy Policy';
  static const String signOut = 'Sign out';
  static const String signedOutMessage =
      'Sign in to continue to your Talkware learning profile.';
  static const String memberStatusTitle = 'Talkware Member Status';
  static const String memberStatusLabel = 'Builder Member';
  static const String memberStatusDescription =
      'Activated for Week 2 learning participation.';
  static const String classroomTitle = 'Classroom Context';
  static const String classroomCourseName = 'Talkware Builder Training';
  static const String classroomAssignmentTitle = 'Week 2 Member App Foundation';
  static const String classroomAssignmentStatus = 'Ready to start';
  static const String classroomLoadingMessage =
      'Loading Talkware Classroom data...';
  static const String classroomCourseNameUnavailable =
      'Talkware Classroom Course';
  static const String classroomNoCourseAccess =
      'You are signed in, but this Google account does not have access to the Talkware Classroom course.';
  static const String classroomPermissionNotGranted =
      'Classroom permission was not granted. Please sign out and sign in again.';
  static const String classroomTemporaryUnavailable =
      'Classroom data is temporarily unavailable.';
  static const String classroomCourseWorkUnavailable =
      'Coursework is unavailable with the current Classroom permission.';
  static const String classroomAnnouncementUnavailable =
      'Announcements are unavailable with the current Classroom permission.';
  static const String classroomNoRecentAcademicContext =
      'No recent Classroom activity is available yet.';
  static const String classroomCourseWorkLabel = 'Recent coursework';
  static const String classroomAnnouncementLabel = 'Announcement';
  static const String pointsTitle = 'Talkware Points';
  static const String pointsPlaceholder =
      'Points are reserved for a future participation economy phase.';
  static const String walletTitle = 'Talkware Points Wallet';
  static const String walletDefaultPointName = 'Reward Points';
  static const String walletBalanceLabel = 'Available balance';
  static const String walletStatusTitle = 'Wallet Status';
  static const String walletActionsTitle = 'Wallet Actions';
  static const String walletActivateButton = 'Activate Wallet';
  static const String walletLoadingConfigMessage =
      'Loading loyalty system config...';
  static const String walletReadyToActivateMessage =
      'Activate your wallet by selecting your customer access ZIP file from this phone.';
  static const String walletSelectingAccessZipMessage =
      'Select your customer access ZIP file.';
  static const String walletAccessSelectionCanceled =
      'Wallet activation was canceled.';
  static const String walletPublicKeyCopied = 'Wallet public key copied.';
  static const String walletReceiveTitle = 'Receive';
  static const String walletSendTitle = 'Send';
  static const String walletHistoryTitle = 'History';
  static const String walletHistoryLink = 'History';
  static const String walletCustomerLabel = 'Wallet owner';
  static const String walletPublicKeyLabel = 'Wallet public key';
  static const String walletQrLabel = 'Scan to receive points';
  static const String walletAssetCodeLabel = 'Asset code';
  static const String walletBalanceValueLabel = 'Balance';
  static const String walletCopyPublicKey = 'Copy public key';
  static const String walletRefreshBalance = 'Refresh balance';
  static const String walletRecipientLabel = 'Recipient ID';
  static const String walletRecipientHint = 'Paste or scan recipient wallet ID';
  static const String walletRecipientReadonlyHint = 'Scanned recipient wallet';
  static const String walletAmountLabel = 'Amount';
  static const String walletAssetReadonlyLabel = 'Talkware Points asset';
  static const String walletScanQrTitle = 'Scan recipient QR';
  static const String walletScannerActive = 'Point the camera at a wallet QR.';
  static const String walletScannerOpening = 'Opening scanner...';
  static const String walletScannerUnavailable =
      'Camera scanner is not available. Paste the recipient ID below.';
  static const String walletScannerPermissionDenied =
      'Camera permission is required to scan QR codes.';
  static const String walletRecipientCaptured = 'Recipient ID captured.';
  static const String walletInvalidQr =
      'That QR does not contain a valid wallet ID.';
  static const String walletScanAgain = 'Scan again';
  static const String walletUnavailableValue = 'Unavailable';
  static const String walletActivateFirstMessage =
      'Activate your wallet before using this action.';
  static const String walletSendPlaceholder =
      'Scan a recipient QR to send points.';
  static const String walletPasscodeTitle = 'Wallet passcode';
  static const String walletCreatePasscodeMessage =
      'Create a customer passcode to encrypt this wallet on this phone.';
  static const String walletUnlockPasscodeMessage =
      'Enter your customer passcode to unlock sending for this app session.';
  static const String walletPasscodeLabel = 'Passcode';
  static const String walletCancel = 'Cancel';
  static const String walletContinue = 'Continue';
  static const String walletUnlockButton = 'Unlock wallet';
  static const String walletReviewTitle = 'Review Send';
  static const String walletConfirmSend = 'Confirm send';
  static const String walletValidationReady =
      'Recipient is ready to receive points.';
  static const String walletValidatingRecipient =
      'Checking recipient trustline...';
  static const String walletInvalidAmount =
      'Enter a valid amount greater than zero.';
  static const String walletLockedMessage =
      'Wallet is locked. Unlock it to send points.';
  static const String walletSecretMissingMessage =
      'This wallet was activated before local signing was added. Reimport the access ZIP to encrypt the customer secret.';
  static const String walletSendSuccess = 'Points sent successfully.';
  static const String walletSendFailure = 'Points could not be sent.';
  static const String walletNoHistory = 'No transaction history yet.';
  static const String walletTransactionSuccess = 'Success';
  static const String walletTransactionFailed = 'Failed';
  static const String walletTransactionHashLabel = 'Transaction hash';
  static const String walletErrorLabel = 'Error';
  static const String walletNetworkLabel = 'Network';
}
