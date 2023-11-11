server {
  listen 80;
  listen [::]:80;

  server_name t-short.com.br www.t-short.com.br;
  root /var/www/t-short.com.br/html;
  index index.html index.htm index.nginx-debian.html;

  access_log /var/www/t-short.com.br/logs/nginx_access.log;
  error_log /var/www/t-short.com.br/logs/nginx_error.log;

  location / {
    try_files $uri $uri/ @maintenance;
  }

  location @maintenance {
    if (-f /etc/nginx/maintenance/$host) {
      return 503;
    }
    root /var/www/t-short.com.br/status-pages/;
    rewrite ^(.*)$ /503.html break;
  }

  error_page 404 /404.html;
  location = /404.html {
    root /var/www/t-short.com.br/status-pages/;
    internal;
  }

  error_page 503 /503.html;
  location = /503.html {
    root /var/www/t-short.com.br/status-pages/;
    internal;
  }
}
