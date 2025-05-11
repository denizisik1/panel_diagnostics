#!/bin/bash

cpu_usage() {
    top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}'
}

cpu_usage