et httpd port 2812 and
use address 0.0.0.0                              # only accept connection from localhost (drop if you use M/Monit)
    allow 0.0.0.0/0.0.0.0        # allow localhost to connect to the server and
    allow admin:monit      # require user 'admin' with password 'monit'


set log /var/log/monit.log
check process nginx with pidfile /var/run/nginx.pid
    start program = "/etc/init.d/nginx start"
    stop program = "/etc/init.d/nginx stop"
    if failed host 127.0.0.1 port 80 protocol http then restart
    if 7 restarts within 7 cycles then timeout

Include /etc/monit/conf-available/*.cfg