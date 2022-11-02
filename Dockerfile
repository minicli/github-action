FROM minicli/php81

# Install Composer and set up application
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir /application && chown -R php /application
COPY . /application/
RUN cd /application && composer install

ENTRYPOINT [ "php", "/application/minicli" ]
CMD ["help"]
