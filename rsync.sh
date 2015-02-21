xattr -rc _site
chmod -R 755 _site
rsync -auv --delete --exclude _h5ai/cache/ -e ssh _site/ udplmail@192.168.244.30:/var/www/beta_udpl
