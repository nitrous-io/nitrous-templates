## Nginx

This container comes with Nginx 1.6

This Nginx server is configured with one virtual server listening on 3000, files placed in
`~/code/public_html` will be served up by this virtual server. You can
access this site by visiting Preview > Port 3000.

If you wish to customise the behaviour of this virtual server you can modify its configuration
located at `/etc/nginx/sites-available/default` (you will need to be `root`).
