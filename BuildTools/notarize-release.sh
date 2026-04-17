#!/usr/bin/env bash
#
# notarize-release.sh — one-command Developer-ID-signed + notarized + stapled
# Mac Catalyst build of Amperfy, ready for upload as a GitHub release asset.
#
# Prerequisites:
#   - Developer ID Application cert in the login keychain
#   - notarytool keychain profile named "AC_PASSWORD" (created via
#     `xcrun notarytool store-credentials AC_PASSWORD ...`)
#
# Usage:
#   ./BuildTools/notarize-release.sh v2.1.1-hisgarden.3
#
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <version-tag>" >&2
    echo "Example: $0 v2.1.1-hisgarden.3" >&2
    exit 1
fi

VERSION="$1"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ARCHIVE_PATH="/tmp/Amperfy-notarize.xcarchive"
EXPORT_PATH="/tmp/Amperfy-export"
EXPORT_OPTIONS="$REPO_ROOT/BuildTools/ExportOptions.plist"
SUBMIT_ZIP="/tmp/Amperfy-submit.zip"
OUTPUT_ZIP="/tmp/Amperfy-${VERSION}.zip"
KEYCHAIN_PROFILE="AC_PASSWORD"
SIGN_IDENTITY="Developer ID Application: Jin Wen (NSDC3EDS2G)"
TEAM_ID="NSDC3EDS2G"

echo "==> Cleaning previous run"
rm -rf "$ARCHIVE_PATH" "$EXPORT_PATH" "$SUBMIT_ZIP" "$OUTPUT_ZIP"

cd "$REPO_ROOT"

echo "==> Archiving with Developer ID signing"
xcodebuild \
    -project Amperfy.xcodeproj \
    -scheme Amperfy \
    -configuration Release \
    -destination 'generic/platform=macOS,variant=Mac Catalyst' \
    -archivePath "$ARCHIVE_PATH" \
    CODE_SIGN_IDENTITY="$SIGN_IDENTITY" \
    DEVELOPMENT_TEAM="$TEAM_ID" \
    CODE_SIGN_STYLE=Manual \
    archive \
    | tail -20

echo "==> Exporting (developer-id method)"
xcodebuild \
    -exportArchive \
    -archivePath "$ARCHIVE_PATH" \
    -exportPath "$EXPORT_PATH" \
    -exportOptionsPlist "$EXPORT_OPTIONS" \
    | tail -20

APP_PATH="$EXPORT_PATH/Amperfy.app"
if [[ ! -d "$APP_PATH" ]]; then
    echo "!! Expected $APP_PATH not found after export" >&2
    exit 1
fi

echo "==> Zipping .app for Apple submission"
ditto -c -k --keepParent "$APP_PATH" "$SUBMIT_ZIP"

echo "==> Submitting to notarization (blocks until Apple responds, typically 1-5 min)"
if ! xcrun notarytool submit "$SUBMIT_ZIP" \
        --keychain-profile "$KEYCHAIN_PROFILE" \
        --wait; then
    echo "!! Notarization failed." >&2
    echo "   Fetch the log with:" >&2
    echo "   xcrun notarytool history --keychain-profile $KEYCHAIN_PROFILE" >&2
    echo "   xcrun notarytool log <submission-id> --keychain-profile $KEYCHAIN_PROFILE" >&2
    exit 1
fi

echo "==> Stapling notarization ticket"
xcrun stapler staple "$APP_PATH"

echo "==> Verifying staple"
xcrun stapler validate "$APP_PATH"

echo "==> Re-zipping stapled .app for release upload"
ditto -c -k --keepParent "$APP_PATH" "$OUTPUT_ZIP"

echo
echo "==> Done. Release asset ready:"
echo "    $OUTPUT_ZIP"
shasum -a 256 "$OUTPUT_ZIP"
ls -lh "$OUTPUT_ZIP"

################################################################################
# Changelog:
# 2026-04-17  Initial notarization script for hisgarden fork releases
################################################################################
