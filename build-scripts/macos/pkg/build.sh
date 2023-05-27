#!/bin/bash
# Build .pkg file for universal .app target
# This script will first sign the app with "Apple Distribution" certificate,
# and then pack it to a .pkg file with "3rd Party Mac Developer Installer"
# shellcheck source=../../common/set-env.sh
. "$(realpath "$0/../../../common/set-env.sh")"
function ensureExists () {
  if [ ! -e "$1" ]; then
    echo "Error: ""$1"" does not exists. Make sure you have already craeted or built."
    if [[ -z "$2" ]]; then
      echo "  $2"
    fi
    exit 1
  fi
}
function ensureEnv () {
  arg=$1
  if [[ -z "${!arg}" ]]; then
    echo "Error: Env $arg not set."
    if [[ -z "$2" ]]; then
      echo "  Set it before run your build arg"
    else
      echo "  This env variable is expected to be $2"
    fi
    echo "You can add a file named .env in root directory, and add your environment variables in it."
    exit 1
  else
    echo "Env: $arg set"
  fi
}
# Running a command until success(exit with code 0)
function infiniteRetry () {
  until "$@"
  do
    echo "Retry"
    sleep 1
  done
}

ensureEnv "APP" "your app name"
ensureEnv "VERSION" "x.x.x"
# Maybe enable other targets in the future
ensureEnv "PLATFORM" "\"mas\""
# ARCH="arm64"
ARCH=x64

APP_PATH="out/$APP-$PLATFORM-$ARCH/$APP.app"
# if [ ! -e "$APP_PATH" ]; then
#   echo "$APP_PATH"
#   echo "Cannot find build app. Running build script..."
#   infiniteRetry build-scripts/macos/app/build.sh
# else
#   echo "Found app build."
# fi
ensureExists "$APP_PATH"
# if [ ! -e "$APP_PATH/Contents/_CodeSignature" ]; then
#   echo "Build app is not signed. Running sign script..."
#   . build-scripts/macos/pkg/sign.sh
# else
#   echo "Found app signed."
# fi
RESULT_PATH="out/installers/$VERSION/""$APP""_""$PLATFORM""_$VERSION.pkg"

# ensureEnv "APPLE_DISTRIBUTION_KEY" "\"Apple Distribution: Company Name (XXXXXXXXXX)\""
ensureEnv "APPLE_INSTALLER_KEY" "\"Developer ID Installer: (XXXXXXXXXX)\""

# ensureExists "$APP_PATH/Contents/_CodeSignature" "Signing app before packaging. This require installing @electron/osx-sign."
# sleep 1
# exit 0
# DEBUG=* yarn electron-osx-sign --identity="$APPLE_DISTRIBUTION_KEY" $APP_PATH

echo "$RESULT_PATH" "$APP" "$PLATFORM"
mkdir -p "$(dirname "$RESULT_PATH")"
echo "productbuild --component" "$APP_PATH" "/Applications" "$RESULT_PATH"
productbuild --component "$APP_PATH" /Applications "$RESULT_PATH"
echo "Created signed pkg $RESULT_PATH"
