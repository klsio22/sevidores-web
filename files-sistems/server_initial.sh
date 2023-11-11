server {
  listen 80;
  root /var/www/t-short/html;

  index index.html;

  server_name t-short.com.br www.t-short.com.br;

  location / {
    try_files $uri $uri/ =404;
  }
}