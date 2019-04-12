BEGIN{
	packet_r=0;
	initial_time=$2;
	flag=0;
	end_time=-1;
}
{
	if($5 == "tcp" && flag ==0)
	{
		initial_time=$2
		flag=1;
	}
	if($1=="r" && ($5=="cbr" || $5== "ack"))
	{
		packetr+=$6;
		end_time=$2;
	}
}
END{
	printf("\nPackets Recieved: %d\nStart Time: %f\nEnd Time= %f\n",packet_r,initial_time,end_time);
	printf("\nThroughput in kbps= %f",packet_r/(1000*(end_time-initial_time)));
	
}
