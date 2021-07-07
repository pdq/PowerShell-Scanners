# Instructions
[How to use this repository](../../README.md)

# Description
Grabs neighbor cache entries, commonly called the ARP cache in IPV4, and attempts to get a reverse DNS lookup and NetBIOS name for each.

# Parameters
## SkipNbtName
Skip attempting to get the NetBIOS name of each neighbor cache entry by using `nbtstat -A <ipaddress>`

## SkipReverseLookup
Skip doing reverse DNS lookup on the IP Address of each neighbor cache entry.

# Authors
* Andrew Pla