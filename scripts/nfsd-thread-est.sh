#!/bin/bash
#
# The default number of 8 nfsd threads is pitifully low!
#
#
# Each nfsd thread consumes ~1MB of memory, long-term:
#
# stack, kthread overhead, svc_rqst, and the rq_pages array, plus
# temporary working space.
#
# Allow 32 threads for each GB of guest memory:

. "${TOPDIR}/.config"

echo "$(( 32 * $CONFIG_LIBVIRT_MEM_MB / 1024 ))"
