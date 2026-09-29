Connecting a Mellanox ConnectX-3 to a MikroTik 40G switch (like the popular CRS326-24S+2Q+RM) over a DAC cable is one of the most common places where homelab links get trapped at 10G speeds. [1, 2] 
This happens because the MikroTik switch and the Mellanox card argue over link auto-negotiation and Forward Error Correction (FEC). Since they can't agree on how to bond the four 10G lanes into a single 40G link, the hardware defaults to using a single lane—capping your connection at exactly 10G. [1, 3, 4] 
You can bypass this issue and force 40G over your existing DAC by making two specific configuration changes:
## Step 1: Turn off Auto-Negotiation in MikroTik RouterOS / SwOS
By default, MikroTik attempts to scan the DAC EEPROM to figure out the optimal speed. You need to manually override this on the switch. [3, 5, 6] 

   1. Open your MikroTik WinBox interface or WebFig.
   2. Go to Interfaces and open the configuration for your qsfp28-x (or qsfp+) port.
   3. Go to the General or Ethernet tab.
   4. Uncheck "Auto Negotiation".
   5. Manually set the speed to 40Gbps and ensure Duplex is set to full. [3, 5] 

## Step 2: Match the FEC (Forward Error Correction) Mode
If the link still fails to go up or stays at 10G after disabling auto-negotiation, it is almost always an FEC mismatch. [3] 

* 
* In the same MikroTik port menu, look for the FEC Mode setting.
* Toggle it to fec91 or try turning FEC completely off (disabled or none). The configuration on the MikroTik side must match how the ConnectX-3 is configured in your OS (e.g., via ethtool in Linux or Device Manager in Windows). [3, 5] 
* 

## Step 3: Check Your Card's Firmware Profile
Many used ConnectX-3 cards from eBay are flashed with a custom OEM sub-variant (like an HP or IBM specific profile) that forces the card into InfiniBand-only mode or restricts the Ethernet link rates. [4, 5] 

* 
* If your card's part number ends in -QCBT, it is artificially speed-restricted to 10G in Ethernet mode.
* To unlock true 40G Ethernet, homelabbers use the Mellanox Firmware Tools (MFT) to cross-flash the card to the standard -FCBT firmware profile, which natively opens up 40G and 56G Ethernet modes. [4] 
* 

To fix this quickly, tell me:

* 
* What operating system is your ConnectX-3 PC running? (Windows, Proxmox, TrueNAS, Linux?)
* Are you using RouterOS or SwOS on the MikroTik?
* 

I can give you the exact command lines or menu locations to force the 40G override!

[1] [https://forum.mikrotik.com](https://forum.mikrotik.com/t/qsfp-40-gbe-dac-only-works-if-i-force-it-to-10-gbps/142401)
[2] [https://mikrotik.com](https://mikrotik.com/product/crs326_24s_2q_rm)
[3] [https://forum.mikrotik.com](https://forum.mikrotik.com/t/cant-get-mellanox-connectx-4-cx455a-to-work-at-100gbps-on-crs504-4xq-in/166709)
[4] [https://forums.servethehome.com](https://forums.servethehome.com/index.php?threads/solved-mellanox-connectx-3-cant-get-40g-only-10g.22543/)
[5] [https://forums.developer.nvidia.com](https://forums.developer.nvidia.com/t/connectx-3-pro-connecting-at-10g-instead-of-40g/207412)
[6] [https://www.reddit.com](https://www.reddit.com/r/homelab/comments/gduqed/mellanox_mikrotik_sfp_dac_cable_compatibility/)
