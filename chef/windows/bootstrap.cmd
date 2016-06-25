net start w32time
w32tm /config /manualpeerlist:"g1w9294.asiapacific.hpqcorp.net g4w9915.asiapacific.hpqcorp.net g2w6863.asiapacific.hpqcorp.net g2w6865.asiapacific.hpqcorp.net g1w9297.asiapacific.hpqcorp.net g9w8040.asiapacific.hpqcorp.net g9w9040.asiapacific.hpqcorp.net"
w32tm /resync
netsh advfirewall firewall set rule group="remote administration" new enable=yes & netsh advfirewall firewall add rule name="WinRM Port" dir=in action=allow protocol=TCP remoteip=<IP_ADDR> localport=5985
echo 16.147.35.221 hpjfin214.jp.tslabs.hpecorp.net >> C:\Windows\system32\drivers\etc\hosts
