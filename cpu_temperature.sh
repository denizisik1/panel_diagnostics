#!/bin/bash

cpu_temperature() {
    sensors | awk '/^Package id 0:/ {print $4}' | sed 's/+//g'
}

cpu_temperature
