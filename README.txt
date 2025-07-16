# Chamilo Docker Setup – Stable v1.11.18
 
## 1. Clone stable Chamilo version
 
git clone https://github.com/chamilo/chamilo-lms.git chamilo
cd chamilo
git checkout v1.11.18
 
## 2. Build and run Docker
 
docker compose build
docker compose up
 
## 3. Set permissions inside the container
docker compose exec web bash -c "  chown -R www-data:www-data /var/www/html/app /var/www/html/web /var/www/html/main/default_course_document/images &&   chmod -R 755 /var/www/html/app /var/www/html/web /var/www/html/main/default_course_document/images"
 
## 4. Open in browser
 
http://localhost:8080
 
## Notes
 
- Version 1.11.18 includes a working web installer at /main/install/index.php
- PHP memory_limit is increased to 512M
- Apache DocumentRoot is set to /var/www/html
