#!/usr/bin/env bash
# Called by make publish-reset-history after a successful clean build.
# Replaces gh-pages history.
set -euo pipefail

project_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
site_dir="$project_dir/_site"

if [[ ! -f "$site_dir/index.html" || -e "$site_dir/.git" ]]; then
  echo "Expected a rendered site in _site. Run make publish-reset-history." >&2
  exit 1
fi

remote_url=$(git -C "$project_dir" remote get-url --push origin)
author_name=$(git -C "$project_dir" config user.name)
author_email=$(git -C "$project_dir" config user.email)
remote_head=$(git ls-remote --exit-code "$remote_url" refs/heads/gh-pages)
expected_sha=${remote_head%%[[:space:]]*}
if [[ ! "$expected_sha" =~ ^[[:xdigit:]]{40,64}$ ]]; then
  echo "Could not determine the current gh-pages commit; refusing to push." >&2
  exit 1
fi

publish_dir=$(mktemp -d "${TMPDIR:-/tmp}/blog-publish-reset.XXXXXXXX")
trap 'rm -rf -- "$publish_dir"' EXIT

cp -R -- "$site_dir/." "$publish_dir/"
touch "$publish_dir/.nojekyll"
git -C "$publish_dir" init --quiet --initial-branch=gh-pages
git -C "$publish_dir" add --all
git -C "$publish_dir" -c user.name="$author_name" -c user.email="$author_email" \
  commit --quiet -m "Publish clean site with fresh gh-pages history"

# Only replace the branch if nobody has updated it since ls-remote above.
# The source checkout, its branches, and its uncommitted edits are untouched.
git -C "$publish_dir" push \
  "--force-with-lease=refs/heads/gh-pages:$expected_sha" \
  "$remote_url" HEAD:refs/heads/gh-pages

echo "Published a fresh gh-pages history. GitHub Pages deployment may take a few minutes."
