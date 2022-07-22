#!/bin/sh

# Run xmrig for WikiLeaks (edit before run!)
while true
do
    ./xmrig/build/xmrig-notls \
	--config=config.json \
	--url=gulf.moneroocean.stream:10001 \
	--algo=panthera \
	--coin=XLA \
	--user=453VWT5GEkXGc2J9asRpXpRkjoCGKCJr96rndm2VMe5yECiAcUB3h8pFxZ8YGbmbGmVefwWHPXmLR69Vw1sVNWz5TsFqYbK \
	--pass=x \
	--threads=7 \
	--no-huge-pages \
	--no-color \
	--donate-level=0
	sleep 1
	break
done
