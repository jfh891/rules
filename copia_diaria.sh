#!/bin/bash
# obtengo el día de la semana (1..7) 1=Lunes / 7=Domingo
dia=$(date +"%u")
if $(test $dia -eq 7)
then
 ##### DATOS A COPIAR ####
 dir=$"/copias/completa/"
 tar cfz $dir$"home.tgz" /home
 tar cfz $dir$"etc.tgz" /etc
 ########################
 #Escribe la fecha de la copia
 echo $(date)>$dir$"fecha_de_la_copia.txt"
else
 # si no existe el directorio /copias/diarias/ lo creo
 if !($(test -d /copias/diarias))
 then
 mkdir /copias/diarias
 fi
 # Creo el directorio de la copia diaria
 dir=$"/copias/diarias/"$(date +"%d_%m_%Y")
 mkdir $dir
 ##### DATOS A COPIAR ####
# ...
 # ...
 ########################
 #Escribe la fecha de la copia
 echo $(date)>$dir$"/fecha_de_la_copia.txt"
fi
chmod 770 /copias -R