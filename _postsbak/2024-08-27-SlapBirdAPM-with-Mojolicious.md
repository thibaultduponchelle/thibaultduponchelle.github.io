---
layout: post
title: SlapBirdAPM with Mojolicious
date: 2024-08-27 11:14:25
---
This is my quick walk-through exploration of [SlapBirdAPM](https://slapbirdapm.com/) with my Perl web framework of choice ([Mojolicious](https://www.mojolicious.org/) of course!)
 
### Setup Mojolicious Web App
Install Mojolicious:
```
$ cpanm Mojolicious
--> Working on Mojolicious
Fetching http://www.cpan.org/authors/id/S/SR/SRI/Mojolicious-9.38.tar.gz ... OK
Configuring Mojolicious-9.38 ... OK
Building and testing Mojolicious-9.38 ... OK
Successfully installed Mojolicious-9.38 (upgraded from 9.32)
1 distribution installed
```

Generate project:
```
$ mkdir webapp
$ cd webapp
$ mojo generate lite-app bird
  [exist] /home/tib/Code/webapp
  [write] /home/tib/Code/webapp/bird
  [chmod] /home/tib/Code/webapp/bird 744
```

Test:
```bash
$ morbo bird
Web application available at http://127.0.0.1:3000
```

And check in your browser [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

## Create SlapBirdAPM account
Go visit [SlapBirdAPM](https://www.slapbirdapm.com):
![Image description](images/zn3b9am7io9k3ua5stny.png)

Login with GitHub:
![Image description](images/de5jkkbl7e1rvty0ugxe.png)

Create new app:
![Image description](images/zv3iq8ghxvrhbomcczmt.png)

And get your API Key:
![Image description](images/f1ld3h64t3vxe5s36woz.png)

## Install SlapBirdAPM in Web App
First install Mojolicious plugin:

```bash
$ cpanm SlapbirdAPM::Agent::Mojo
--> Working on SlapbirdAPM::Agent::Mojo
Fetching http://www.cpan.org/authors/id/R/RA/RAWLEYFOW/SlapbirdAPM-Agent-Mojo-0.005.tar.gz ... OK
Configuring SlapbirdAPM-Agent-Mojo-0.005 ... OK
==> Found dependencies: Const::Fast, System::Info
--> Working on Const::Fast
Fetching http://www.cpan.org/authors/id/L/LE/LEONT/Const-Fast-0.014.tar.gz ... OK
Configuring Const-Fast-0.014 ... OK
Building and testing Const-Fast-0.014 ... OK
Successfully installed Const-Fast-0.014
--> Working on System::Info
Fetching http://www.cpan.org/authors/id/H/HM/HMBRAND/System-Info-0.065.tgz ... OK
Configuring System-Info-0.065 ... OK
Building and testing System-Info-0.065 ... OK
Successfully installed System-Info-0.065
Building and testing SlapbirdAPM-Agent-Mojo-0.005 ... OK
Successfully installed SlapbirdAPM-Agent-Mojo-0.005
3 distributions installed
```


And add `plugin SlapbirdAPM;` to your web app. 

Our full application now looks like this:
```perl
#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

plugin 'SlapbirdAPM';

get '/' => sub ($c) {
  $c->render(template => 'index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
```

## Test!
Let's restart the application with the plugin and an API Key: 
```
$ export SLAPBIRDAPM_API_KEY=01ABCDEFGHIJKLMNOPKtest-app && morbo bird
Web application available at http://127.0.0.1:3000
[2024-08-27 11:33:27.51107] [8402] [info] Slapbird configured and active on this application.
```

Use your favorite browser to browse [http://127.0.0.1:3000](http://127.0.0.1:3000) or `curl http://127.0.0.1:3000`.

Your activity will immediately reflect in your SlapBirdAPM portal 
![Image description](images/a3mxp69pekqyvglnqu5p.png)

## We're done! :grinning: