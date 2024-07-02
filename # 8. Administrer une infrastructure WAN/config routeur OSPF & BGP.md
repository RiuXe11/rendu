# Rendu config routeur OSPF & BGP 
---

## Config routeur OSPF
```
interface FastEthernet0/0
 ip address 192.168.12.1 255.255.255.0
 ip ospf 100 area 0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
!
interface GigabitEthernet0/0/0
 ip address 192.168.16.1 255.255.255.0
 ip ospf 100 area 0
!
interface GigabitEthernet0/1/0
 no ip address
!
interface GigabitEthernet0/2/0
 ip address 192.168.14.1 255.255.255.0
 ip ospf 100 area 0
!
interface GigabitEthernet0/3/0
 no ip address
 shutdown
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 100
 log-adjacency-changes
 network 192.168.12.0 0.0.0.255 area 0
 network 192.168.14.0 0.0.0.255 area 0
 network 192.168.16.0 0.0.0.255 area 0
!
ip classless
```

## Config routeur BGP 
```
R11(config)#router bgp 100
R11(config-router)#neighbor 192.168.41.2 remote-as 200
R11(config-router)#network 192.168.11.0
R11(config-router)#network 192.168.14.0
R11(config-router)#network 192.168.15.0
```

