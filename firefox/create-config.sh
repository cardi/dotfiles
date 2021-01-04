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
#
# Some more controls: <https://gist.github.com/0XDE57/fbd302cef7693e62c769>
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
// disable pocket?
pref("extensions.pocket.enabled", false);
pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
pref("extensions.pocket.site", "");
pref("extensions.pocket.oAuthConsumerKey", "");
pref("extensions.pocket.api", "");
// disable firefox sync
pref("identity.fxaccounts.enabled", false);
// disable activity stream
pref("browser.library.activity-stream.enabled", false);
// disable browser default check
pref("browser.shell.checkDefaultBrowser", false);
// disable search suggestions
pref("browser.urlbar.update1.interventions", false);
pref("browser.search.suggest.enabled", false);

// disable "Recommend Features as you Browse" / Extensions
pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
pref("extensions.htmlaboutaddons.recommendations.enabled", false);

pref("geo.enabled", false);
pref("geo.wifi.uri", "");
pref("browser.search.geoip.url", "");

pref("plugins.enumerable_names", "");

// disable captive portal
pref("network.captive-portal-service.enabled", false);

// disable safe browsing
pref("browser.safebrowsing.enabled", false);
pref("browser.safebrowsing.phishing.enabled", false);
pref("browser.safebrowsing.malware.enabled", false);
pref("browser.safebrowsing.downloads.enabled", false);

// disable web push notifications
pref("dom.webnotifications.enabled", false);
pref("dom.webnotifications.serviceworker.enabled", false);
pref("dom.push.connection.enabled", false);
pref("dom.push.enabled", false);

// disable telemetry
pref("devtools.onboarding.telemetry.logged", false);
pref("toolkit.telemetry.updatePing.enabled", false);
pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
pref("browser.newtabpage.activity-stream.telemetry", false);
pref("browser.ping-centre.telemetry", false);
pref("toolkit.telemetry.bhrPing.enabled", false);
pref("toolkit.telemetry.enabled", false);
pref("toolkit.telemetry.firstShutdownPing.enabled", false);
pref("toolkit.telemetry.hybridContent.enabled", false);
pref("toolkit.telemetry.newProfilePing.enabled", false);
pref("toolkit.telemetry.reportingpolicy.firstRun", false);
pref("toolkit.telemetry.shutdownPingSender.enabled", false);
pref("toolkit.telemetry.unified", false);
pref("toolkit.telemetry.updatePing.enabled", false);
pref("toolkit.telemetry.reportingpolicy.firstRun", false);
pref("toolkit.telemetry.unified", false);
pref("toolkit.telemetry.archive.enabled", false);
pref("devtools.onboarding.telemetry.logged", false);
pref("toolkit.telemetry.bhrPing.enabled", false);
pref("datareporting.healthreport.uploadEnabled", false);
pref("datareporting.policy.dataSubmissionEnabled", false);
pref("datareporting.sessions.current.clean", true);
pref("datareporting.healthreport.uploadEnabled", false);
pref("datareporting.policy.dataSubmissionEnabled", false);
pref("datareporting.sessions.current.clean", true);

// disable firefox studies
pref("app.shield.optoutstudies.enabled", false);
EOF
