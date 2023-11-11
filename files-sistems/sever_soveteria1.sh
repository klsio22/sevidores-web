server {
  listen 80;

  root /var/www/sorveteria.com.br/html;
  index index.html index.htm index.nginx-debian.html;

  server_name sorveteria.com.br www.sorveteria.com.br;

  location / {
    try_files $uri $uri/ =404;
  }
}
