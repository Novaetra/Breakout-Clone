#! /bin/sh

# This link changes from time to time. I haven't found a reliable hosted installer package for doing regular
# installs like this. Grab a current link from: http://unity3d.com/get-unity/download/archive
downloadUrl="http://netstorage.unity3d.com/unity/960ebf59018a/MacEditorInstaller/Unity-5.3.5f1.pkg"

echo "Downloading from $downloadUrl: "
curl -o Unity.pkg $downloadUrl

echo "Installing Unity.pkg"
sudo installer -dumplog -package Unity.pkg -target /