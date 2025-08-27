#!/bin/bash

echo "You are currently in: " && pwd
mkdir -p notes && echo "You created a directory called notes"
echo "hello" > notes/first.txt && echo "You created first.txt in the notes directory with 'hello' written in the file"
echo "Here is the contents of first.txt: " && cat notes/first.txt
cp notes/first.txt notes/copy.txt
echo "first.txt has been copied to copy.txt"
mv notes/copy.txt notes/renamed.txt
echo "copy.txt has been renamed renamed.txt"
