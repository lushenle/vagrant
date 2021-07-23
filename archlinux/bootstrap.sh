#!/bin/bash

echo "[TASK 1] Create shenlel user account"
useradd -m -c "Venkat Nagappan" shenlel
echo -e "admin\nadmin" | passwd shenlel >/dev/null 2>&1

