[Host Website on Raspberry Pi](https://fireship.io/lessons/host-website-raspberry-pi/)
[NGINX for Beginners](https://nginx.org/en/docs/beginners_guide.html)


## Install nginx
```bash
sudo apt update
sudo apt install nginx
sudo /etc/init.d/nginx start
```

### Get internal IP Address
```bash
hostname -I
```

## Set default page

### Look at current configuration
```bash
sudo nano /etc/nginx/sites-available/default
```

Should look something like this:
```nginx
server {
    listen 80;
    server_name _;

    root /usr/share/nginx/html;  # Web root directory
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

The web root directory for your NGINX server **in this case** is set to:
```bash
/var/www/html
```

### Transfer .html to index.html
```bash
sudo mv /path/to/your-file.html /var/www/html/index.html
```

### Set permissions
```bash
sudo chmod -R 755 /var/www/html
sudo chown -R www-data:www-data /var/www/html
```

### Reload nginx
```bash
sudo systemctl reload nginx
```


## Add www and non-www support

```bash
sudo vi /etc/nginx/sites-available/default
```

Update config file to have these server blocks at the end
```nginx
server {
    if ($host = sonnazgroup.com) {
		return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name sonnazgroup.com;
    return 404; # managed by Certbot

}

server {
	if ($host = www.sonnazgroup.com) {
		return 301 https://$host$request_uri;
	} # managed by Certbot
	

    listen 80;
    server_name www.sonnazgroup.com;
    return 404; # managed by Certbot

}
```

## php

Update to php
	- Add index.php to front
```bash
root /var/www/html;
index index.php index.html index.htm;
```

Update location to look for php files
```nginx
location / {
	try_files $uri $uri/ $uri.php$is_args$args;
}
```

Add php interperter
```nginx
location ~ \.php$ {
	try_files $uri =404;
	fastcgi_split_path_info ^(.+\.php)(/.+)$;
	fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;  # Adjust this path according to your PHP-FPM socket (8.3 is current during this update)
	fastcgi_index index.php;
	include fastcgi_params;
	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
}
```
- To get updated php version
	- ```php --version```
	- xx.xx only, don't need to third version decimal


## Add HTTPS compatability

Install packages
```bash
sudo apt install certbot python3-certbot-nginx
```

Run Certbot:
```
sudo certbot --nginx -d sonnazgroup.com -d www.sonnazgroup.com
```


## Add Pages

``` bash
sudo vi /etc/nginx/sites-available/default
```

```nginx
location /privacy {
	try_files $uri /privacy.php;
}
```
- /privacy : web extension you want to add 
	- EX: www.domain.com/privacy
- /privacy.php : Location and name of file you want to redirect to

## Misc. Commands

### Test connection
```bash
sudo nginx -t
```

### Reload
```bash
sudo systemctl reload nginx
```
