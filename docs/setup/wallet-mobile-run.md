# Wallet Mobile Run Setup

This guide explains how to run the Talkware Points wallet flow on a real phone.

The public repo must not commit real loyalty system secrets. Each developer or student must create a local runtime config on their own machine.

## Required Local Files

The app expects this local config file:

```txt
assets/config/loyalty-system-config.local.json
```

This file is gitignored and must stay local.

The committed template is:

```txt
assets/config/loyalty-system-config.example.json
```

Start by copying the example:

```powershell
Copy-Item -LiteralPath "assets\config\loyalty-system-config.example.json" -Destination "assets\config\loyalty-system-config.local.json"
```

Then fill in your own real values.

For the course owner machine, the current local reference source is:

```txt
D:\FTLP\Loyalty Apps\testingaccs\loyalty-system-configUpdated.json
```

That file can be copied into the app as:

```powershell
Copy-Item -LiteralPath "D:\FTLP\Loyalty Apps\testingaccs\loyalty-system-configUpdated.json" -Destination "assets\config\loyalty-system-config.local.json" -Force
```

Do not commit `loyalty-system-config.local.json`.

## Config Values The App Uses

The wallet runtime reads these values from the local config:

```txt
businessProfile.merchantName
loyaltyProgram.pointName
loyaltyProgram.assetCode
systemAccounts.issuer.publicKey
network.horizonUrl
network.nownodeApiKey
```

The example config must use placeholders only. Do not put real NowNodes API keys, encrypted seeds, issuer secrets, distributor secrets, or merchant production values into the example file.

## Customer Access ZIP

Wallet activation happens inside the mobile app.

The app does not hardcode a customer ZIP filename. Put the customer access ZIP file onto the phone, then select it from the app.

Current reference ZIP format:

```txt
D:\FTLP\Loyalty Apps\testingaccs\customer_access_2026-06-03T16-28-20-343Z.zip
```

The ZIP contains a customer access text file with fields such as:

```txt
Customer Name
Customer ID
Phone
Public Key
Secret
Recovery Phrase
Derivation Path
Asset Code
```

The app displays the wallet public key and loyalty asset balance. Secret and recovery phrase values are parsed only as part of the distributor-generated access package and should not be shown casually or committed anywhere.

After the first successful activation, the app stores non-secret wallet metadata on the device so the wallet can reopen without selecting the ZIP again. It stores the wallet owner labels, public key, and asset code. It also encrypts the imported customer secret locally with a customer passcode-derived key for Send signing. It does not store the plaintext wallet secret, the passcode, recovery phrase, or derivation path.

## Run On Android Phone

1. Confirm the local config exists:

```txt
assets/config/loyalty-system-config.local.json
```

2. Install dependencies:

```powershell
C:\src\flutter\bin\flutter.bat pub get
```

3. Connect the Android phone and confirm Flutter can see it:

```powershell
C:\src\flutter\bin\flutter.bat devices
```

4. Run the app:

```powershell
C:\src\flutter\bin\flutter.bat run
```

5. Sign in with Google.

6. Open the drawer from the profile screen.

7. Tap `Wallet`.

8. Tap `Activate Wallet`.

9. Select the customer access ZIP file from the phone.

10. Create the customer passcode when prompted. This encrypts the imported customer secret locally.

11. Confirm the wallet public key and balance appear.

After this first activation, closing and reopening the app should restore the wallet activation automatically.

## Send Talkware Points

The Send flow is intentionally limited to the configured Talkware Points asset from `loyalty-system-config.local.json`.

1. Open `Wallet`.
2. Tap `Send`.
3. Scan a recipient QR that contains only the recipient Stellar public key, such as `G...`.
4. Wait for recipient validation. The app checks that the account exists and has a trustline for the configured asset code and issuer.
5. Enter the amount.
6. Review recipient, amount, asset, and network.
7. Unlock with the customer passcode if the wallet is locked.
8. Confirm the send.

The app signs the payment transaction locally with the decrypted customer secret held only in memory, submits the signed envelope to the configured Horizon/NowNodes endpoint, refreshes balance after success, and saves a local success or failure history record. The local history does not contain the secret or recovery phrase.

## Current Runtime Boundary

For this milestone, wallet runtime is:

```txt
Local loyalty-system config
+ user-selected customer access ZIP
+ passcode-encrypted local customer secret storage
+ direct NowNodes/Horizon balance read and payment submission
= activated mobile wallet with QR-based Talkware Points Send
```

The app does not call:

```txt
/api/v1/wallet/credentials
```

The app also does not use backend signing, backend credential fetches, asset selection, XLM transfer, marketplace transfer, or a full Horizon history explorer in this milestone.

## Verification

Before sharing the branch, run:

```powershell
C:\src\flutter\bin\flutter.bat analyze
C:\src\flutter\bin\flutter.bat test
```

Also confirm Git sees the local config as ignored:

```powershell
git status --short --ignored assets\config
```

Expected local config status:

```txt
!! assets/config/loyalty-system-config.local.json
```
