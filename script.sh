#!/bin/bash
echo hello
cd folder2
mkdir folder{10..12}
cd folder10
touch file{7..9}.txt file{10,11}.json
mkdir folder{13..15}
ls .
mv file{7,9}.txt ../folder11
