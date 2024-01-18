# Utiliser une image PHP avec Composer préinstallé
FROM composer:latest as build

WORKDIR /app

COPY . /app

# Installer les dépendances
RUN composer install

# Construire l'application
RUN php artisan key:generate
RUN php artisan config:cache
RUN php artisan route:cache

# Utiliser une image Nginx
FROM nginx:latest

# Copier les fichiers de configuration de Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Copier l'application Laravel construite depuis l'image Composer
COPY --from=build /app /var/www/html

WORKDIR /var/www/html

# Exposer le port 80
EXPOSE 80

# Commande pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]



# # Utilisez une image PHP avec Apache
# FROM php:8.1-apache

# # Activer le module Apache mod_rewrite
# RUN a2enmod rewrite

# # Copier le contenu de l'application Laravel dans le conteneur
# COPY . /var/www/html

# # Définir le répertoire de travail
# WORKDIR /var/www/html

# # Installer les dépendances PHP nécessaires
# RUN docker-php-ext-install pdo pdo_mysql

# # Exposer le port 80 pour le serveur web Apache
# EXPOSE 80

# # Commande par défaut pour démarrer Apache
# CMD ["apache2-foreground"]