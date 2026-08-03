FROM httpd:latest

# Change Apache port from 80 to 8080
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Update VirtualHost port
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8080>/g' /usr/local/apache2/conf/extra/httpd-vhosts.conf

# Copy custom web page
COPY index.html /usr/local/apache2/htdocs/index.html

EXPOSE 8080

CMD ["httpd-foreground"]
