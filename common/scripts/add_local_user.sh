# User local auth
# Set the below vars in ARG within the Dockerfile
# LOCAL_AUTH_USER=""
# LOCAL_AUTH_USER_PWHASH=""

if [[ ! -z $LOCAL_AUTH_USER  ]]; then
    useradd ${LOCAL_AUTH_USER} -u 10001 -g 0 -d /home/${LOCAL_AUTH_USER} -G wheel --password "${LOCAL_AUTH_USER_PWHASH}"
#    useradd ${LOCAL_AUTH_USER} -u 10001 -g 0 -G wheel --create-home --password "${LOCAL_AUTH_USER_PWHASH}"
    mkdir -p /home/${LOCAL_AUTH_USER} && \
    chown -R ${LOCAL_AUTH_USER}:0 

    yum install -y sudo
fi