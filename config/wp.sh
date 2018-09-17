#!/bin/bash

# done just once
if ! $(wp core is-installed --allow-root); then

	# install wordpress
	wp core install --url='{placeholder}.localhost' --title='{placeholder}' --admin_user=admin --admin_password=admin --admin_email='admin@{placeholder}.localhost' --skip-email --allow-root

	# clean up
	wp rewrite structure '/%postname%/' --hard --allow-root
	wp plugin uninstall hello --deactivate --allow-root
	wp plugin uninstall akismet --deactivate --allow-root

fi

if [ ! -d /var/www/html/wp-content/plugins/mailhog-wp-smtp/ ]; then

	# dependencies
	wp plugin install 'https://github.com/Kubitomakita/mailhog-wp-smtp/archive/master.zip'  --activate --allow-root

fi
