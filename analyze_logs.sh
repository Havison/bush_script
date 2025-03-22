#!/bin/bash

TOTAL_REQUESTS=$(wc -l < access.log)
UNIQUE_IP=$(awk '{print $1}' access.log | sort -u | wc -l)
METHOD=$(awk '{print $6}' access.log | tr -d '"' | sort | uniq -c)
POPULAR_URL=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)

cat <<EOF > "report.txt"
Общее количество запросов: $TOTAL_REQUESTS
Количество уникальных IP адресов: $UNIQUE_IP
Количество запросов по методам: 
$METHOD
Самый популярный ULR: $POPULAR_URL 	
EOF
echo "Файл отчета создан"


