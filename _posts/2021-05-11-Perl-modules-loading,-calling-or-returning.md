---
layout: post
title: Perl modules loading, calling or returning
date: 2021-05-11 11:58:41
---
Modules (and CPAN) are one of the "killer feature" of Perl, this article will discuss module loading/calling and some subtleties around this topic.

## Where modules live do not dictate how they are called.
It is something important to understand early when you learn Perl programming, how you will load a module does not dictate its future package name (how it will be called). 

Let's start with a simple example with a empty module stored in a `File.pm` in a subdirectory:
```
Directory
└── Directory
    └── File.pm
```
`File.pm` contains nothing but a `true` return value:
```
1;
```
The import is done by pointing to the **path** of the **pm** file:
```perl
#!/usr/bin/env perl

use Directory::Directory::File;
```
So far, all good! :D

But it is too simple, so let's continue with a more real world example that actually *calls something*:
```perl
package Directory::Directory::File;

sub foobar() {
        print "Foo Bar!\n";
}

1;
```
It is imported and called like the following:
```perl
#!/usr/bin/env perl

# Import 
use Directory::Directory::File;

# Call
Directory::Directory::File::foobar();
```
Notice that `Directory::Directory::File::foobar();` matches the package declaration in the module file... Where actually when *calling* the modules functions/variables, we have to follow the package name decided by the author for its module (read the doc).

It could be `Directory::Directory::File::foobar()` or something totally different from the **path**.

Look at this new example:
```
Directory
└── Directory
    └── File.pm
```
The module is stored in `Directory/Directory/File.pm` but belongs to package **"Misleading"** and declares/defines once again a function `foobar`:
```perl
package Misleading;

sub foobar() {
        print "Foo Bar!\n";
}

1;
```
On importer side, the `use` and later the function call are not using the same "id" name:
```perl
#!/usr/bin/env perl

# Import 
use Directory::Directory::File;

# But package is actually named "Misleading" !!!
Misleading::foobar();

# WON'T WORK!
# Directory::Directory::File::foobar();
```

N.B.: Please note that the good practice is to make match path and package name. But you can meet [aliases](https://metacpan.org/pod/DDP)

## use vs require
The `use` and `require` are doing *almost* the same thing but at different phases.

The [require documentation](https://perldoc.perl.org/functions/require) ends with "For a yet-more-powerful import facility, see `use` and perlmod."

The `use` keyword executes at compilation phase means before execution even if it's the last line of your program.

Here is my sample "Bazinga" module:
```perl
package Bazinga;

sub joke() {
	print "Bazinga!\n";
}

1;
```
And trying to call the function `joke` before to actually load it works very well:
```
$ perl -I. -e 'Bazinga::joke(); use Bazinga;'
Bazinga!
```
It would not be the same with imports at runtime. 
```
$ perl -I. -e 'Bazinga::joke(); require Bazinga;'
Undefined subroutine &Bazinga::joke called at -e line 1.
```

With runtime imports, I can also import conditionally a module.

The following example will reload a module:
```perl
require Bazinga;

joke();

# Is it already loaded?
if ($INC{"Bazinga.pm"}) {
    print "Press ENTER to reload module:";
    <STDIN>;
    delete $INC{"Bazinga.pm"}; # Remove it from list
    require Bazinga; # Reload it
    joke();
};
```
When you run this code, it will import and execute `joke` then reload the module on "Enter" (and run `joke` again).
Since it reloads the module, I can even change the module (the content of the `joke` function) during the execution of the program:
```perl
sub joke() {
    print "Knock Knock Knock Penny!\n";
    print "Knock Knock Knock Penny!\n";
    print "Knock Knock Knock Penny!\n";
}

1;
```
And everything becomes more *dynamic*:
```perl
Bazinga!
Press ENTER to reload module:    
Knock Knock Knock Penny!
Knock Knock Knock Penny!
Knock Knock Knock Penny!
```

## Perl module return value
Modules have to return a "true" value, it sometimes confuse beginners, but I read somewhere that it comes from `Perl 4` where importing a module was much more like executing a subscript. 

So what if we try to return a "false" value?
```perl
0;
```
When importing it, we get in trouble:
```
$ perl -I. -e 'use Boom;'
Boom.pm did not return a true value at -e line.
BEGIN failed--compilation aborted at -e line 1.
```
Why are there is 2 messages here? 
There is one about importing and one about compilation because of the "phases" I mentioned just above.

Just replace `use` per `require` to change the phase where the import is processed and it will now only print the import failure:
```
$ perl -I. -e 'require Boom;'
Boom.pm did not return a true value at -e line 1.
```

Some people are playing with modules return codes like [Michael G Schwern](https://github.com/schwern) see [his stackoverflow response](https://stackoverflow.com/a/1864035) or more recently **PEVANS** with a `0x55AA` in its [Faster::Math](https://metacpan.org/release/Faster-Maths/source/lib/Faster/Maths.pm#L104)

You can find more example of return values thanks to [Acme::ReturnValue](https://returnvalues.plix.at/values.html)

## -M
You can import a module with command line switch `-M` like the following:
```
$ perl -I. -MBazinga -e 'joke()'
Bazinga!
```

## Visibility 
Namespace pollution and symbols export is an important topic that I will not discuss today but I leave you in [a good company](https://perldoc.perl.org/Exporter#Selecting-What-to-Export) :grinning: