#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SNIPPET_PREFIX="KoCMoHaBTa-XcodeSnippets"

#make sure the directory exists
mkdir -p ~/Library/Developer/Xcode/UserData/CodeSnippets

#delete existing snippets from this source
rm ~/Library/Developer/Xcode/UserData/CodeSnippets/$SNIPPET_PREFIX*

#link all snippets
for file in $SCRIPT_DIR/CodeSnippets/*
do
basename=$(basename "$file")
extension="${basename##*.}"
filename="${basename%.*}"
link="${SNIPPET_PREFIX}_${filename}.${extension}"
ln -s $file ~/Library/Developer/Xcode/UserData/CodeSnippets/$link
done

echo "Snippets are linked to ~/Library/Developer/Xcode/UserData/CodeSnippets"
