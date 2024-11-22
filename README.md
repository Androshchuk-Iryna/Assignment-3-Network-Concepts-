# Assignment-3-Network-Concepts-


##Overview

This project implements a proxy server that listens on port 80 and forwards incoming requests to an Apache2 web server operating on port 10000. The proxy server is designed to dynamically determine whether to serve index.html or error.html based on calculated system metrics.

## Components

- `index.html` and `error.html`: Success and failure pages
- `proxyServer.sh`: Proxy script that determines which page to display
- `proxyServer.service`: Systemd service configuration
- `configureSystem.sh`: Installation script
- `ai_usage.txt`: Text file

  
##Features
Custom Port Configuration: Apache2 configured to listen on port 10000.
Access Restriction: Use of iptables to restrict access to port 10000 to the local machine.
Systemd Service: A custom service (proxyServer.service) ensures the proxy server runs on boot and handles requests on port 80.
Dynamic HTML Content: Two pages (index.html and error.html) provide feedback based on proxy calculations.

## Setup instruction 

1. Clone the repository
2. Run the configuration script:
```bash
chmod +x configureSystem.sh
./configureSystem.sh  
curl localhost:portNum 
```
