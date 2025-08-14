#!/usr/bin/env bash
# Calculate Simple Interest = (P * R * T) / 100
# Usage: ./simple-interest.sh PRINCIPAL RATE TIME_YEARS

set -e

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 PRINCIPAL RATE_PERCENT TIME_YEARS" >&2
  exit 1
fi

P="$1"
R="$2"
T="$3"

# basic numeric check
numre='^-?[0-9]+([.][0-9]+)?$'
for v in "$P" "$R" "$T"; do
  if ! [[ $v =~ $numre ]]; then
    echo "Error: all args must be numbers. Got: $P $R $T" >&2
    exit 2
  fi
done

SI=$(awk -v p="$P" -v r="$R" -v t="$T" 'BEGIN{ printf "%.2f", (p*r*t)/100 }')
echo "Simple Interest on P=$P, R=$R%, T=$T years = $SI"
