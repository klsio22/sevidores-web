server {
  listen 80;
  listen [::]:80;
  server_name sorveteria-klesio.com.br www.sorveteria-klesio.com.br;
  root /var/www/sorveteria-klesio.com.br/html;
  index index.html index.php;

  access_log /var/www/sorveteria-klesio.com.br/logs/nginx_access.log;
  error_log /var/www/sorveteria-klesio.com.br/logs/nginx_error.log;

  # Maintenance mode
  location / {
    if (-f /etc/nginx/maintenance/$server_name) {
      return 503;
    }

    try_files $uri $uri/ =404;
  }

  # Handle PHP requests
  location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php8.1-fpm.sock;
  }

  # Hide .ht files
  location ~ /\.ht {
    deny all;
  }

  # Error pages
  error_page 404 /status-pages/404.html;
  error_page 503 /status-pages/503.html;

  location = /status-pages/404.html {
    root /var/www/sorveteria-klesio.com.br;
    internal;
  }

  location = /status-pages/503.html {
    root /var/www/sorveteria-klesio.com.br;
    internal;
  }
}
