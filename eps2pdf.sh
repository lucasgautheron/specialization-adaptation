#!/bin/sh

for f in *.eps
do
   epstopdf "$f"
   echo "$(basename "$f" "-eps-converted-to").pdf"
done

