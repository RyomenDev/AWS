#!/bin/bash

# Update package index
sudo apt update -y

# Install MySQL Server
sudo apt install mysql-server -y

# Start MySQL Service
sudo systemctl start mysql

# Enable MySQL to start on boot
sudo systemctl enable mysql

# Secure MySQL Installation
echo "Running MySQL secure installation..."
sudo mysql_secure_installation

# Create a database and user
DB_NAME="qa_database"
DB_USER="qa_user"
DB_PASS="qa_password"

sudo mysql -u root -e "CREATE DATABASE $DB_NAME;"
sudo mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

echo "Database and user created successfully!"

# Update MySQL Configuration to allow remote access
CONFIG_FILE="/etc/mysql/mysql.conf.d/mysqld.cnf"
if [ -f "$CONFIG_FILE" ]; then
    sudo sed -i "s/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/" $CONFIG_FILE
    echo "Updated bind-address in MySQL configuration file."
else
    echo "Configuration file not found: $CONFIG_FILE"
    exit 1
fi

# Restart MySQL service
sudo systemctl restart mysql

echo "MySQL setup completed! You can now connect using:"
echo "mysql -h <Public_IPv4> -u $DB_USER -p $DB_NAME"


# sudo systemctl start mysql
 
# sudo systemctl enable mysql
 
# sudo mysql_secure_installation

 
# sudo mysql -u root -p

 
# CREATE DATABASE qa_database;

# CREATE USER 'qa_user'@'%' IDENTIFIED BY 'qa_password';

# GRANT ALL PRIVILEGES ON qa_database.* TO 'qa_user'@'%';

# FLUSH PRIVILEGES;

# EXIT;
 
# CREATE USER 'qa_user'@'%' IDENTIFIED BY 'qa_password';
 
# sudo nano /etc/my.cnf

 
# sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

 
# sudo systemctl restart mysql
 
# mysql -h <Public_IPv4> -u qa_user -p qa_database
