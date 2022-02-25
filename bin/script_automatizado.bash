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

echo "****************************************************" >> ${FILEOUTPUT}


MEM=`free -b | awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | tail -2 | head -1`

TOTAL=`echo ${MEM} | cut -d';' -f2`
USED=`echo ${MEM} | cut -d';' -f3`
FREE=`echo ${MEM} | cut -d';' -f4`
BUFF=`echo ${MEM} | cut -d';' -f6`

PERC_FREE=`echo "scale=6; 100*(${FREE} / ${TOTAL})" | bc`

echo "${PERC_FREE}%" >> ${FILEOUTPUT}


if [ ${FREE} -le 500000000 ]
then
	echo "ERROR: tes estas quedando sin memoria, ${PERC_FREE}%" >> ${FILEOUTPUT}	
else
	echo "OK" >> ${FILEOUTPUT}
fi





