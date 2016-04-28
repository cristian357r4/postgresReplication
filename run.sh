#!/bin/bash
vagrant up
vagrant ssh m1 -c "cd;./afterM1.sh"
vagrant ssh m2 -c "cd;./afterM2.sh"
