#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2021 Chua Hou
#
# Runs both the Hakyll build server and livereload servers.

cabal run . -- watch --no-server &
livereload docs/
