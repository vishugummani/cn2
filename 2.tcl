set ns [new Simulator]

set tf [open p2.tr w]
$ns trace-all $tf

set nf [open p2.nam w]
$ns namtrace-all $nf

set ftpwin [open ftpwin.tr w]
set telwin [open telwin.tr w]

set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]

$ns duplex-link $n1 $n3 30.5Mb 5ms DropTail
$ns duplex-link $n2 $n3 30.5Mb 5ms DropTail
$ns duplex-link $n3 $n4 30.5Mb 5ms DropTail
$ns duplex-link $n4 $n5 30.5Mb 5ms DropTail
$ns duplex-link $n4 $n6 30.5Mb 5ms DropTail

$ns duplex-link-op $n3 $n1 orient left-up
$ns duplex-link-op $n3 $n2 orient left-down
$ns duplex-link-op $n4 $n5 orient right-up
$ns duplex-link-op $n4 $n6 orient right-down
$ns duplex-link-op $n3 $n4 orient right

set tcp0 [new Agent/TCP]
$ns attach-agent $n1 $tcp0
set tcp1 [new Agent/TCPSink]
$ns attach-agent $n6 $tcp1

set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2
set tcp3 [new Agent/TCPSink]
$ns attach-agent $n5 $tcp3

$ns connect $tcp0 $tcp1
$ns connect $tcp2 $tcp3

set ftp [new Application/FTP]
$ftp attach-agent $tcp0

set telnet [new Application/Telnet]
$telnet attach-agent $tcp2

#congestion window for ftp

proc PlotWindow {tcpSource f} {
global ns
set counter 0.01
set currenttime [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $f "$currenttime $cwnd"
$ns at [expr $currenttime+$counter] "PlotWindow $tcpSource $f"
}

$ns at 0.1 "$ftp start"
$ns at 1.0 "$telnet start"
$ns at 0.1 "PlotWindow $tcp0 $ftpwin"
$ns at 0.1 "PlotWindow $tcp2 $telwin"
$ns at 4.0 "$ftp stop"
$ns at 4.1 "$telnet stop" 

proc finish { } {
global ns nf tf
$ns flush-trace
close $nf
close $tf
exec nam prg2.nam &
exec xgraph ftpwin.tr &
exec xgraph telwin.tr &
exit 0
}


$ns at 5.0 "finish"
$ns run
