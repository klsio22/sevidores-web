server {
  listen 80;
  listen [::]:80;
  root /var/www/patio-brasil.com.br/html;
  index index.html;

  server_name patio-brasil.com.br www.patio-brasil.com.br;

  location / {
    try_files $uri $uri/ =404;
  }
}