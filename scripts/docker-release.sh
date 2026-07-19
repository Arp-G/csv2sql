#!/usr/bin/env bash
# Build Burrito release binaries inside a Linux container.
#
#   scripts/docker-release.sh                 # all four targets
#   scripts/docker-release.sh macos_arm       # just one
#
# Binaries land in burrito_out/ on the host. Deps and build artifacts
# live in the csv2sql_release_build volume (never mixed with the host's
# _build/deps); drop it with:  docker volume rm csv2sql_release_build
set -euo pipefail
cd "$(dirname "$0")/.."

targets=("$@")
[ ${#targets[@]} -eq 0 ] && targets=(macos_arm macos_intel linux windows)

docker build -t csv2sql-release -f Dockerfile.release .

for target in "${targets[@]}"; do
  echo "==> Building ${target}"
  docker run --rm \
    -v "$PWD":/src \
    -v csv2sql_release_build:/build \
    -e BURRITO_TARGET="${target}" \
    csv2sql-release \
    bash -ec "mix deps.get --only prod &&
              mix assets.setup &&
              mix compile &&
              mix assets.deploy &&
              mix release csv2sql --overwrite"
done

echo "==> Done:"
ls -lh burrito_out/
