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

import re
import shutil
import subprocess
import sys

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

def check_reuse():
    if check_dev_tool("reuse"):
        version = subprocess.run(["reuse", "--version"],
                                 stdout=subprocess.PIPE,
                                 stderr=subprocess.PIPE,
                                 text = True).stdout
        print(f"Cheking for version number to be 4.*.*:\t\t", end='')
        if re.search(r"4\.\d+\.\d+", version) is not None:
            print("yes")
        else:
            print("no")

def main():

    # Check for developer tools.
    check_reuse();

    # Check for build resources.

    check_tool("go")

if __name__ == "__main__":
    main()
