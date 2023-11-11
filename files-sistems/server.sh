server {
  listen 80;
  listen [::]:80;

  server_name t-short.com.br www.t-short.com.br;
  root /var/www/t-short.com.br/html;
  index index.html index.htm index.nginx-debian.html;

  access_log /var/www/t-short.com.br/logs/nginx_access.log;
  error_log /var/www/t-short.com.br/logs/nginx_error.log;

  error_page 404 /404.html;
  location = /404.html {
      root /var/www/t-short.com.br/status-pages/;
      internal;
  }
}
