#!/bin/sh

set -euo

TAG=$(git describe --tags --abbrev=0 | awk 'BEGIN {FS = "\."}; {printf "%s\n", $2}')
echo NEW_TAG="v1.$(expr $TAG + 1).0"

# git tag -a $NEW_TAG -m $NEW_TAG
# git push origin $NEW_TAG
