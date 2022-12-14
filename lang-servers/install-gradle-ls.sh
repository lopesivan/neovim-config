#!/bin/sh

INSTALL_FOLDER="$NVIM_BEGINNER/share/nvim"

# Set this if necessary
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"

# Install Gradle language server
rm -rf "$INSTALL_FOLDER/vscode-gradle"
git clone https://github.com/microsoft/vscode-gradle.git "$INSTALL_FOLDER/vscode-gradle"
cd "$INSTALL_FOLDER/vscode-gradle" && ./gradlew installDist
