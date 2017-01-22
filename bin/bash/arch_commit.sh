#!/bin/sh

echo "\nCommitting...\n"

git add -A

git commit -m "$1"

git push

echo "\n"
