#!/bin/bash

# Sourced from https://github.com/devcontainers/template-starter/blob/504d9d484fb416a823d6fabb338c2e7f3bcf0b96/.github/actions/smoke-test/test.sh

# MIT License
#
# Copyright (c) 2022 Microsoft Corporation
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

TEMPLATE_ID="$1"
set -e

SRC_DIR="/tmp/${TEMPLATE_ID}"
echo "Running Smoke Test"

ID_LABEL="test-container=${TEMPLATE_ID}"
devcontainer exec --workspace-folder "${SRC_DIR}" --id-label ${ID_LABEL} /bin/sh -c 'set -e && if [ -f "test-project/test.sh" ]; then cd test-project && if [ "$(id -u)" = "0" ]; then chmod +x test.sh; else sudo chmod +x test.sh; fi && ./test.sh; else ls -a; fi'

# Clean up
docker rm -f $(docker container ls -f "label=${ID_LABEL}" -q)
rm -rf "${SRC_DIR}"
