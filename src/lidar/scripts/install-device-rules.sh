#!/bin/sh
cd
cd ../../etc/udev/rules.d/

cat > rplidar.rules << EOF
KERNEL=="ttyUSB*", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE:="0777", SYMLINK+="rplidar"
EOF
