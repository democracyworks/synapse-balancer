# Immutant Balancer

> Exposes Immutant web apps to ELBs

## Purpose

1. Allows a pinned port to be exposed to ELBs (they can only configured to look for back-end listener on specific ports, and they don't seem to be particularly resilent to changing conditions among their listeners).
1. Allows us to deploy new immutant containers without dropping connections. Since the ELBs need pinned ports for their back-ends, you can't easily spin up a new container while the old one is still running. This balances connections between old and new during that period.
1. Translates public URLs to Immutant-friendly URLs via its synapse/haproxy config. For example, it will translate http://ballotscout.org/foo?bar=1 to http://[immutant-host]:8080/ballot-scout/foo?bar=1.

## Usage

TODO
