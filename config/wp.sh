#!/bin/bash

# done just once
if ! $(wp core is-installed --allow-root); then

	# install wordpress
	wp core install --url='{placeholder}.localhost' --title='{placeholder}' --admin_user=admin --admin_password=admin --admin_email='admin@{placeholder}.localhost' --skip-email --allow-root

	# clean up
	wp rewrite structure '/%postname%/' --hard --allow-root

fi

if ! $(wp plugin is-installed 'https://github.com/Kubitomakita/mailhog-wp-smtp/archive/master.zip'  --allow-root); then

	# dependencies
	wp plugin install 'https://github.com/Kubitomakita/mailhog-wp-smtp/archive/master.zip'  --activate --allow-root

fi
