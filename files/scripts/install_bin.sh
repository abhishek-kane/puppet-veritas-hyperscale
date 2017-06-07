#!/bin/bash
/usr/bin/expect << EOF
set timeout -1

spawn "$1"

expect "OpenStack Controller's Management IP:"
send "$2\n"
sleep 5

expect "OpenStack Administrator Password:"
send "$3\n"
sleep 5

expect "MySQL Root Password:"
send "$4\n"
sleep 5

expect "*"
send "q"

expect " :"
send "y\n"

expect " :"
send "n\n"

expect eof
EOF

exit 0
