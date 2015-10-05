#!/bin/bash

cat << EOF > /etc/phpldapadmin/config.php
<?php
\$config->custom->appearance['friendly_attrs'] = array(
	'facsimileTelephoneNumber' => 'Fax',
	'gid'                      => 'Group',
	'mail'                     => 'Email',
	'telephoneNumber'          => 'Telephone',
	'uid'                      => 'User Name',
	'userPassword'             => 'Password'
);

\$servers = new Datastore();
\$servers->newServer('ldap_pla');
\$servers->setValue('server','name','My LDAP Server');
\$servers->setValue('server','host','${LDAP_HOST:-localhost}');
\$servers->setValue('server','port',${LDAP_PORT:-389});
\$servers->setValue('server','tls',${LDAP_TLS:-false});
\$servers->setValue('server','base',array('${BASE_DN}'));
\$servers->setValue('login','bind_id','${BIND_DN}');
\$servers->setValue('login','bind_pass','${BIND_PW}');
\$servers->setValue('login','auth_type','session');
EOF

$*
