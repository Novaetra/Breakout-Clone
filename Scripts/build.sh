#! /bin/sh

# echo "Attempting to build $PROJECT_NAME for Windows (32-bit)"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes \
#   -logFile $(pwd)/unity.log \
#   -projectPath $(pwd) \
#   -buildWindowsPlayer "$(pwd)/Build/windows/$PROJECT_NAME-x86.exe" \
#   -quit

echo "Attempting to build $PROJECT_NAME for Windows (64-bit)"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -buildWindowsPlayer64 "$(pwd)/Build/windows/$PROJECT_NAME-x86_64.exe" \
  -quit

echo "Attempting to build $PROJECT_NAME for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -buildOSXUniversalPlayer "$(pwd)/Build/osx/$PROJECT_NAME.app" \
  -quit

echo "Attempting to build $PROJECT_NAME for Linux"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -buildLinuxUniversalPlayer "$(pwd)/Build/linux/$PROJECT_NAME.exe" \
  -quit

echo 'Logs from build'
cat $(pwd)/unity.log