
sendmsg=n
#change the IPs as per your requirement

servarr[0]=172.25.71.10
servarr[1]=172.25.71.11
servarr[2]=172.25.44.110
servarr[3]=172.25.44.75
servarr[4]=172.25.44.101
servarr[5]=172.25.71.90


counter=0
downserv=\\n

for serv in ${servarr[@]}
do
	ping -c 1 $serv > /dev/null
	if [ $? -ne 0 ];then
		downserv=${downserv}\\n${serv}
		sendmsg=y
	fi
	((counter++))
done


if [ $sendmsg = y ];then
  #Insert your email addresses here
	echo -e "Hi Team,\n\nIt seems we cannot connect to the following Servers. ${downserv} \n\nPlease do the needful as soon as possible.\n\nThanks,\nIhsan " | mail -s "Cannot connect to Server" email1@mail.com -c email2@mail.com
fi 
