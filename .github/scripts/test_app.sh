#!/bin/bash

set -eo pipefail

xcodebuild \
  -project emott.xcodeproj \
  -scheme emott \
  -destination platform=iOS\ Simulator,name=iPhone\ 11 \
  clean test | xcpretty
