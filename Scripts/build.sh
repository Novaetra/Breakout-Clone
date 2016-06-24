#! /bin/sh

# echo "Attempting to build $PROJECT_NAME for Windows (32-bit)"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes \
#   -logFile $UNITY_BUILD_DIR/unity.log \
#   -projectPath $UNITY_BUILD_DIR \
#   -buildWindowsPlayer "$UNITY_BUILD_DIR/windows/$PROJECT_NAME-x86.exe" \
#   -quit

UNITY_BUILD_DIR=$TRAVIS_BUILD_DIR/Build

mkdir -p $UNITY_BUILD_DIR

echo "Attempting to build $PROJECT_NAME for Windows (64-bit)"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $UNITY_BUILD_DIR/unity.log \
  -projectPath $TRAVIS_BUILD_DIR \
  -buildWindowsPlayer64 "$UNITY_BUILD_DIR/windows/$PROJECT_NAME-x86_64.exe" \
  -quit

echo "Attempting to build $PROJECT_NAME for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $UNITY_BUILD_DIR/unity.log \
  -projectPath $TRAVIS_BUILD_DIR \
  -buildOSXUniversalPlayer "$UNITY_BUILD_DIR/osx/$PROJECT_NAME.app" \
  -quit

# echo "Attempting to build $PROJECT_NAME for Linux"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes \
#   -logFile $UNITY_BUILD_DIR/unity.log \
#   -projectPath $TRAVIS_BUILD_DIR \
#   -buildLinuxUniversalPlayer "$UNITY_BUILD_DIR/linux/$PROJECT_NAME" \
#   -quit

echo 'Logs from build'
cat $UNITY_BUILD_DIR/unity.log
