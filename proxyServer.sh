#!/bin/bash

part_a=$((SOCAT_PPID - 5))
# here i also used AI 
ps_output=$(ps)
sha512=$(echo "$ps_output" | sha512sum)
last_two_hex=${sha512:(-2)}
part_b=$(printf "%d" "0x$last_two_hex")  

sum=$((part_a + part_b))
result=$((sum % 2))

if [ $result -eq 1 ]; then
    curl -s "http://localhost:10000/index.html"
else
    curl -s "http://localhost:10000/error.html"
fi
