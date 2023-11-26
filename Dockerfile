# Use the base PHP image with Apache
FROM php:7-apache
CMD ["apache2-foreground"]

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends git

# Set up a non-root user for development
RUN useradd -m vscode \
    && groupadd docker \
    && usermod -aG docker vscode

# Copy the contents of the app folder into the container
COPY ./ /var/www/html/

# Define the entrypoint
CMD ["apache2-foreground"]
