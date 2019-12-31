# About This Computer
About This Computer is a small utility for quickly and easily displaying useful information about a computer.
About This Computer lives in the system tray as a "gold star" icon. When clicked, it shows details such as computer name, IP address, uptime, etc.

## History
About This Computer was created to address one of the most common IT helpdesk scenarios: helping a call-in user provide the IP address of their computer. Over time, About This Computer has expanded to become a convenient location for displaying lots of details about a computer.

## Prerequisites
About This Computer aims to hide/show details depending on what features an organization has implemented. In these early releases, a number of features that don't make sense for all organizations can't yet be hidden.
The following assumptions are made about the enterprise environment:
* Application is used by a business or other organized entity.
* Organization has a corporate intranet.
* Organization uses mapped personal drives; mapped via AD object setting.
* Organization uses login scripts; configured via AD object setting.
* Organization has an IT helpdesk.
* Organization has a password self-service portal.
* Organization uses employee ID numbers.
* Organization tracks computer hardware using asset tags.
* Organization writes asset tags to BIOS.
* Workstation is joined to an Active Directory domain.
* Operating System is common desktop or server version of Windows used in enterprises.
* IT helpdesk has a regional phone number
* IT helpdesk has a corporate phone number
* IT helpdesk has a regional email address
* IT helpdesk has a website
* IT helpdesk has a website for remote control sessions
* SCCM Application Catalog is utilized.
* CrowdStrike is installed and service is running.
* BeyondTrust PowerInsight is installed and service is running.
* Splunk Forwarder is installed and service is running.
* SCCM Client is installed and service is running.
* Windows Update service is running.