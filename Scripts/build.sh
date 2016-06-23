#! /bin/sh

# echo "Attempting to build $PROJECT_NAME for Windows (32-bit)"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes \
#   -logFile $TRAVIS_BUILD_DIR/unity.log \
#   -projectPath $TRAVIS_BUILD_DIR \
#   -buildWindowsPlayer "$TRAVIS_BUILD_DIR/Build/windows/$PROJECT_NAME-x86.exe" \
#   -quit

echo "Attempting to build $PROJECT_NAME for Windows (64-bit)"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $TRAVIS_BUILD_DIR/unity.log \
  -projectPath $TRAVIS_BUILD_DIR \
  -buildWindowsPlayer64 "$TRAVIS_BUILD_DIR/Build/windows/$PROJECT_NAME-x86_64.exe" \
  -quit

echo "Attempting to build $PROJECT_NAME for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $TRAVIS_BUILD_DIR/unity.log \
  -projectPath $TRAVIS_BUILD_DIR \
  -buildOSXUniversalPlayer "$TRAVIS_BUILD_DIR/Build/osx/$PROJECT_NAME.app" \
  -quit

echo "Attempting to build $PROJECT_NAME for Linux"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $TRAVIS_BUILD_DIR/unity.log \
  -projectPath $TRAVIS_BUILD_DIR \
  -buildLinuxUniversalPlayer "$TRAVIS_BUILD_DIR/Build/linux/$PROJECT_NAME" \
  -quit

echo 'Logs from build'
cat $TRAVIS_BUILD_DIR/unity.log
