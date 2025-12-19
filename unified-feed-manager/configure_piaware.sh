#!/bin/bash
sudo piaware-config receiver-type other
sudo piaware-config receiver-host 127.0.0.1
sudo piaware-config receiver-port 30005
sudo systemctl restart piaware
