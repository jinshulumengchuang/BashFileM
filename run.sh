#!/bin/bash
busybox httpd -p 9866
chromium --app=http://127.0.0.1:9866 || firefox http://127.0.0.1:9866
