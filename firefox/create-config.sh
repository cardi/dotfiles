#!/bin/bash

export APP_DIR="/Applications"
export VERSION="Firefox Developer Edition.app"

export FIREFOX_DIR="${APP_DIR}/${VERSION}/Contents/Resources"

# policies.json
# <https://github.com/mozilla/policy-templates/blob/master/README.md>
#   use the enterprise policy settings to disable some things
mkdir -p "${FIREFOX_DIR}/distribution"
cat <<-EOF > "${FIREFOX_DIR}/distribution/policies.json"
{
  "policies": {
    "DisableFeedbackCommands": true,
    "DisableFirefoxScreenshots": true,
    "DisableFirefoxAccounts": true,
    "DisableFirefoxStudies": true,
    "DisablePocket": true,
    "DisableSetDesktopBackground": true,
    "DisableTelemetry": true,
    "FirefoxHome": {
      "Search": true,
      "TopSites": false,
      "Highlights": false,
      "Pocket": false,
      "Snippets": false,
      "Locked": false
    },
    "NetworkPrediction": false,
    "OfferToSaveLoginsDefault": false,
    "OverrideFirstRunPage": "",
    "PasswordManagerEnabled": false,
    "SearchSuggestEnabled": false,
    "Permissions": {
      "Location": {
        "BlockNewRequests": true,
        "Locked": false
      },
      "Notifications": {
        "BlockNewRequests": true,
        "Locked": false
      }
    }
  }
}
EOF

# autoconfig.js
# <https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig>
#   create required autoconfig.js so we can load our preferences from
#   firefox.cfg
cat <<-EOF > "${FIREFOX_DIR}/defaults/pref/autoconfig.js"
pref("general.config.filename", "firefox.cfg");
pref("general.config.obscure_value", 0);
EOF

# firefox.cfg

cat <<-EOF > "${FIREFOX_DIR}/firefox.cfg"
// IMPORTANT: Start your code on the 2nd line
// disable config warning
pref("browser.aboutConfig.showWarning", false);
pref("general.warnOnAboutConfig", false);
// disable thumbnails in tab switcher
pref("browser.ctrlTab.recentlyUsedOrder", false);
pref("browser.uidensity", 1);
pref("layout.spellcheckDefault", 0);
pref("signon.rememberSignons", false);
pref("signon.usage.hasEntry", false);
pref("network.dns.disablePrefetch", true);
pref("network.predictor.enabled", false);
pref("network.prefetch-next", false);
// disable autofill
pref("dom.forms.autocomplete.formautofill", false);
pref("extensions.formautofill.addresses.enabled", false);
pref("extensions.formautofill.addresses.usage.hasEntry", false);
pref("extensions.formautofill.creditCards.enabled", false);
EOF
