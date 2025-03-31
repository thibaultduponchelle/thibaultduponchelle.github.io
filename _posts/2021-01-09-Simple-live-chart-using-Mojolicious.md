---
layout: post
title: Simple live chart using Mojolicious
date: 2021-01-09 15:56:29
---
![Live](/assets/images/1m8vkngba6uik1ikc00o.gif)

In this blog post, I will show how easy it is to write a live chart with [Perl](https://www.perl.org/), [Mojolicious::Lite](https://docs.mojolicious.org/Mojolicious/Lite) and some javascript (mainly [Highcharts](https://www.highcharts.com/)).

![Mojolicious](/assets/images/at40r8z12e9pedz17hon.png)

## The code
The [Mojolicious::Lite](https://docs.mojolicious.org/Mojolicious/Lite) very small webapp. With routes and get/set urls:
```perl
use Mojolicious::Lite;

my $datfile = "/tmp/values.txt";

# Answer to /
get '/' => sub {
	my $c = shift;
	$c->render(template => 'live', format => 'html');
};

# Set value from GET call
get '/setvalue/:value' => sub { 
	my $c   = shift;
	my $value = $c->param('value');
	open(my $fh, '>', $datfile) or die "Could not open $datfile $!";
	print $fh "$value\n";
	close $fh;
	$c->render(text => "You set the value to $value");
};

# Get value from GET call
get '/getvalue' => sub { 
	my $c   = shift;
	open(my $fh, '<:encoding(UTF-8)', $datfile) or die "Could not open '$datfile' $!";
	my $value = <$fh>;
  	chomp $value;
	$c->render(text => "$value");
};
```

Right below, I start the application:
```perl
app->start;
```

And open the `__DATA__` section (where falls the template/view in [Mojolicious::Lite](https://docs.mojolicious.org/Mojolicious/Lite) applications):

```perl
__DATA__
```

And the view, with **jquery** and **highcharts** to make it "live".... Yes it is a bit a big blob since there is all configs for the chart, but it's not that complicated !

The view is a big chunk of javascript and an almost empty piece of html (just one `div` to make room to chart):
```html
@@ live.html.ep
<html lang="us">
<head>
  <meta charset="utf-8">
  <title>Dynamic Live Chart</title>
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="http://code.highcharts.com/highcharts.js"></script>
  <script>
    $(document).ready(function() {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
    
        var chart;
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'spline',
                marginRight: 10,
                events: {
                    load: function() {
    
                        // set up the updating of the chart each second
                        var series = this.series[0];
                        var y = 0; 
                        setInterval(function() {
                            var x = (new Date()).getTime(); // current time
                            $.get('/getvalue', function(data) {
                              var oldy = y;
                              y = parseInt(data);
                              series.addPoint([x, y], true, true);
                            });
                        }, 1000);
                    }
                }
            },
            title: {
                text: 'Dynamic Chart live'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: 'Values'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            plotOptions: {
                line: {
                    marker: {
                        enabled: false
                    }
                }
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'Value',
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: 0,
                        });
                    }
                    return data;
                })()
            }]
        });
    });
  </script>
</head>
<body> 
<div id="container"></div>
</body>
</html>
```

We have our application, now we are ready to feed and test :smiley:

## Feed with random data
![Feed me](/assets/images/mn0x0azbhlltj53eyezr.jpeg)

As you can see, the data source is a flat `/tmp/values.txt` file that can be fed by http GET call or manually (this is what we will do right now):
```bash
$ while true; do echo `shuf -i 0-20 -n 1` > /tmp/values.txt; sleep 1; done
```

## Start it and test
I start it with development server `morbo` (but could be something else):
```bash
$ morbo live.pl
```

We can access value with:
```bash
$ curl http://127.0.0.1:3000/getvalue
12
```

Or set value to **100** for instance with the endpoint `/setvalue/100`:
```bash
$ curl http://127.0.0.1:3000/setvalue/100
You set the value to 100
```

## The result
Open your favorite browser and you will get this beautiful live chart:
![Live](/assets/images/1m8vkngba6uik1ikc00o.gif)

You can also get an overview [here](https://thibaultduponchelle.github.io/wawawa/livechart/)
