# Visualizzazione dei processi attivi e ram

Var1=`hostname`
Var2=`date +%d%m%y`
Var=`grep MemTotal /proc/meminfo`
Cat=`echo ${Var} | cut -d' ' -f 2`                                             # Taglia il Valore in cifre della ram
KB="1000000"
Conv=`echo $(( Cat / KB ))`                                                    # Conversione da KB a GB




# Copio processi attivi in un file di testo
ps aux > File2.txt                                                             # Copio processi attivi in un file di testo


if [ ${Conv} > 2 ]                                                             # Se la ram è maggiore di 2 GB
then
  echo "Memoria ram: ${Conv} GB" > File1.txt                                   # Scrivi il seguente testo in un file2.txt

else                                                                           # invece se è minore di 2 GB
  echo "Memoria Ram minore di 2 Gb, Memoria Ram: ${Conv} GB" > File1.txt       # Scrivi il seguente testo in un file1.txt
fi

cat File1.txt File2.txt > ${Var1}_${Var2}.txt                                  # Copia il contenuto dei 2 File in un nuovo File di testo
rm File1.txt File2.txt 2                                                       # Rimuove File creati


