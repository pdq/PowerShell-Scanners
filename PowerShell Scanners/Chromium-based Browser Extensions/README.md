# Instructions
[How to use this repository](../../README.md)

# Description
Returns a list of installed extensions for all Chromium-based browsers listed below by reading the Secure Preferences JSON file of each user, and all of their browser profiles.

- Brave
- Chromium
- Google Chrome
- Microsoft Edge
- Opera
- Vivaldi

If you would like a browser to be added to this list, please [open an issue](https://github.com/pdq/PowerShell-Scanners/issues/new).

The core logic of this scanner is based on [this script by Jerry Lord](https://help.pdq.com/hc/en-us/community/posts/360050592031-chrome-extension-inventory)

# Parameters
## Browsers
An array of the browsers you would like to scan for. If this parameter is not specified, all browsers will be scanned.

Example:

`-Browsers 'Google Chrome', 'Microsoft Edge'`

## EnablePermissions
Enables the Permissions field. This field is disabled by default because it's a multi-line string that is quite ugly in Inventory.

## Verbose
Adds additional information to the Output Log.

# Authors
* Colby Bouma
* Jerry Lord