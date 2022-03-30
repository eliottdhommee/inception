#! /bin/sh

while ! mariadb -h$WORDPRESS_DB_HOST -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME &>/dev/null; do
	sleep 3
done

if [ -f /var/www/html/wordpress/wp-config.php ]; then
	echo "[i] wordpress directory already present, skipping creation"
else
	echo "[i] wordpress data directory not found, downloading wp"
	mkdir /var/www/html/wordpress
	cd /var/www/html/wordpress
	wp core download --allow-root
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
fi

exec /usr/sbin/php-fpm7 -F
