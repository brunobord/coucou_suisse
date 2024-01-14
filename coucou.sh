#!/usr/bin/env bash

# Coucou Suisse: v1.0.0

hours=$(date +%l)
coucou=$(yes "coucou" | head -n $hours | tr '\n' ' ')

curl https://$MASTODON_HOST/api/v1/statuses -H "Authorization: Bearer $ACCESS_TOKEN" -F "status=$coucou"
