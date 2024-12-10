#!/bin/bash

date --help
status=$?

if [ $status -eq 0 ]
then
    echo "date is installed"
else
    echo "sudo apt install date"
fi

wget --help
status=$?

if [ $status -eq 0 ]
then
    echo "wget is installed"
else
    echo "sudo apt install wget"
fi

unzip --help
status=$?

if [ $status -eq 0 ]
then
    echo "unzip is installed"
else
    echo "sudo apt install unzip"
fi

tar --help
status=$?

if [ $status -eq 0 ]
then
    echo "tar is installed"
else
    echo "sudo apt install tar"
fi
