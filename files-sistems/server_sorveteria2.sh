server {
  listen 80;
  listen [::]:80;

  server_name  sorveteria.com.br www.sorveteria.com.br;
  root /var/www/sorveteria.com.br/html;
  index index.html index.htm index.nginx-debian.html;

  access_log /var/www/sorveteria.com.br/logs/nginx_access.log;
  error_log /var/www/sorveteria.com.br/logs/nginx_error.log;

  error_page 404 /404.html;
  location = /404.html {
      root /var/www/sorveteria.com.br/status-pages/;
      internal;
  }
}