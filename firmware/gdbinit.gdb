set architecture arm
set mem inaccessible-by-default off
target extended-remote /dev/ttybmpgdb
# monitor tpwr enable
shell sleep 0.2
monitor swdp_scan
attach 1
