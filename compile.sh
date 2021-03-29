#!/bin/sh

# Create directories
mkdir -p bin lib

# Download ice lib
if [ ! -f lib/ice-3.7.2.jar ]
then
    wget https://search.maven.org/remotecontent?filepath=com/zeroc/ice/3.7.2/ice-3.7.2.jar -P lib
fi

# Generate slice2java interfaces
$(cd src/slice2java && slice2java Printer.ice)

# Compile slice2java interfaces
javac src/slice2java/Demo/*.java -cp lib/ice-3.7.2.jar -d bin

# Compile Server and Client
javac src/*.java -cp lib/ice-3.7.2.jar:bin -d bin
