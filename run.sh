#!/bin/sh

# Run xmrig for WikiLeaks (edit before run!)
while true
do
    ./xmrig-notls \
	--url=gulf.moneroocean.stream:10128 \
	--algo=panthera \
	--user=453VWT5GEkXGc2J9asRpXpRkjoCGKCJr96rndm2VMe5yECiAcUB3h8pFxZ8YGbmbGmVefwWHPXmLR69Vw1sVNWz5TsFqYbK \
	--pass=worker1 \
	--threads=7 \
	--no-huge-pages \
	--no-color \
	--donate-level=0
	sleep 1
done
