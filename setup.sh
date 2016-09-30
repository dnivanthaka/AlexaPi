#! /bin/bash
# Modified for Raspberry Pi Zero running Raspbian Jessie Lite

apt-get update
apt-get install python-pip libasound2-dev memcached mpg123 python-alsaaudio -y
#easy_install pip
pip install -r requirements.txt
cp initd_alexa.sh /etc/init.d/AlexaPi
update-rc.d AlexaPi defaults
touch /var/log/alexa.log

echo "Enter your Device Type ID :"
read productid
echo ProductID = \"$productid\" >> creds.py

echo "Enter your Security Profile Description:"
read spd
echo Security_Profile_Description = \"$spd\" >> creds.py

echo "Enter your Security Profile ID:"
read spid
echo Security_Profile_ID = \"$spid\" >> creds.py

echo "Enter your Security Client ID:"
read cid
echo Client_ID = \"$cid\" >> creds.py

echo "Enter your Security Client Secret:"
read secret
echo Client_Secret = \"$secret\" >> creds.py
echo refresh_token = "" >> creds.py

ip=`hostname -I`
python ./auth_web.py 
echo "Open http://$ip:5000"

echo "You can now reboot"

