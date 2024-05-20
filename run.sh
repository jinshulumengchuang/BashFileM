#!/bin/bash
busybox httpd -p 9866
chromium http://127.0.0.1:9866 || firefox http://127.0.0.1:9866 || firefox-esr  http://127.0.0.1:9866
