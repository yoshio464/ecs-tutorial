#!/bin/sh
seeders=();
if [ ${#seeders[@]} -gt 0 ]; then
  # 拡張子がphpのファイルのPathが自動的に追記される
  composer dump-autoload
  for seeder_class in ${seeders[@]}; do
   php artisan db:seed --class=$seeder_class
  done
fi
