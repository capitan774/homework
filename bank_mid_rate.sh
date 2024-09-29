#!bin/bash
# 1. Download the curent rate.am file
wget https://www.rate.am/hy/armenian-dram-exchange-rates/banks  && echo "----------- File is Downloaded --------"
# 2. Bring to the correct HTML format
tidy -i -m banks && echo "--------- File is formated ----------"
# 3. filter average rate lines, and select USD
cat banks | grep -A 1 "text-center px-2.5 w-1/2" | tr ">" "\n" | tr -d " " | grep ^[0-9] | head -2 | tail -1
# filtering average rates | translating ">" symbols to newline | removing all spaces | filtering only digit lines | getting 2nd line
# 4. deleting tmp files
rm banks
