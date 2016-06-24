#! /bin/sh

# This link changes from time to time. I haven't found a reliable hosted installer package for doing regular
# installs like this. Grab a current link from: http://unity3d.com/get-unity/download/archive
downloadUrl="http://netstorage.unity3d.com/unity/960ebf59018a/MacEditorInstaller/Unity-5.3.5f1.pkg"
file="$HOME/UnityEditor/Unity.pkg"

DownloadUnity () { 
    echo "Downloading from $downloadUrl: "
    curl -o $file $downloadUrl
	InstallUnity
}

InstallUnity () {
    echo "Installing $file"
    sudo installer -dumplog -package $file -target /
}

[ -f $file ] && InstallUnity || DownloadUnity
