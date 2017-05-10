## Virtual machine with bridged network interface based on box from scotch.io

### Initialization

+ Copy this directory into working space
+ Download box and run machine with command:
```
vagrant up
```
+ Connect to box with command
```
vagrant ssh
```
+ create symbolic link from project directory to apache web server space
```
ln -s /vagrant_data/public /var/www/
```

