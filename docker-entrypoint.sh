#!/bin/bash

if [ ! -d "/var/www/html/vendor" ]; then
    echo "Chamilo: Composer dependencies not found, installing..."
    cd /var/www/html
    composer install || { echo 'Composer install failed'; exit 1; }
else
    echo "Chamilo: Dependencies already installed."
fi

exec apache2-foreground
