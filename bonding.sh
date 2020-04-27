#!/bin/bash

echo -n "New create Bonding Name :"
read bond
echo -n "IP Address :"
read IP
echo -n "NETMASK :"
read NETMASK
echo -n "Master interface :"
read etha
echo -n "Slave interface :"
read ethb

if [ -e /etc/sysconfig/network-scripts/ifcfg-bond${bond} ] ;
 then
   mkdir -p /etc/sysconfig/network-scripts/backup
   mv /etc/sysconfig/network-scripts/ifcfg-bond${bond} /etc/sysconfig/network-scripts/backup/
   echo -e "DEVICE=\"bond${bond}\"\nBOOTPROTO=\"none\"\nONBOOT=\"yes\"\nIPADDR=\"${IP}\"\nNETMASK=\"${NETMASK}\"" > /etc/sysconfig/network-scripts/ifcfg-bond${bond}
  echo -e "MASTER=\"bond${bond}\"\nSLAVE=\"yes\"\nUSERCTL=\"no\"" >> /etc/sysconfig/network-scripts/ifcfg-eth${etha}
  echo -e "MASTER=\"bond${bond}\"\nSLAVE=\"yes\"\nUSERCTL=\"no\"" >> /etc/sysconfig/network-scripts/ifcfg-eth${ethb}


 else
   echo -e "DEVICE=\"bond${bond}\"\nBOOTPROTO=\"none\"\nONBOOT=\"yes\"\nIPADDR=\"${IP}\"\nNETMASK=\"${NETMASK}\"" > /etc/sysconfig/network-scripts/ifcfg-bond${bond}
  echo -e "MASTER=\"bond${bond}\"\nSLAVE=\"yes\"\nUSERCTL=\"no\"" >> /etc/sysconfig/network-scripts/ifcfg-eth${etha}
  echo -e "MASTER=\"bond${bond}\"\nSLAVE=\"yes\"\nUSERCTL=\"no\"" >> /etc/sysconfig/network-scripts/ifcfg-eth${ethb}
 fi
