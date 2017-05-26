## Synopsis

Minimal unattend.xml image capture framework supporting the following Windows Operating Systems:

- Windows 7
- Windows 8.1
- Windows 10
- Windows Server 2008 R2
- Windows Server 2012 R2
- Windows Server 2016
=======
Windows 7
Windows 8.1
Windows 10
Windows Server 2008 R2
Windows Server 2012 R2
Windows Server 2016

Verified using Enterprise version of client OS and Datacenter version of server OS in vCenter 5.5 using ESXi hosts 
5.5 U3 or greater.  The template files can be used to create custom local admin account or enable built-in admin 
account depending on your company standards.

Creating catalog files based on current windows install.wim files is recommend along with installing Windows ADK vs. 
manually editing the supplied XML files.

You can find attributes requiring customization by searching for "%" within the template XML files.

The XML files will adjust the following:
- Maintain installed devices
- Use built-in Administrator profile settings as default for any new user logging in
- Set Organization
- Set Owner
- Set TimeZone
- Create dynamic computer name during deployment
- Disable prompt to create local user during OOBE
- Set Windows activation to manual
- Enable IPv4 ping response firewall rule
- Enable Remote Desktop
- Enable Remote Desktop firewall rule
- Set power plan to High Performance
- Disable built-in administrator account (or not depending on which template is used)
- Configure administrator account(s)
- Silence OOBE prompts
- Set en-us as default locale

## Motivation

I needed to test Windows 10 VM templates and was not happy with the VMware customizations results - it took over 30
minutes for base OS deployment to stabilize and the start menu was FUBAR.  Fell back to supported MS image prep tactics and boiled 
everything down to a base level.  I began testing against previous Microsoft products and found that while a few unattend.xml settings 
may be deprecated for newer OS versions, everything came together as planned.

## Usage

1) Clone to local repository
2) Create folder under XML matching caption of OS you want to capture
3) Update relevant template XML file with your customizations and copy to /XML/targetOScaption/unattend.xml
4) Get reference system ready for capture
5) Copy WindowsImageCapture folder and contents to reference image
6) Run start.bat from elevated command prompt and choose "y" to seal image.

## License

BSD 2-Clause License

Copyright (c) 2017, https://infiniteloop.io
All rights reserved.

