server {
  listen 80;
  listen [::]:80;

  server_name sorveteria-klesio.com.br www.sorveteria-klesio.com.br;
  return 301 https://sorveteria-klesio.com.br$request_uri;
}

server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2 ipv6only=on;
  include snippets/self-signed.conf;
  include snippets/ssl-params.conf;
  
  server_name sorveteria-klesio.com.br www.sorveteria-klesio.com.br;
  root /var/www/sorveteria-klesio.com.br/html;
  index index.html index.php;

  access_log /var/www/sorveteria-klesio.com.br/logs/nginx_access.log;
  error_log /var/www/sorveteria-klesio.com.br/logs/nginx_error.log;

  location / {
    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/.htpasswd;

    if (-f /etc/nginx/maintenance/$server_name) {
      return 503;
    }
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

  error_page 404 /404.html;
  location /404.html {
    root /var/www/sorveteria-klesio.com.br/status-pages/;
    internal;
  }

  error_page 503 /503.html;
  location /503.html {
    root /var/www/sorveteria-klesio.com.br/status-pages/;
    internal;
  }
}