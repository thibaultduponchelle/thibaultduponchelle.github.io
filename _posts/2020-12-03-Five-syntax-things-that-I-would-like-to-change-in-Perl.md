---
layout: post
title: Five (syntax) things that I would like to change in Perl
date: 2020-12-03 14:01:18
---
Somewhat related to [What are five things you hate about your favorite language?](https://stackoverflow.com/q/282329) from **brian d foy**

There are some Perl syntax that I don't feel comfortable with.

![Kid think](/assets/images/1uwoux4pae3r2hbeyuhk.png)

This is my list of 5 things ! :smiley:

## Variant sigils
It is not original, but invariant sigils would make sense for me.

I'm not arguing to drop context or slices (even not at all) but I would feel better with invariant sigil (that simply shows what the *container* type is).

([Raku](https://www.raku.org/) is doing this)

In the same kind of things, having `$var` different from `@var` different from `%var` (etc...) is cool... but dangerous.

![Same](/assets/images/xth48478cr39o5idonv2.jpg)

## Array and hash declaration
I would prefer to use `{}` to declare hash (not hashref) and `[]` to declare array (not arrayref).

These symbols are just the same that we use to access the elements, it simply makes sense for me.

Working Perl :
```perl
# Hash 
my %h = ( k1 => "1", k2 => "2" ); 
print $h{'k2'};

# Array
my @a = ( "a", "b" ); 
print $a[1];

# Hashref
my $h = { k1 => "1", k2 => "2" }; 
print $h->{'k2'};

# Arrayref
my $a = [ "a", "b" ]; 
print $a->[1];
```

Since `{}` is the symbol to access a hash key and `[]` the symbol to access a array index, why it is linked to an hash*ref* and an array*ref* ?

And what about *simply* reusing the reference operator `\` for the refs ?

Imaginary code :
```perl
# Hash 
my %h = { k1 => "1", k2 => "2" }; # Same symbol to declare and access
print $h{'k2'}; 

# Array
my @a = [ "a", "b" ]; # Same symbol to declare and access
print $a[1]; 

# Hashref
my $h = \{ k1 => "1", k2 => "2" }; # \ is the "get ref" symbol
print $h->{'k2'}; 

# Arrayref
my $a = \[ "a", "b" ]; # \ is the "get ref" symbol
print $a->[1]; 
```

Of course, I like the features like array/hash conversion, array flattening and fat comma, I'm just a bit confused by how we declare arrayref and hashref.

## The missing comma
The *justifiable* but *error prone* missing comma when printing to filehandles :

```perl
print $fh ARGS
```

I don't feel good with this :/

![Sad](/assets/images/80el4b7cb8uk4q8fvtiy.jpg)

## Better OO in the core 

Ok (1), it's just a matter of installing a module... 

Ok (2), it is coming with [Cor](https://github.com/Ovid/Cor/wiki) :smiley:

![Snoop](/assets/images/e2mtth7t96mkqld8gd2u.gif)

## Still unclear about function prototypes or signatures
I'm really still unclear about what to use for function declaration. Some resources about it :
- [Why are function prototypes bad](https://stackoverflow.com/questions/297034/why-are-perl-5s-function-prototypes-bad)
- [Perldoc prototypes](https://perldoc.perl.org/perlsub#Prototypes)
- [Perldoc signatures](https://perldoc.perl.org/perlsub#Signatures)

I **NEED** prototypes or function signatures.

I usually declare all my functions at the top of a file with comments :
```perl
# Describe fn
sub fn($$;$);
```

I do this for clarity and because it checks parameters (if not called with `&`).
In addition, since I gather all predeclarations with comments, it gives an API for humans :smile:

The "predeclaration" could also just be *required* (depending the ordering and if you call the sub without parenthesis) but that's not the main goal (again you can bypass with `&`).

Then I define function like this :
```perl 
sub fn($$;$) {
    my $name = shift;
    my $age = shift;
    my $optional_comment = shift;
    
    ...
}
```

That I prefer over :

```perl
sub fn($$;$) {
    my ($name, $age, $optional_comment) = @_;

    ...
}
```

Or even worse (:scream:) :
```perl
sub fn($$,$) {
    print $_[0];
    print $_[1];
    print $_[2];

    ...
}
```

But honestly, I don't know, `signatures` are marked experimental and `prototypes` should not be used because they change the behaviour of a function. 

What is *the* right way then ? 

## Conclusion
That's it, that was my list ! :smiley:

![List](/assets/images/4jzwz3gvcrz0px3igrjk.jpg)

What is yours ?
