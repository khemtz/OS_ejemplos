#!/usr/bin/bash
date
posfijo=`date +'%Y%m%d_%H%M%S'`
HOME="/home/usuario/git/OS_ejemplos"
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

echo "****************************************************"


MEM=`free | awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | tail -2 | head -1`

TOTAL=`echo ${MEM} | cut -d';' -f2`
USED=`echo ${MEM} | cut -d';' -f3`
FREE=`echo ${MEM} | cut -d';' -f4`
BUFF=`echo ${MEM} | cut -d';' -f6`

FREEPCT=$(((${FREE}/${TOTAL})*100))

echo ${FREEPCT}
#esc + d + G //borra de donde estoy al final del archivo
