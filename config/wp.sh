#!/bin/bash

# done just once
if ! $(wp core is-installed); then

	# install wordpress
	wp core install --url='{placeholder}.localhost' --title='{placeholder}' --admin_user=admin --admin_password=admin --admin_email='admin@{placeholder}.localhost' --skip-email

	# clean up
	wp rewrite structure '/%postname%/' --hard
	wp plugin uninstall hello --deactivate
	wp plugin uninstall akismet --deactivate

fi

# dependencies
wp plugin install 'https://github.com/Kubitomakita/mailhog-wp-smtp/archive/master.zip' --activate
