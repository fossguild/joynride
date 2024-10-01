#!/usr/bin/env python3

# SPDX-FileCopyrightText: 2024 The JoynRide Authors
#
# SPDX-License-Identifier: GPL-3.0-or-later

## Run this script to set up the development and build environment.
## The script will check for dependencies and initialize configuration files.

import subprocess

##
## Check for tools.
##

import sys
import shutil

def check_dev_tool(tool_name):
    # Look for the tool in the system's PATH
    print(f"checking for {tool_name}: {''.ljust(30 - len(tool_name) - 1)}", end='')
    if shutil.which(tool_name) is not None:
        print(f"yes")
        return True
    else:
        print(f"no   (developer tool)")
        return False

def check_tool(tool_name):
    # Look for the tool in the system's PATH
    print(f"checking for {tool_name}: {''.ljust(30 - len(tool_name) - 1)}", end='')
    if shutil.which(tool_name) is not None:
        print(f"yes")
    else:
        print(f"no   (required; please install.)")
        sys.exit(1)

def main():

    # Check for developer tools.
    
    check_dev_tool("reuse")

    # Check for build resources.
    
    check_tool("go")

if __name__ == "__main__":
    main()
