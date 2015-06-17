server {
  listen 80;
  server_name project.pro www.project.pro;
  root /vagrant/web;

  error_log /var/log/nginx/project.pro.error.log;
  access_log /var/log/nginx/project.pro.access.log;

  index index.php;

  location / {
    index app.php;
    fastcgi_param COUNTRY_CODE de;
    try_files $uri $uri/ /app.php?$query_string;
  }

  location ~ ^/(app|app_dev)\.php(/|$) {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass unix:/var/run/php5-fpm.sock;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
  }
}