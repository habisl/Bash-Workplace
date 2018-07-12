# Created by Blake Cornell, CTO, Integris Security LLC
# Modified for working with different jar file

if [[ -n $1 && -n $2 && -n $3 ]] # only for main target scan
then
	SCHEME=$1
	FQDN=$2
	PORT=$3
	if [[ -n $4 ]]
	then
		FOLDER=$4
	fi

	if [[ -n $5 ]]
	then
		EMAIL=$5
		echo Launching Scan against $1://$2:$3$4 EMailing reports to $5
		java -jar -Xmx1024m ~/Desktop/Burp_all/jar/burpsuite_pro_v1.7.34.jar $SCHEME $FQDN $PORT $FOLDER
		echo 'Your scan results are attached to this email. Carbonator_$1_$2_$3.html
	else
		echo Launching Scan against $1://$2:$3$4
		java -jar -Xmx1024m ~/Desktop/Burp_all/jar/burpsuite_pro_v1.7.34.jar $SCHEME $FQDN $PORT $FOLDER
	fi
else
	echo Usage: $0 scheme fqdn port path email
	echo '    'Example: $0 http localhost 80 /folder carbonator@integrissecurity.com
	echo '    Scan multiple sites: cat scheme_fqdn_port.txt | xargs -L1 '$0
fi

exit
