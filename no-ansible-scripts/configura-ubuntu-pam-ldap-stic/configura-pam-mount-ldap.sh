
#!/bin/bash --login


apt-get install -y libpam-ldap auth-client-config ldap-auth-client ldap-auth-config libnss-ldap ldap-utils nscd libpam-script
cifs-utils nfs-common
chown root.root /etc/sssd/sssd.conf
chmod go-r  /etc/sssd/sssd.conf

service sssd restart



cd /soft/configura-ubuntu-pam-ldap-stic
apt-get install -y sssd ldap-utils
cd files
rsync -av . /
chmod 0600 /etc/sssd/sssd.conf

