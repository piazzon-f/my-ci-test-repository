FROM php:latest

# # set default workdir
WORKDIR /usr/src

# # Add package.json to allow for caching
COPY composer.json /usr/src/composer.json

# # Install app dependencies
RUN composer install

# # Bundle app source and tests
COPY src /usr/src/src
COPY tests /usr/src/tests

# # user to non-privileged user
USER nobody

# # Expose the application port and run application
EXPOSE 5000
CMD ["node","app.js"]
