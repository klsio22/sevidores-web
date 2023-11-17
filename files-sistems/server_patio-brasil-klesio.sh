server {
  listen 80;
  listen [::]:80;

  server_name patio-brasil-klesio.com.com www.patio-brasil-klesio.com.com;
  return 301 https://patio-brasil-klesio.com.com$request_uri;
}

server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2 ipv6only=on;
  
  server_name patio-brasil-klesio.com.com www.patio-brasil-klesio.com.com;
  root /var/www/patio-brasil-klesio.com.com/html;
  index index.html;

  access_log /var/www/patio-brasil-klesio.com.com/logs/nginx_access.log;
  error_log /var/www/patio-brasil-klesio.com.com/logs/nginx_error.log;

  location / {
    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/.htpasswd;

    if (-f /etc/nginx/maintenance/$server_name) {
      return 503;
    }
  }

  location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
  }

  location ~ \.ht {
    deny all;
  }

  error_page 404 /404.html;
  location /404.html {
    root /var/www/patio-brasil-klesio.com.com/status-pages/;
    internal;
  }

  error_page 503 /503.html;
  location /503.html {
    root /var/www/patio-brasil-klesio.com.com/status-pages/;
    internal;
  }
}