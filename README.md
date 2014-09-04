# Synapse Balancer

![Build status](https://badge.buildbox.io/401808b0dc726863b8bbb10210c148e5e691d7ae5e7716dadf.svg)

> Uses synapse to expose Docker web apps to ELBs

## Purpose

1. Allows a pinned port to be exposed to ELBs (they can only configured to look for back-end listener on specific ports, and they don't seem to be particularly resilient to changing conditions among their listeners).
1. Allows us to deploy new web app containers without dropping connections. Since the ELBs need pinned ports for their back-ends, you can't easily spin up a new container while the old one is still running. This balances connections between old and new during that period.
1. Translates public URLs to Immutant-friendly URLs via its synapse/haproxy config. For example, it will translate http://ballotscout.org/foo?bar=1 to http://[immutant-host]:8080/ballot-scout/foo?bar=1.

## Usage

1. `docker build -t quay.io/democracyworks/synapse-balancer .`
1. `docker run -d -p 60800:80 quay.io/democracyworks/synapse-balancer`
