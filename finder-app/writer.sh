#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Error: Two parameters required"
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

writedir=$(dirname "$writefile")

if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $writedir"
        exit 1
    fi
fi

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi