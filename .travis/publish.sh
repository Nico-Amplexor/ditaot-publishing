rm -rf output

echo "Download DITA-OT 3.6"
wget https://github.com/dita-ot/dita-ot/releases/download/3.6/dita-ot-3.6.zip
unzip dita-ot-3.6.zip
chmod +x dita-ot-3.6/bin/dita

echo "Generate WebHelp Responsive Output from " ${DITAMAP}

dita-ot-3.6/bin/dita -i $DITAMAP -f pdf2 -filter=$DITAVAL -o $OUT_DIR -t $TEMP_DIR