docker build -t image-ftps ftps_image/ --no-cache;
docker build -t image-grafana grafana_image/  --no-cache;
docker build -t image-influxdb influxdb_image/  --no-cache;
docker build -t image-mysql mysql_image/  --no-cache;
docker build -t image-nginx nginx_image/  --no-cache;
docker build -t image-phpmyadmin phpmyadmin_image/  --no-cache;
docker build -t image-wordpress wordpress_image/ --no-cache;
