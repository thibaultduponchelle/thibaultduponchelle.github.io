---
layout: post
title: Perl TCP client/server sample code
date: 2022-03-23 17:00:38
---
This post explains how to implement a simple Perl client/server using TCP sockets :tada:

I use [IO::Socket::INET](https://metacpan.org/pod/IO::Socket::INET) which is a core module (no need to install). How to know it's a *core* module? Check the [list of core modules in perldoc](https://perldoc.perl.org/modules) or simply use `corelist`:
```bash
$ corelist IO::Socket::INET

Data for 2019-05-22
IO::Socket::INET was first released with perl v5.6.0
```

Without waiting, let's move on to the Perl TCP client implementation :+1:

## Perl TCP Client
A very simple client, sending a message (containing "japh - " + the client timestamp) every 3 sec and stopping on signal (Control-C).

The target is localhost (for demo I'm running client and server on same machine) but it could be totally another IP or hostname (obviously... :grinning:).
```perl
#!/usr/bin/env perl

use strict;
use warnings;

use IO::Socket::INET;
# auto-flush on socket
$| = 1;

my $continue = 1;
$SIG{INT} = sub { $continue = 0 };


while ($continue) {
	my $timestamp = localtime(time);
	my $msg = "japh - $timestamp";

	# Create a connecting socket
	my $socket = new IO::Socket::INET (
		PeerHost => 'localhost',
		PeerPort => '7777',
		Proto => 'tcp',
	);

	if($socket) {
		my $size = $socket->send($msg);
		print "Sent!\n";
		$socket->close();
	}

	sleep 3;
}
```

Start client:
```bash
$ perl client.pl
```

The client sends data then wait 3 seconds, then sends data again and wait, and do it again and again...

As soon as we have the server running, a client live run will look like this:
![Client](images/vjdfcix1f2p5mzdte4g4.gif) 

If you wonder, if the server is not available, no problem, the client will stay alive (and send to nobody until a server is started).

## Perl TCP Server
The server looks the same, but is just a bit more complicated with more parameters to `$socket` constructor and an `accept()` step:
```perl
#!/usr/bin/env perl

use strict;
use warnings;

use IO::Socket::INET;
# auto-flush on socket
$| = 1;


# Creating a listening socket
my $socket = new IO::Socket::INET (
    LocalHost => '0.0.0.0',
    LocalPort => '7777',
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1
);
die "Cannot create socket $!\n" unless $socket;

$SIG{INT} = sub { $socket->close(); exit 0; };

while(1) {
    my $client_socket = $socket->accept();

    # Get information about a newly connected client
    my $client_address = $client_socket->peerhost();

    # Read up to 1024 characters from the connected client
    my $data = "";
    $client_socket->recv($data, 1024);
    print "$client_address - $data\n";
}

```

The `$socket->accept()` is blocking and will unblock when the client initiates the connection (`new IO::Socket::INET` on client side).

The server will retrieve the message (`$msg`) but also the IP address (`$client_address` via `peerhost()` method). It is listening forever and can handle multiple clients.

Below a demo of a running server:
![Server](images/wjf5jswet53zzrj5jygt.gif) 

Now with these sample code in your toolbox, you're ready to implement a custom simple small client/server or a very basic monitoring software! :grin: :muscle: