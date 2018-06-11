# Generic Login: This example is to show of how to use login functionality with secured stroing using Keychain Services on iOS.
 ##Application contains login box and after entering credential the user ID will get stored in userdefault and password in Keychain.

 ##This sample demonstrates how to use the Keychain Services API to store, update and delete generic password keychain items.

Login challenge,

1. When you store user ID and password in user default. Where storing password in User Dafault is not a secured.
2. When you store user ID and password in Keychanin, you won't be able to refresh or delete data from keychain. Because
you won't be able to get callback of app is uninstalled.

Solution:
1. Store User ID in user default (Application memory)
2. Store password in iOS device keychain.


## Requirements

### Build

Xcode 8.0, iOS 9.0 SDK or later

### Runtime

iOS 9.0 or later





