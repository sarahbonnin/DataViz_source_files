cat <(echo "chr,strand,gencode_id,gene_type,gene_symbol") <(zcat gencode.v44.annotation.gtf.gz | awk '$3=="gene"' | cut -f1,7,9 | cut -d"\"" -f1,2,4,6 | sed 's/"/\t/g' | cut -f1,2,4- |sed 's/\t/,/g' | grep -P "protein_coding|lncRNA|miRNA|snRNA|snoRNA" | grep -P -v "chr2[0-2]+|chrX|chrY|chrM|chr1[1-9]+" | shuf | head -1000) > files/gencode.v44.annotation.csv 

