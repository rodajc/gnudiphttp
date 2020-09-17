# gnudiphttp

This linux shell script implements the "The HTTP Based Protocol" part of the GnuDIP Client-Server Update Protocol.
Refer to: http://gnudip2.sourceforge.net/gnudip-www/latest/gnudip/html/protocol.html

First an update request is issued and then confirmed by sending the correct parameters, e.g.
the username and hashed password.

This script only needs a working wget.
If you decide to use it don't forget to adjust the base URL for your ddns provider and replace ********** with your username, password and domain name respectively.
