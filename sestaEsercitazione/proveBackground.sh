#! /bin/sh
case $# in
2) echo Numero di parametri corretti: passato $1 e $2;;
*) echo Numero di parametri non corretto perche\' $#
   exit 1;;
esac

NTIMES=$1	#numero di volte che invocheremo lo specifico programma
PROG=$2		#programma specifico

count=0		#count per il ciclo

while test $count -ne $NTIMES
do
	$PROG > log_$count &  #N.B. mandando in esecuzione in background possiamo provare anche le soluzioni dell'esercizio 3 senza che al primo caso di deadlock si debba usare il ^C e quindi abortire l'esecuzione del programma e quindi anche dello script
       #in questo caso per questioni legate alla bufferizzazione dello standard output ad opera della printf si deve usare per la scrittura su standard output la write su 1!	
       #per tale ragione si sono prodotte anche le versioni delle due soluzioni dell'esercizio 3 che fanno uso delle write su 1!
	count=`expr $count + 1`
done
