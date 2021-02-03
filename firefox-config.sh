#!/bin/bash

cat > /Applications/Firefox.app/Contents/Resources/defaults/pref/autoconfig.js << EOF
pref("general.config.filename", "firefox.cfg");
pref("general.config.obscure_value", 0);
EOF

cat > /Applications/Firefox.app/Contents/Resources/firefox.cfg << EOF
// IMPORTANT: File must start with a comment
pref("pref.browser.tabs.loadBookmarksInTabs",true);
EOF
