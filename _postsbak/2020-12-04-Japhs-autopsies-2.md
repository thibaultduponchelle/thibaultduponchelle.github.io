---
layout: post
title: Japhs autopsies (2)
date: 2020-12-04 11:27:22
---
## Con de MIME

This is a french joke :smiley:

![Barrez vous, cons de MIMES](images/hzxl2wrlekteq65y8ky3.gif)

This Japh is from **Reynold Scem**

```perl
use MIME::Base64;(eval decode_base64('am9pbignJywobWFwe2NocigpfShncmVwL1xTLyxzcGxpdCgvKC4uLikvLCcwNzQxMTcxMTUxMTYwMzIwOTcxMTAxMTExMTYxMDQxMDExMTQwMzIwODAxMDExMTQxMDgwMzIxMDQwOTcwOTkxMDcxMDExMTQwNDQnKSkpKQ=='))=~/.*/;print$&
```

This one... We can't guess what will happen when we eval this encoded string...

It uses actually 2 steps to produce the Japh, first **base64 encoding**, that we can check with `base64 -d` :

```bash
echo "am9pbignJywobWFwe2NocigpfShncmVwL1xTLyxzcGxpdCgvKC4uLikvLCcwNzQxMTcxMTUxMTYwMzIwOTcxMTAxMTExMTYxMDQxMDExMTQwMzIwODAxMDExMTQxMDgwMzIxMDQwOTcwOTkxMDcxMDExMTQwNDQnKSkpKQ==" | base64 -d
join('',(map{chr()}(grep/\S/,split(/(...)/,'074117115116032097110111116104101114032080101114108032104097099107101114044'))))
```

From decoding I got the actual Perl code to evaluate and I feel a bit better now :grin:

The code Japh string creation code looks like this :
```perl
my $str = eval { join('', ( map {chr()} ( grep/\S/, split(/(...)/, '074117115116032097110111116104101114032080101114108032104097099107101114044')))) };
```

Then in the perl code there is `map`, `chr` (convert value to char), `grep \S` (match all non whitespace), `split(/(...)/,` (split per 3 chars).

It's a nice showcase :smiley: even if a lot of things are actually useless and only there to obfuscate the Perl code.

The Japh creation could be simply reduced to : 

```perl
my $str = join('', map {chr()} ( split(/(...)/, '074117115116032097110111116104101114032080101114108032104097099107101114044')));
```

The `join` seems useless but forces the **string context**.

So here is the complete Japh unfolded :

```perl
use MIME::Base64;

# Base 64 encoding
# am9pbignJywobWFwe2NocigpfShncmVwL1xTLyxzcGxpdCgvKC4uLikvLCcwNzQxMTcxMTUxMTYwMzIwOTcxMTAxMTExMTYxMDQxMDExMTQwMzIwODAxMDExMTQxMDgwMzIxMDQwOTcwOTkxMDcxMDExMTQwNDQnKSkpKQ==
# join('',(map{chr()}(grep/\S/,split(/(...)/,'074117115116032097110111116104101114032080101114108032104097099107101114044'))))

my $str = eval { join('', ( map {chr()} ( grep/\S/, split(/(...)/, '074117115116032097110111116104101114032080101114108032104097099107101114044')))) };
# Take 3 chars (...), do not keep space (\S), tranform to corresponding string representation, concat without space, eval (useless)

$str =~ /.*/; # Match everything
print $&; # The string matched by the last successful pattern match
```

Maybe you noticed that there is also some fun with regex match and captured match print. It is just for fun ! :smiley:

## Open Format Write

```perl
open(P,"|perl");print P"format=\nJust another Perl hacker,\n.\nwrite"
```

After some ordering, it looks like this :

```perl
open(P,"|perl"); 
print P "
format=
Just another Perl hacker,
.
write"
```

There are 2 tricks here :
* The open filehandle to another perl process
* The "format", an old Perl function that is less and less used nowadays 

It is actually the same than : 
```perl
format=
Just another Perl hacker,
.
write
```

## Kisses
Here is a simple but interesting japh with some kisses inside ! :kissing_heart: :kissing_heart: :kissing_heart: :kissing_heart:
```perl
@_=("Just another Perl hacker," =~ /(.*) (.*) (.*) (.*)/);print"@_";
```

![Kisses](images/82r897owzb3e1gdr6045.jpeg)

This japh demonstrates default variable `@_` and matching.

I think it can be rewritten like this : 
```perl
my $str = "Just another Perl hacker,";
my @a = $str =~ /(.*) (.*) (.*) (.*)/;
print join(" ", @a) . "\n";
```
Perl developers should be comfortable with this form :smile:


It's probably time to address *regex greediness*.

This kind of greedy `.*` matches is "dangerous" (depends what you want), because it will try to match as much as possible.

For instance `"Just another Perl 7 hacker,"` with the greedy version will produce a string split like the following : 

`Just another` `Perl` `7` `hacker,` (because the `.*` happily eats also the space)

## x25
Let's have a look at a simple japh using `printf`, `x` and ASCII conversion.

```perl
printf "%c"x 25,74,117,115,116,32,97,110,111,116,104,101,114,32,80,101,114,108,32,104,97,99,107,101,114,44;
```

The operator `x` is magic :

```perl
printf "perl " x 10
```

Will produce :
```perl
perl perl perl perl perl perl perl perl perl perl 
```

In the japh, the `x 25` is applied to `"%c"`, therefore it can be translated like this :

```perl
printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",74,117,115,116,32,97,110,111,116,104,101,114,32,80,101,114,108,32,104,97,99,107,101,114,44);
```

## Arrow here
Again a `printf "%c"` but this time the input being in hexadecimal and the whole thing being stored in a string assignment :
```perl
$_ = <<'-- '; s/../printf "%c",hex($&)/ge;
4a75737420616e6f74686572205065726c206861636b65722c
-- 
```

It starts with a ["here-doc"](https://perldoc.perl.org/perlop#%3C%3CEOF) delimited by `-- ` (dash + dash + space not represented by DevTo).

What is weird, is that the whole thing looks only like a string assignation...

Actually, the `printf` inside the regex will print to stdout. At the end `$_` does not even contains the string, but `sprintf` would have done the job.

And what is exactly `s/../printf "%c",hex($&)/ge` ?

* `s///` is for substitution.
* `$&` is what have been [matched]((https://perldoc.perl.org/perlvar#$&)).
* The `/e` modifier allows the right part of the substitution to be actually executed as normal Perl code.
* The `/g` modifier is the "looping modifier" or "global modifier" and just repeats the match along the string !

Finally, I propose this rewrite of the japh :

```perl
my $str = "4a75737420616e6f74686572205065726c206861636b65722c";
while($str =~ /../g) { # Or $str =~ s/..//
       printf("%c", hex($&));
}
```

Cristal clear like this isn't it ?
