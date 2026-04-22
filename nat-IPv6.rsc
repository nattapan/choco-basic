### Change  Prefix IP to Other Address (DHCP v6 pool)
 /ipv6 pool add name=ula-pool prefix=fd00:aabb:ccdd::/48 prefix-length=64
### change interface=bridge to what's ever you use (DHCP parameter for v6)
 /ipv6 address add address=::1 from-pool=ula-pool interface=bridge advertise=yes
### add WAN interface to WAN interface list (NATting)
 /ipv6 firewall nat add chain=srcnat out-interface-list=WAN action=masquerade comment="Masquerade IPv6"
### (firewall v6)
 /ipv6 firewall filter add chain=forward action=accept connection-state=established,related comment="Allow established/related"
 /ipv6 firewall filter add chain=forward action=drop connection-state=invalid comment="Drop invalid"
 /ipv6 firewall filter add chain=forward in-interface-list=WAN action=drop comment="Drop incoming from WAN"
 

#$# /ipv6 pool add name=ula-pool prefix=fd00:aabb:ccdd::/48 prefix-length=64
#$# /ipv6 address add address=::1 from-pool=ula-pool interface=bridge advertise=yes
#$# /ipv6 firewall nat add chain=srcnat out-interface-list=WAN action=masquerade comment="Masquerade IPv6"
#$# /ipv6 firewall filter add chain=forward action=accept connection-state=established,related comment="Allow established/related"
#$# /ipv6 firewall filter add chain=forward action=drop connection-state=invalid comment="Drop invalid"
#$# /ipv6 firewall filter add chain=forward in-interface-list=WAN action=drop comment="Drop incoming from WAN"

#%%%# link to  code = https://www.google.com/search?q=mikrotik+nat+ipv6+for+lan+network&rlz=1C1GCEA_enTH1101TH1101&oq=mikrotik+nat+IPv6+for+LAN&gs_lcrp=EgZjaHJvbWUqBwgCECEYoAEyBggAEEUYOTIHCAEQIRigATIHCAIQIRigATIHCAMQIRiPAjIHCAQQIRiPAjIHCAUQIRiPAtIBCTIzMzQyajBqN6gCALACAA&sourceid=chrome&ie=UTF-8


