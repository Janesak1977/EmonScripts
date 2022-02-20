# --------------------------------------------------------------------------------
# EmonCMS Debian 11 Build Script


#!/bin/bash
source load_config.sh
    
echo "-------------------------------------------------------------"
echo "EmonCMS Debian 11 Install"
echo "-------------------------------------------------------------"


if [ "$apt_get_upgrade_and_clean" = true ]; then
    echo "apt-get update"
    sudo apt-get update -y
    echo "-------------------------------------------------------------"
    echo "apt-get upgrade"
    sudo apt-get upgrade -y
    echo "-------------------------------------------------------------"
    echo "apt-get dist-upgrade"
    sudo apt-get dist-upgrade -y
    echo "-------------------------------------------------------------"
    echo "apt-get clean"
    sudo apt-get clean
fi

echo "-------------------------------------------------------------"
sudo apt-get install -y git build-essential python3-pip python3-dev
echo "-------------------------------------------------------------"

if [ "$install_apache" = true ]; then $openenergymonitor_dir/EmonScripts/install/apache.sh; fi
if [ "$install_mysql" = true ]; then $openenergymonitor_dir/EmonScripts/install/mysql.sh; fi
if [ "$install_php" = true ]; then $openenergymonitor_dir/EmonScripts/install/php.sh; fi
if [ "$install_redis" = true ]; then $openenergymonitor_dir/EmonScripts/install/redis.sh; fi
if [ "$install_mosquitto" = true ]; then $openenergymonitor_dir/EmonScripts/install/mosquitto.sh; fi
if [ "$install_emoncms_core" = true ]; then $openenergymonitor_dir/EmonScripts/install/emoncms_core.sh; fi
if [ "$install_emoncms_modules" = true ]; then $openenergymonitor_dir/EmonScripts/install/emoncms_modules.sh; fi

# optional
#$openenergymonitor_dir/EmonScripts/install/non_emonsd.sh;

exit 0
# Reboot to complete
sudo reboot

