server {
    listen 443 ssl http2; #IPv4
    listen [::]:443 ssl http2 ipv6only=on; #IPv6
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    server_name t-short.com.br www.t-short.com.br;

    root /var/www/t-short.com.br/html/;
    index index.html;

    access_log /var/www/t-short.com.br/logs/nginx_access.log;
    error_log /var/www/t-short.com.br/logs/nginx_erroe.log;

    location / {
      if (-f /etc/nginx/maintenance/$server_name) {
        return 503;
        }
      }

    error_page 404 /404.html;
    location /404.html {
         root /var/www/t-short.com.br/status-pages/;
        internal;
        }


     error_page 503 /503.html;
     location /503.html {
        root /var/www/t-short.com.br/status-pages/;
        internal;
        }
}