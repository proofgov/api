#!/bin/bash

which jq > /dev/null
if [[ $? != 0 ]]; then
  echo "WARNING: jq is not on your \$PATH and is a requirement these firewall helpers."
  exit 1
fi

proof_curl () {
  url=$1
  shift
  curl \
    -g \
    -H "Authorization: Bearer $PROOF_API_TOKEN" \
    2>/dev/null \
    "$PROOF_API_HOST$url" "$@"
  # -g is for "globoff"; [] are glob characters, apparently.
  # how curl uses globbing is unclear to me ...
}

echo 'Unit ID,Unit Name,Unit Acronym,Sharepoint Library Name,Created At,Updated At'
proof_curl '/api/units' | jq -r '.data[] | [.id, .name, .acronym, .sharepointLibraryName, .createdAt, .updatedAt] | @csv'
