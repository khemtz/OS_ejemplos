#!/usr/bin/bash
date
posfijo=`date +'%Y%m%d_%H%M%S'`
HOME="/home/usuario/scripts"
FILEOUTPUT=${HOME}/log/respaldo_${posfijo}.log

echo "HOLA MUNDO"
echo $FILEOUTPUT

#filtrado de eventos systemd en /var/log/syslog
echo "***********************************************************" >> ${FILEOUTPUT}
echo "************************INICIO*****************************" >> ${FILEOUTPUT}
echo "***********************************************************" >> ${FILEOUTPUT}
grep systemd /var/log/syslog >> ${FILEOUTPUT}
#busqueda de procesos de usuario systemd y message
echo "***********************************************************" >> ${FILEOUTPUT}
echo "procesos de systemd" >> ${FILEOUTPUT}
ps -ef | egrep 'message|^systemd' >> ${FILEOUTPUT}





