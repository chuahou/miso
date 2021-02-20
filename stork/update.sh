#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2021 Chua Hou
#
# Updates stork index.

set -euo pipefail

# Creates a line in the files list.
file_entry () {
	local file=$1
	local prefix=$2
	local title=$(sed -n 's/.*<title>\(.*\) | chuahou.dev<\/title>.*/\1/p' $1)
	local url=$(echo /${file#$prefix})
	echo "	{title = \"${title}\", url = \"${url}\", path = \"${file}\"},"
}

# Configuration file.
CONFIG_FILE=stork/config.toml # Configuration file
OUTPUT_FILE=stork/index.st    # Output file
SRC=docs/                     # Directory to index

# Get to base directory of project.
cd $(dirname $0)/..

# Start creating configuration file.
cat > $CONFIG_FILE <<EOF
[input]
base_directory = "."
files = [
EOF

# Create file entries.
for f in $(find $SRC -type f -name '*.html'); do
	file_entry $f $SRC >> $CONFIG_FILE
done

# End off configuration file.
cat >> $CONFIG_FILE <<EOF
]

[output]
filename = "${OUTPUT_FILE}"
EOF

# Update index.
stork --build $CONFIG_FILE
