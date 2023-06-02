grep !$H{$_}++, @A
---
unique items in list ($$_ might work if non number)
***
~~<> while $n++ < $.
---
iterate over all lines while inc $n and preserve $_
***
/a++a/
---
posessive boi (no backtracking)
iii
ccc
$_ = "aaaaaa";
print 0 + /a++a/
ooo
0
***
$S | $" x $N
---
right pad / left justify $S with length $N
iii
ccc
$S = "123";
print $S | $" x 4 . 5
ooo
123 5
***
$S & "\x7f" x $N
---
substr $S, 0, $N (use actual char)
***
$S =~ s/(.)(.)/${$2 > $1}/ge
---
string filter with compare / regex match via regex group
***
$S =~ /a/ > $S =~ /b/
---
check if $S match /a/ but not /b/ (can chain w/ >= < etc)
***
/ / ? grep $&, @A : 0
---
anti parenthesis ternary separator
iii
3
3 5
2 1
5 7
ccc
$, = $";
@A = 1..<>;
print / / ? map $_ * $` - $', @A : 0, $/ for <>
# / /,print map($_*$`-$',@A),$/for<>
# print/ /?map$_*$`-$',@A:0,$/for<>
ooo
-2 1 4 
1 3 5 
-2 3 8
***
//
---
use previous regex pattern if it matched
iii
01:01:01
ccc
<> =~ /..:(..):(..)/;
(gmtime 86400 - ($& * 3600 + $1 * 60 + $2)) =~ //;
print $&
ooo
22:58:59
***
sprintf "%05s", $S
---
left pad / right justify with zeros
***
sprintf "%-5s", $S
---
right pad / left justify with spaces
***
sprintf "%5s", $S
---
left pad / right justify with spaces
***
sprintf '%2$d %1$d', 1, 2
---
use nth argument multiple times in format string (single quote)
iii
ccc
printf '%2$d %1$d', 1, 2
ooo
2 1
iii
1
500
ccc
printf '%d: %08b %2$x', <>
ooo
1: 111110100 1f4
***
sprintf "%*vd", $P, $S
---
make a v string from $S separated by $P
iii
ccc
printf "%*v08b", $", "abc" 
ooo
01100001 01100010 01100011
***
use bigint;
$A->bnok($B)
---
$A choose $B (binomial coefficient / combinations)
***
use bigint;
1->blcm(@A)
---
LCM (least common multiple) of list @A
***
use bigint;
0->bgcd(@A)
---
GCD (greatest common denominator) of list @A
***
$S =~ s/(.)(?=.*\1)//g
---
unique chars of string $S (by last occurence)
***
s/./$& x $` !~ $&/ge
---
unique chars of string $S (maintain order) (regex chars will break)
***
s/./$& x ~$` !~ ~$&/ge
---
unique chars of string $S (maintain order)
***
%H = $S =~ /(.)()/sg
---
unique chars of string $S (only useful for printing)
***
s//-/
---
short $_ assignment / prepend for non bareword string
***
$H{$_} = $-++ for @A
---
store the index of each element from @A into %H (last index w/ duplicate & more flexible)
***
@H{@A} = keys @A
---
store the index of each element from @A into %H (last index w/ duplicate)
***
%H = qw(ROCK PAPER SCISSORS) x 2
---
store cyclic hash map %H from list
***
#!perl -p
s;$; $A
---
insert string $A at the end of $_ space sep with -p / -n / -a flag (only at end of program)
***
1/!print $S
---
exit the program while printing string $S
***
$S =~ /((.))/g
---
double each character in $S (works because global matches will return a seperate string for last, 2nd last, 3rd last, etc. group if there is a group)
***
$S =~ /.{$N}(.)/g
---
get every nth ($N + 1) char from $S
iii
12342345345645675678
ccc
$A = 4;
$N = $A - 1;
print join $", <> =~ /.{$N}(.)/g
ooo
4 5 6 7 8
***
%{{@A}}
---
convert list @A to a hashmap (unordered)
iii
abcabc
ccc
print ~~%{{map {$_, 1} <>=~/./g}}
ooo
3
***
%H = @A
---
maintain order of the key value pairs in list @A but use the last value
iii
ccc
print join $/, %H = (1, 2, "a", "b", 1, 593287)
ooo
1
593287
a
b
iii
apple: $100
orange: $10
apple: $10
ccc
# http://golf.shinh.org/reveal.rb?friend+of+a+friend/tails+%28Sisyphus%29_1674010743&pl
print %H = map {/.*\$/g, sprintf"%x
", (${$&} //= 1) *= hex$'} <>
ooo
apple: $1000
orange: $10
***
undef // &F
---
crash the program during runtime
iii
5 4 3 2 1 0
0 1 2 847 4
ccc
@A = glob <>;
print $A[$_] // &:, $/ for glob <>
ooo
5
4
3
***
`factor $N` =~ /: \d+$/
---
check if $N is prime
***
$N & ($N - 1) == 0
---
check if $N is a power of 2
***
($A ^ $B) > 2 ** 63
---
check if $A has a different sign than $B (i think this works)
***
${$S}
---
variable variable (default "hash")
iii
chicken
finger
chicken
ccc
chomp, $$_++ for <>; # can omit brackets usually
print $chicken
ooo
2
iii
chicken
finger
chicken
ccc
`dd` =~ s/.*/++${$&}/ger;
print $chicken
ooo
2
***
-A
---
set $! to 2 in numerical context
***
@ARGS
---
command line arguments
***
!<>
---
0 (if more than 1 line of input)
iii
2
4
3
ccc
# <>;$z+=$_**$_ for<>;print 0|1+sqrt$z
print!<>|1+${\map$z+=$_**$_,<>}**.5
ooo
17
***
$/ = $S;
print <> + <>
---
single use $S seperated input
iii
1 2
ccc
$/ = $";
print <> + <>
ooo
3
***
$$_ = <> for A..Z
---
read a lot of arguments
iii
1 2 3 4 5 6 7
ccc
$/ = $";
$$_ = <> for A..Z;

print $G
ooo
7
***
m!.!
---
regular expression (nesting)
iii
ccc
$_ = "bruha";
m!.(?{$z += /[aeiou]/ * $i++})^!;
print $z
ooo
10
***
@A = (@B, @A)
---
shorter unshift @B to @A
***
@A = (@A, @B)
---
shorter push @B to @A
***
@A[-$N..-1]
---
slice the last $N items list @A
***
/$/
---
store outer $_ into $` if // and $' doesn't work (// will try to use prev regex)
iii
3 5
1
6
4
ccc
# https://atcoder.jp/contests/abc215/submissions/25248485
<>;
@$_ | /:/ || map @{$_ * $`} = 1, /$/ .. 1e5 / $` for glob `factor`;
@A = grep $#$_, 1..$';
print @A . "
@A"
ooo
2
1 5
***
$A | $B && $C & $D
# ($A || $B) && ($C && $D)
---
higher precedence logical comparisons (ensure they are boolean)
***
$#A
---
-1 (if nothing in @A)
iii
ccc
$a = 3;
print $#A ** ($a == 3)
ooo
-1
***
~~map /ABC/g, $S
---
count how many matches in string $S (work with list too)
***
$S !~ /\d/
---
check of $S does not match the regex
iii
ccc
$S = "achicken";
print $S !~ /\d/ ? ya : no
ooo
no
***
<> !~ $"
---
split input by $" into $` $' and return 0
iii
3 5
ccc
print $` * $' + $_, $/ for <> !~ $" .. 5
ooo
15
16
17
18
19
20
***
$H{print "bruh"; 3}
---
evaluate code block and index hash %H
***
$n && ${print "chicken $_\n" for 1..5}
---
evaluate code block if condition $n is true
iii
4
1
3
6
7
ccc
<>;
//, $' % 2 && ${($x += $') <<= 2 for 1..5}, print $x, $/ for <>
ooo
1364
1400828
1400828
1434457420
***
$n = $n * $B + $_ for $S =~ /./g
---
convert base $B string $S to decimal (store in $n)
***
$n += $n + $_ for $S =~ /./g
---
convert base 2 string $S to decimal (store in $n)
***
-$_ for -50..-30
---
range 30 to 50 in reverse order
iii
ccc
print "." x -$_, $/ for -5..-1
ooo
.....
....
...
..
.
***
/(.)(?1)/
---
inject the nth group in a regex
iii
ccc
$_ = "1a3927e"
print /([aeiou])\d+(?1)/ ? $& : invalid
ooo
a3927e
***
print $_ + 3for <>
---
short single line input with $_ if there is no whitespace before the for 
iii
5
5
ccc
$_=<>;print$_+3;
print$_+3for<>
ooo
88
***
/(??{ 1 + 1 })/
---
postponed match: match a perl expression with $&, $1, etc
iii
ccc
$_ = "2123";
print /\d(??{ $& + 1 })/ ? $& : invalid
ooo
12
iii
ccc
$_ = "aeb";
$r = "[aeiou]";
print /.(??{$a = $&; $r . ++$a})/ ? "good" : "bad"
ooo
good
***
map {$i = 0; [map $A[$_]->[$i], 0..$#A]} 0..$#{$A[0]}
# map{//;[map$A[$_]->[$'],0..$#A]}0..$#{$A[0]}
---
transpose list @A of list references
***
qq{}
---
double quote string with any delimiter
q{}
---
raw string with any delimiter
***
'chicken $S'
---
raw string `chicken $S`
***
"@_"
---
first argument in subroutine (must be number)
***
&F
---
call function &F without any arguments
iii
10
1
ccc
sub F {oct b . <>}
&F + F # dont need brackets
ooo
3
iii
BRUH
101
ccc
sub F {oct b . <>}
print <> =~ /B/ ? &F : 3 + F # avoid ternary bareword
ooo
5
***
$S++
---
post increment string $S
***
++$S
---
pre increment string $S
iii
ccc
$a = "brug";
print ++$a
ooo
bruh
iii
ccc
$a = "z";
print ++$a
ooo
aa
iii
ccc
$a = "zZ";
print ++$a
ooo
aaA
***
$S =~ /(.)\1/
---
2 of the same character beside each other in $S
***
/\PL/
---
match lowercase character
***
/\s/
---
match whitespace character
***
/\S/
---
match non whitespace character
***
binmode$~,utf8;
binmode STDIN,utf8;
---
utf8 stuff
iii
🦋❤️
ccc
binmode$~,utf8;
binmode STDIN,utf8;

$S = <>;
@S = $S =~ /./g;
print $S[0]
ooo
🦋
iii
🦋❤️
ccc
binmode STDIN,utf8;

$S = <>;
@S = $S =~ /./g;

print $S[0]
ooo
🦋
***
do {}
---
do block (advanced ternary)
iii
1
4pr
print
3int
6rint
ccc
# if else is too long
/pri/ ? do {print int, $/ for @A} : push @A, $_ for <>
ooo
1
4
1
4
3
6
***
$A[@A]
---
push to list @A and return
iii
5
3
12
3
3
4
ccc
print $A[@A] = grep($_ == $A[-1], @A), $/ for <>
ooo
0
1
1
2
1
3
***
use bignum
---
disables scientific notation and you can use decimals too (very slow)
***
use bigint
---
like `use integer` but disables scientific notation (slow)
***
use integer
---
makes everything an integer and makes bitwise operators work on negative numbers
***
"$N"
---
use the value of $N before modification in the same expression
iii
ccc
$N = 3;
print "$N" + ($N += 3)
ooo
9
iii
ccc
print "$_
" x (s/.(??{$& + 1})//g > 1) for 1..2301
ooo
1201
1212
1223
1234
1245
1256
1267
1278
1289
2301
***
$A ? chicken : onion
---
ternary with bareword branches
iii
3-5
2-
4
ccc
print /^\d-\d/ ? chicken : onion, $/ for <>
ooo
chicken
onion
onion
***
use 5.01
---
say support
iii
ccc
use 5.01;
say "bruh";
say "bruh";
ooo
bruh
bruh
***
<"@A {1,2,3}\n">
---
glob with string interpolation
iii
ccc
@A = (1, 5);
print <"@A {1,2,3} {1,2,3}\n">
ooo
1 5 1 1
1 5 1 2
1 5 1 3
1 5 2 1
1 5 2 2
1 5 2 3
1 5 3 1
1 5 3 2
1 5 3 3
iii
ccc
@A = (1, 5);
print "" . <"@A {1,2,3} {1,2,3}\n"> for 1..3
ooo
1 5 1 1
1 5 1 2
1 5 1 3
***
do $0
---
file recursion
iii
5
chickenfinger
ccc
#!perl -lp
y///c < 10 and $_ .= "bruh", do $0
ooo
5bruhbruhbruh
chickenfinger
***
*{$S}
---
typeglob variable variable
iii
50
ccc
$n = <>;

# this is cursed lol
*{$n % $_} = \($1 + 1) for 1..$n;
print $1
ooo
11
***
$0
---
name of the current file
iii
50
ccc
$n = <>;
${$n % -$_}++ for 1..$n;
print $0
ooo
6
***
$.
---
amount of lines read
iii
5
ccc
$n = <>;
$. *= $_ for 1..$n;
print $.
ooo
120
iii
chicken
and
fish
ccc
# <> in list context consumes all at once
/.*/, print $& x $.--, $/ for <>
ooo
chickenchickenchicken
andand
fish
iii
chicken
and
fish
ccc
#!perl -lp
$_ x= $. # works with -p too
ooo
chicken
andand
fishfishfish
***
$+
---
last paren match in regex
iii
ccc
$_ = "xX_chicken_Xx"
s/(X)|x/print "[$+]\n"/ge;
ooo
[]
[X]
[X]
[]
***
perl -M
---
bash module import
iii
ccc
perl -MList::Util=max,uniq -e 'print max 1,2,3'
ooo
3
***
use DateTime
---
date time stuff
***
#!perl -lp
push @B, $_} for (@B) {
---
eskimo greeting to print newline seperated list (-l sets $/ to "\n")
***
~~($S =~ s/bruh .//g)
---
count the amount of match in $S (will mutate)
iii
ccc
$_ = "wower";
print ~~s/[aeiou]//gi
ooo
2
iii
ccc
$_ = "wower";
print s/[aeiou]//gi # dont need inchworm if definite non zero or cast to int later
ooo
2
***
y%%%
---
transliterate with another delimiter so you can use '/' without escaping
***
s!!!
---
substitute with another delimiter so you can use '/' without escaping
***
$= = $N
---
max of 0 and $N (if $N is an integer or you want to cast anyway)
***
*A = [1,2,3]
---
typeglob dereference (will alias so be careful)
iii
ccc
$B = [1, 2, 3];
*A = $B;
$A[0]++;
print "@$B" # modification of $B indirectly
ooo
2 2 3
iii
[1, 2, 3]
ccc
*A = eval <>;
print "@A"
ooo
1 2 3
***
join qw(a 1 2 3)
---
join on the first value the rest of the values
iii
ccc
print join qw(a 1 2 3)
ooo
1a2a3
***
m??
---
falsy on first ever iteration of block (idk how it works lol)
iii
chicken
ccc
#!perl -l
s/(.)(.*)/$2$1/, m?? || print for (<>) x 5
ooo
ickench
ckenchi
kenchic
enchick
iii
ccc
sub F {
  $A = $i = 0;
  {
    $j = $B = 0;
    m?? || do {
      print "***$A***";
      {
        m?? || print "[$B]"; # only skips on first ever enter
        $B++;
        $j++ < 3 && redo
      } 
    };
    $A++;
    $i++ < 3 && redo
  }
  print "\n";
}

F;
F;
ooo
***1***[1][2][3]***2***[0][1][2][3]***3***[0][1][2][3]
***0***[0][1][2][3]***1***[0][1][2][3]***2***[0][1][2][3]***3***[0][1][2][3]
***
split /\./, $S
---
must use // or '' to split $S on special regex chars (or double escape if you really need to "\\.")
***
exp $N
---
e to the power of $N
***
atan2 $N
---
arctan / tan^-1 of $N (in radians)
***
use POSIX qw(strftime);

# https://metacpan.org/pod/POSIX::strftime::GNU
strftime "%Y:%m:%d - %H:%M:%S"
---
convert number to time string
***
($second, $minute, $hour, $month_day, $month, $year, $week_day, $year_day) = gmtime 91273
---
convert number to time list
***
~~gmtime 91273
---
convert number to time string
***
$N |= /\d/
---
one time variable toggle for $N
iii
299
ccc
$N |= /3/ and $- += $_ for 1..<>;
print $-
ooo
12
***
s///regex
---
return execute global execute e(x)cess-whitespace (joke entry)
iii
a
b4by go w8937283
ccc
$s = <>;
$_ = <>;
s/\d/"y!$&!a!"/regex;
print
ooo
baby go waaaaaaa
***
s///ee
---
double eval replacement
iii
a
b4by go w8937283
ccc
$s = <>;
$_ = <>;
s/\d/"y!$&!a!"/gree;
print
ooo
baby go waaaaaaa
***
/\K/
---
store match right of \K into $& (append left match to $`)
iii
-ad
-3c
-ca
-2b
ccc
/\d\K./ and print "$`|$&
" for <>
ooo
-3|c
-2|b
***
s'@A''
---
substitute without interpolating
***
($N) = @A
---
set $N to the first element of @A
***
($A, $B, @B) = @A
---
unpack list @A into $A (first elem), $B (second elem), and @B (rest)
***
$^H
---
256 (unsigned 32 bit integer $\x08)
***
$^D
---
0 (unsigned 32 bit integer $\x04)
iii
++++++-------++
ccc
# http://golf.shinh.org/reveal.rb?rad+math/Sisyphus_1673174109&pl
print + (0, "*", 1..5)[$^D += $_.1] // &: for <>=~/./g
ooo
*123454321*0
***
$^E
---
0 in numerical context (signed 32 bit integer $\x05)
***
$^F
---
2 (on anagol you can use $\x06 (2 bytes))
***
${ \(1 + 1) }
---
regex / string interpolate the expression `1 + 1` as a scalar
iii
ccc
sub F {
  "w"
}

$_ = "wow";
print /${\F}/ ? "yes" : "no" # can omit brackets depending on precedence
ooo
yes
iii
ccc
print "bruh ${\(3 + 3)} 123" # just use baby cart for most cases
ooo
bruh 6 123
iii
ccc
sub F {
  3 + pop
}

print "bruh ${\F 3} 123"
ooo
bruh 6 123
***
@{{@A}}{@B}
# %H = @A; @H{@B}
---
create hash reference from @A and grab @B values in list context
***
{@A}->{$K}
# %H = @A; $H{$K}
---
create a hash reference from list @A and grab the value at key $K
iii
ccc
@A = (1,2,3,4);
$K = 3;
print + {@A}->{$K}
ooo
4
***
@H{@A}
---
return values of %H at each key of @A
iii
ccc
%H = (1 => 2, 5 => 6, 3 => "we");
@A = (1, 3, 5);
print join $", @H{@A}
ooo
2 we 6
***
%H{@A}
---
return key value pairs of %H for each item in @A as a single list
iii
ccc
%H = (1 => 2, 5 => 6, 3 => "we");
@A = (1, 3, 5);
print join $", %H{@A}
ooo
1 2 3 we 5 6
***
print /(\d+) (\d+)/ && chr($1+$2) . $/ for<>
---
use regex to skip non matching lines (usually not shorter)
***
INIT {<>}
---
skip the first line in -p or -n
iii
3
1
2
3
ccc
#!perl -lp
INIT {$n = <>} $_ *= $n 
ooo
3
6
9
***
<> =~ $/
---
store input without newline into $`
iii
a
b
ccc
<> =~ $/;
print "[$`]"
ooo
[a]
***
$H{$i, $j}
---
multi dimensional "list"
iii
ccc
for $i (0..5) {
  for $j (0..5) {
    $H{$i, $j} = $i * $j;
  }
}
print $H{3, 3}
ooo
9
***
keys @A
---
list of indices of @A (0 .. $#A)
***
values %H
---
values of %H (unordered)
***
keys %H
---
keys of %H (unordered)
***
"@A" + 0
---
print the first element in @A (only for number list)
iii
ccc
@A = (2, 2, 3);
print 1 / "@A"
ooo
0.5
***
~~<{1,2}{_}{1,2}>
---
glob iterator
iii
ccc
@A = (1,2);
print "chicken" . <{1,23}{_}{1,5}>, $/ for @A
ooo
chicken1_1
chicken1_5
***
unpack "x$N", $S
---
skip $N characters from string $S
iii
ccc
print join $/, unpack "C2x2C", "chicken"
ooo
99
104
107
iii
ccc
print join $/, map chr, unpack "C2x2C", "chicken"
ooo
c
h
k
***
sort {length($a) - length($b) || $b cmp $a} @A
---
sort list @A by multiple predicate (left to right)
***
sort {@$a[0] - @$b[0]} @A
---
sort list of list references @A by the first element
iii
ccc
use Data'Dumper;
@A = ([1,43,3], [5,3,2], [123,12,4]);
print Dumper sort {@$a[0] - @$b[0]} @A
ooo
$VAR1 = [
          1,
          43,
          3
        ];
$VAR2 = [
          5,
          3,
          2
        ];
$VAR3 = [
          123,
          12,
          4
        ];
***
<a b   c   >
---
qw but with glob (can interpolate in list context)
iii
ccc
$i = 3;
print for <$i 3>
ooo
33
iii
ccc
@A = (" nice", "   chic ken", "br o");
print "[$_]" for <@A>
ooo
[nice][chic][ken][br][o]
iii
ccc
@A = (" nice", "   chic ken", "br o");
print <@A> . $/;
ooo
nice
iii
ccc
print "[$_]" for <{1,2}{1}>
ooo
[11][21]
***
qw(  a   b  c)
---
quote words: split raw string on whitespace /\s+/
iii
ccc
$c = "bruh";
print join $/, qw(a $c)
ooo
a
$c
iii
ccc
print join $/, map length, qw(the chicken be with you)
ooo
3
7
2
4
3
***
pack "W*", @A
---
convert ascii code list @A to string
iii
ccc
@A = (97, 98, 99);
print pack "C*", @A 
ooo
abc
***
eval join "+", $S =~ /\d+/g
---
sum of the numbers in string $S
iii
31 1
1 2 2
ccc
print eval(join "+", /\d+/g), $/ for <>
ooo
32
5
***
[] + 0
---
big number when cast to number
---
iii
ccc
print [] + 0 # different each time
ooo
94760256648160
iii
ccc
print 1 / []
ooo
1.06520656121523e-14
iii
ccc
print [] . "bruh" # doesn't work on string
ooo
ARRAY(0x5643e6cd13e0)bruh
***
@{$S}
---
list variable variable
iii
ccc
@0 = (1,2,3);
print @{map 1, 1..0} # scalar of empty map == 0
ooo
123
iii
a
c
b
ccc
chomp, @$_ = $_ x ++$i for <>;
print @$_ for a..z
ooo
abbbcc
iii
[1,2,3]
ccc
print join $/, @{eval <>}
ooo
1
2
3
***
$#{$S}
---
dollactothorp variable variable
iii
ccc
$A = "wow";
@wow = (1,2,3);
print $#$A # can omit the brackets with only one statement
ooo
2
iii
ccc
@wow = (1,2,3);
print $#{"w" . "o" . "w"}
ooo
2
***
$N > 1 && 1 == grep $' % $_ < 1, $N =~ // .. sqrt $N
# $_>1&&1==grep$'%$_<1,//..sqrt
# 1==grep$'%$_<1,//..sqrt (includes 1)
---
check if $N is prime O(sqrt N)
***
$A ~~ $B
---
check if string $A equals string $B
iii
ccc
$A = "32";
$B = "32\n";
print $A ~~ $B ? "yes" : "no"
ooo
no
***
$A ne $B
---
check if string $A does not equal string $B
iii
ccc
$A = "32";
$B = "32\n";
print $A ne $B ? "yes" : "no"
ooo
yes
***
$A cmp $B
---
compare string $A to string $B by ascii codes (less -1, equal 0, greater 1)
iii
ccc
$A = "32";
$B = "32\n";
print $A cmp $B
ooo
-1
***
unpack "%B*", pack I, $N
---
count amount of ones in binary representation of $N (pop count)
***
getc
---
get a single char from stdin
iii
abc
ccc
print $_ . "e" while $_ = getc
ooo
aebece
***
++$_ for ($-) x 9
---
local value of $_ that persists in each loop iteration (must have lvalue in the singleton list)
iii
ccc
++$_ for ($i = 3) x 9;
print $i # modifies lvalue value
ooo
9
iii
ccc
$_ = "chicken";
print ++$_, $/ for ($-) x 5;
print
ooo
1
2
3
4
5
chicken
iii
5
ccc
print ++$_ for (<>) x 5
ooo
6
7
8
9
10
iii
ccc
print $_ .= "e", $/ for ($x) x 5
ooo
e
ee
eee
eeee
eeeee
***
int $N
---
cast $N to integer
iii
1
2
3
ccc
print int for <>
ooo
123
***
printf @A
---
print the first element of @A
iii
12
34
ccc
printf $x, /.*/, $x .= $& for <>
ooo
121234
***
$;
---
multi dimensional hash seperator
iii
ccc
$; = "a";
$H{1,2,3} = 1;
print $H{"1a2a3"}
ooo
1
***
$,
---
"" (output field seperator)
iii
ccc
$, = ",";
@A = (1, 2, 3);
print @A
ooo
1,2,3
iii
ccc
$, = ",";
@A = (1, 2, 3);
print 1, @A, 5
ooo
1,1,2,3,5
***
$\
---
"" (output record seperator)
iii
ccc
$\ = "wow";
print
ooo
wow
iii
ccc
$\ = "wow";
print "e"
ooo
ewow
iii
ccc
$_ = "1";
$\ = "wow";
print
ooo
1wow
iii
1
2
ooo
$\ += $_ * 3 for <>;
print
ccc
9
***
$"
---
" " (list seperator)
iii
ccc
@A = (1,2,3);
$" = "+";
print "@A"
ooo
1+2+3
***
$a $b
---
sorting variables (dont use elsewhere unless you know what you are doing) 
***
$/
---
"\n" (input record seperator)
iii
1+2+3
ccc
$/ = "+";
print "[$_]" for <>
ooo
[1+][2+][3]
***
$%
---
0
***
$-
---
0 (always casts to non negative integer)
iii
ccc
$- -= 1;
print $-
ooo
0
iii
ccc
print + ($- += 3) /= 2
ooo
1
iii
ccc
print $- = 3 / 2
ooo
1
***
$=
---
60 (always casts to integer)
***
$^T
---
big number (seconds since epoch on program run)
***
++$N
---
pre increment $N
***
$N++
---
post increment $N
$N--
---
post decrement $N
***
--$N
---
pre decrement $N
***
}{
---
eskimo greeting: end block for -p -n -a -F
iii
ccc
#!perl -p
$code_a }{ $code_b
==============================
# equivalent to
while ($_ = <>) {
  $code_a
}{
  $code_b
;; # double semicolon on next line significant on codingame >:(
  print
}
iii
5
10
ccc
#!perl -p
$\ += $_ * 2 }{
ooo
30
***
length $S
---
length of scalar $S
iii
ccc
$S = "chicken";
print length $S
ooo
7
iii
ccc
$_ = "chicken";
print length
ooo
***
$_
---
default var
***
$S =~ m//
---
match $S on regex
iii
ccc
$S = "my Man";
print $S =~ /M/ # can omit m if you use / as delim
ooo
1
iii
ccc
$_ = "my Man";
print /M/ # can omit =~ if you use default var $_ 
ooo
1
***
"${S}"
---
iterpolate $S with alphanumeric char after
iii
ccc
$S = 3;
print "${S}bruh"
ooo
3bruh
iii
ccc
$% = $^ = $, = 3;
print "$%bruh $^bruh $,bruh" # not needed for symbol vars
ooo
3bruh 3bruh 3bruh
***
$S =~ /(.)(.)(?{print "$1 $2\n"})^/
---
iterate over each consecutive char pair
***
chop $S
---
remove last char from $S and return it
iii
ccc
$S = "bruh\n";
print "[", chop $S, "]"
ooo
[
]
iii
bruh
ccc
$_ = <>;
print "$z$_
" while $z = chop
ooo
hbru
ubr
rb
b
***
@A[@B]
---
@A at all indices of @B
***
$H{$K}
---
%H at key $K (return the value value)
***
$A[$N]
---
@A at index $N (dont use @A[$N] unless you know what you are doing)
***
[@A] ~~ [@B]
---
check if @A smart matches with @B
***
$N ~~ @A
---
check if $N smart matches the last element of @A
***
$N ~~ [@A]
---
check if $N smart matches any element of @A
iii
ccc
$N = 3;
@A = (1, 4, 3);

print eval q($N ~~ [@A])
ooo
1
---
check if $N smart matches any item in @A
***
$N / .0174532925199432957692369
# $N * 180 / 3.14159
---
convert from radians to degrees (feel free to chop some digits)
***
use Math'Trig;
rad2deg($N)
---
convert $N from radians to degrees
***
$N * .0174532925199432957692369
# $N * 3.14159 / 180
---
convert $N from degrees to radians (feel free to chop some digits)
***
use Math'Trig;
deg2rad($N)
---
convert $N from degrees to radians
***
sin ($N) / cos ($N)
---
tan of $N (in radians)
***
cos ($N)
---
cos of $N (in radians)
***
sin $N
---
sin of $N (in radians)
***
log $N
---
log base e of $N
***
log($N) / log($B)
---
log base $B of $N
***
$S =~ / \S+/
---
split $S into 3 numbers $` $& $'
iii
1 2 3
4 5 6
ccc
/ \S+/, print $` * $& + $', $/ for <>
ooo
5
26
***
"\u\L$S\E"
---
uppercase first char of $S, lowercase rest
iii
ccc
$s = "cHickeN";
print "\u\L$S" # can omit \E if nothing else
ooo
Chicken
iii
ccc
$_ = "cHickeN-finger and toast";
print s/\w+/\u\L$&/gr;
ooo
Chicken-Finger And Toast
***
"\U$S\E"
---
uppercase string $S
iii
ccc
$S = "wow";
print "\U$S" # can omit \E if nothing else
ooo
WOW
***
"\L$S\E"
---
lowercase string $S
iii
ccc
$S = "WOW";
print "\L$S" # can omit \E if nothing else
ooo
wow
***
"\l$S"
---
lowercase first character of $S
iii
ccc
$_ = "AWOW123";
print s/[a-o]/\l$&/gr
ooo
aWoW123
***
"\u$S"
---
uppercase first character of $S
iii
ccc
$_ = "awow123";
print s/[a-o]/\u$&/gr
ooo
AwOw123
***
lc $S
---
lowercase string $S
***
uc $S
---
uppercase string $S
***
/\PL/
---
match non alphabetic character
***
/\pL/
---
match alphabetic character
***
sprintf "%0*d", 1 + 5, $S
---
format $S with expression length padding
***
sprintf "%0$^d", $S
---
format $S with variable $^ length padding
iii
ccc
$a = 3;
printf "%0${a}d", 50
ooo
050
iii
ccc
$^ = 3;
printf "%0$^d", 50
ooo
3
---
%!
---
hash map with a lot of items
iii
1
2
5
ccc
$s += <> for %!;
print $s
ooo
8
***
$S =~ / /
---
store prematch into $` and postmatch into $'
iii
1 632
2 5
ccc
/ /, print $` * ($' + 1), $/ for <>
ooo
633
12
***
split $", `dd`
---
split all input on $"
***
glob `dd`
---
glob all input
***
split $/, `dd`
---
split all input on $/
iii
a
b
c
ccc
print join "+", split $/, `dd`
ooo
a+b+c
***
chomp(@A = <>)
---
split <> on $/ into @A and remove delimiter from the end of each string
iii
1
2
3
ccc
chomp(@A = <>);
print join "+", @A
ooo
1+2+3
***
$S =~ /.*/
---
store $S without newline into $&
iii
a
b
c
ccc
/.*/, print $& for <>
ooo
abc
iii
54 fish
32 chicken
ccc
/ (.*)/, $H{$1} = $` for <>;
print join $/, sort {$H{$a} - $H{$b}} keys %H
ooo
chicken
fish
***
\%H{@A}
---
store unique keys into %H (unordered)
iii
ccc
@A = (1, 1, 4, 5);
\%H{@A};
print ~~%H
ooo
3
***
`tr`
---
transliterate / translate all input
***
`tac`
---
reverse all lines in input
***
`rev`
---
reverse all input
***
`sort`
---
bash sort all lines in input
***
`factor`
---
prime factorization each input line
***
${\sort @A}
---
max of list (string sort)
***
${\sort {$a-$b} @A}
---
max of list @A (numerical sort) (use <=> for large values)
***
${\sort {$b-$a} @A}
---
min of list @A (numerical sort) (use <=> for large values)
***
\@B[@A]
---
store max value of list @A into $#B (no negative) (do not modify $#B or @B after)
iii
ccc
@A = (1, 2, 32342);
\@B[@A];
print $#B
ooo
32342
***
[]
---
array / list reference (nested list)
iii
ccc
$A = [1];
print join $/, @$A
ooo
1
iii
ccc
$A = [[1, 4], 3];
print join $/, @{@$A[0]}
ooo
1
4
iii
5
4
ccc
$H{$_} = [$_ + 1, $_ - 1] for <>;
print join $/, @{$H{5}}
ooo
6
4
***
@{$A}
---
convert a list reference $A to a list
iii
ccc
$A = [1];
print join $/, @$A # can omit {} if just var
ooo
1
iii
ccc
$A = [[1, 4], 3];
print join $/, @{@$A[0]}
ooo
1
4
iii
5
4
ccc
$H{$_} = [$_ + 1, $_ - 1] for <>;
print join $/, @{$H{5}}
ooo
6
4
***
$$A
---
double variable $$A
iii
ccc
$A = "chicken";
$$A = 3;
print $chicken
ooo
3
iii
ccc
$A = "chick";
${$A . "en"} = 3;
print $chicken
ooo
3
iii
a
b
d
ccc
++$$_ for split $/, `dd`;
print $$_ + 0, $/ for a..d
ooo
1
1
0
1
***
"@+" + 0
---
get the index + length of the match
iii
ccc
$_ = "wow";
/ow/;
print "@+" + 0
ooo
3
***
"@-" + 0
---
get the index of the match
iii
ccc
$_ = "wow";
/ow/;
print "@-" + 0
ooo
1
***
until
---
while loop until condition is false
iii
ccc
$n = 32;
# $- += $n * 3, $n /= 2 while $n >= 5;
$- += $n * 3, $n /= 2 until $n < 5; 
print $-
ooo
168
***
while
---
while loop
iii
ccc
$n = 32;
while ($n > 5) {
  $- += $n * 3;
  $n /= 2 
}
print $-
ooo
168
iii
ccc
$n = 32;
$- += $n * 3, $n /= 2 while $n > 5; # one line while
print $-
ooo
168
***
sprintf "%.2f", $N + .0049
---
ceil $N to 2 decimal places
***
sprintf "%.2f", $N - .0049
---
floor $N to 2 decimal places
***
sprintf "%.2f", $N
---
round $N to 2 decimal places
***
--$|
---
flip flop expression
iii
1
2
3
ccc
--$| ? $- += $_ : print $-, $/ for <>
ooo
2
***
${+uc}
---
evaulate inner function on $_ rather than bareword
iii
ccc
$_ = "neat";
${+uc} = $_;
print $NEAT
ooo
neat
***
use Data'Dumper;
print Dumper
---
debug print
iii
ccc
use Data::Dumper;

@A = qw(a b c);
print Dumper @A
ooo
$VAR1 = 'a';
$VAR2 = 'b';
$VAR3 = 'c';
iii
ccc
use Data::Dumper;

@A = qw(a b c);
print Dumper \@A # list reference
ooo
$VAR1 = [
          'a',
          'b',
          'c'
        ];
***
print STDERR
---
print text to stderr
iii
ccc
@A = qw(1 2 3);
print STDERR "hi", @A
***
print + nice, 3
---
use + to print bareword instead of trying to print at filehandle (must have something after)
***
reverse @A 
---
reverse @A as a list
***
~~ reverse $S
---
reverse $S as a scalar
iii
ccc
$S = "fall";
print ~~ reverse $S
ooo
llaf
iii
ccc
$S = "fall";
print $S . reverse $S # dont need inchworm if you cast to scalar in other ways
ooo
fallllaf
***
-+- $S
---
convert $S to a number (high precedence)
iii
ccc
print -+- "5bruh" x 5
ooo
55555
***
print + (1 + 2), 3
---
decrease function precedence with +
iii
ccc
$a = "cool";
$b = "beans";
print substr + ($a .= "a$b"), 3
ooo
labeans
***
$S + 0
---
convert $S to a number
iii
ccc
print "34" + 0
ooo
34
iii
ccc
print "   34bruh" + 0
ooo
34
iii
ccc
print " -34.5bruh" + 0
ooo
-34.5
iii
ccc
print " -.5bruh" + 0
ooo
-0.5
iii
ccc
print "bruh" + 0
ooo
0
iii
ccc
print "-    5bruh" + 0
ooo
0
***
(1 x $N) !~ /^1?$|^(11+?)\1+$/
---
abigails regex: check if $N is prime
***
2 == grep $' % $_ < 1, $N =~ // .. $N
# 2==grep$'%$_<1,//..$_
---
check if $N is prime
iii
ccc
print join $/, grep {2 == grep $' % $_ < 1, // .. $_} 1..10
ooo
2
3
5
7
***
#!perl -l
---
set $\ to "\n" by default or chr of octal number and chomp every input when paired with -p
iii
ccc
#!perl -l40
print "[3]";
print "[5]"; # trailing space
ooo
[3] [5] 
iii
ccc
#!perl -l
print "hi";
print "bruh"
ooo
hi
bruh
iii
they
are
magically
delicious
ccc
#!perl -lp
$_ = "[$_]"
ooo
[they]
[are]
[magically]
[delicious]
***
#!perl -00
---
paragraph mode (sets $/ to '' and reads input delimited by '\n\n')
iii
a
chicken

b
ccc
#!perl -00
use Data::Dumper;
print Dumper <>;
print Dumper <>;
ooo
$VAR1 = '5
4weraer

';
$VAR2 = 'rwerawer
awe';
***
#!perl -0
---
0 flag (sets $/ to '' or chr of octal number)
iii
a
b
c
ccc
#!perl -0
print '[', <>, ']'
ooo
[a
b
c]
iii
32978349234 5 3
ccc
#!perl -p040
# -p flag and 040 => " "
$_ = <> * <>
ooo
15
***
#!perl -a
---
like -n but will also split the input on /\s+/ and store into @F
iii
a   b c
chicken  1 2       3
ccc
#!perl -a
print "[@F]\n"
ooo
a b c
chicken 1 2 3
***
#!perl -F
---
like -n but will also split the input on // or custom regex and store into @F
iii
1 a
2
ccc
#!perl -F
print Dumper @F
ooo
$VAR1 = '1';
$VAR2 = ' ';
$VAR3 = 'a';
$VAR4 = '
';
$VAR1 = '2';
iii
2awja5fe3
zz2r3zz
ccc
#!perl -F/\D+/
print join(",", @F), $/
ooo
1,5,3
,2,3
iii
2awja5fe3
zz2r3zz
ccc
#!perl -F\D+
# can omit the // if you dont have spaces in the regex
print join(",", @F), $/
ooo
1,5,3
,2,3
***
#!perl -p
---
printing loop flag (shebang must be on first line)
iii
ccc
# equivalent code
while ($_ = <>) {
CODE
;; # double semicolon on next line significant on codingame >:(
print 
}
iii
ccHhiICckKEeNn
wwwwow
ccc
#!perl -p
s/(.)\1+/length($&) . $1/eg
ooo
2cHhiICckKEeNn
4wow
iii
ccc
#!perl -p
@; = qw(1 2 3);
# remember that semicolon?
$_ = @
ooo
3
iii
1+1
2+2
3+5
ccc
#!perl -p
@; = sort {$b-$a} @;, eval }{ ($_) = @
ooo
8
iii
aa bruh
bruhz
ccc
#!perl -p
# codingame inserts newline at and no re flags so very niche
s;bruh;wow
ooo
aa wow

wow 
z
iii
chicken
finger
ccc
#!perl -p
# ignores extra sub so bit more useful
y;chi;ihc
ooo
ihciken
fcnger
---
3
***
split
---
split string on a delimiter (usually if glob doesn't work)
iii
a b c
ooo
print join $/, split $", <>
ccc
a
b
c
iii
a,b,c
ccc
$_ = <>;
print join $/, split /,/ # implicit last argument $_
ooo
a
b
c
iii
a b c
ccc
$_ = <>;
print join $/, split # with no arguments works like glob but works with special chars
ooo
a
b
c
***
$C ^ $"
---
swap case of character $C (char must be alphabetic)
iii
abVcDS
ccc
print $_ ^ $" for <> =~ /./g
ooo
ABvCds
***
pack "H*", $A
---
convert a hex string $A into regular string
iii
ccc
print pack "H*", "616263"
ooo
abc
***
unpack "%C*", $A
---
sum of ord of each char in $A
***
unpack "%B*", $A
---
number of 1 in binary representation of string $A
***
unpack "(A$N)*", $A
---
split string $A into chunks of $N
iii
ccc
$_ = "bruh";
print join $/, unpack "(A2)*" # default last arg is $_
ooo
br
uh
***
for
---
for loop
iii
ccc
for ($i = 0; $i < 5; $i++) {
  print $i, $/
}
ooo
0
1
2
3
4
iii
ccc
for (0..4) {
  print $_, $/ # $_ is default for loop var
}
ooo
0
1
2
3
4
iii
ccc
print $_, $/ for 0..4 # one line for
ooo
0
1
2
3
4
***
grep {
  //;
  grep ($' % $_ < 1, 50..$') % 2
} @A
---
short nested grep
***
//, map print $' * $_, @A for 1..5
---
short nested for loop
***
map {
  //; # save outer $_ to $' (post match)
  print $' + $_, $/ for 1..5
} @A
---
short nested map
***
map
---
apply function to each value of a list
iii
ccc
@A = (1, 2, 3);
@A = map {$_ * 2 + 1} @A # $_ is default map var
print join $/, @A
ooo
3
5
7
iii
ccc
@A = (1, 2, 3);
@A = map $_ * 2 + 1, @A # comma variation (only use with one statement)
print join $/, @A
ooo
3
5
7
***
eval $N =~ s/\B/+/gr
---
digit sum of $N
iii
ccc
$_ = 123;
print eval s/\B/+/gr
ooo
6
***
($% / 2) - ($% < 0) / 2
---
floor divide $% by 2 (must use $%)
***
$A >> $n 
---
floor divide positive number $A by 2 ** $n
iii
ooo
$A = 5;
print $A >> 1
ccc
2
iii
ooo
$A = 20;
$A >>= 2;
print $A
ccc
5
***
sprintf "%0${L}d", $B
---
left pad $B string with $L length minimum
***
~~@A
---
length of @A
iii
ccc
@A = qw(a b c);
print ~~@A
ooo
3
iii
ccc
@A = qw(a b c);
$l = @A; # dont need inchworm if you cast to scalar in other ways
print $l
ooo
3
iii
ccc
@A = qw(a b c);
print @A + 5
ooo
8
***
and
---
low precendence logical and
iii
1
2
5
6
ccc
$_ % 2 and $x += $_, $- += $x for <>;
print $-
ooo
7
***
or
---
low precedence logical or
iii
1
2
5
6
ccc
$_ % 2 or $x += $_, $- += $x for <>;
print $-
ooo
10
***
$A =~ s/ *$//
---
trim trailing space from $A
***
v98.114.117.104
---
v string
iii
50
ccc
print 1e9.<>^v1
ooo
000000000050
iii
ccc
print s00bruh0r x10for v10
ooo
bruh
bruh
bruh
bruh
bruh
bruh
bruh
bruh
bruh
bruh
***
sub add {
  my ($A, $B) = @_
  $A + $B
}

$C = add 5, 3
---
function / subroutine
***
$A ? $B : $C
---
ternary operator
iii
1
2
0
4
0
21
0
4
ccc
$_ ? $a : $b += ($z += $_) for <>; # lvalue ($_ ? $a : $b) += ($z += $_)
print $a * $b
ooo
148
***
$_ = eval s!\B!*!gr while /../
---
product of digits of $_ until it's less than 10
***
$A =~ s/(.)(.)/$2$1/g
---
swap every 2 chars of $Z
iii
badcfe
ccc
print <> =~ s/(.)(.)/$2$1/gr
ooo
abcdef
***
s///egirl
---
execute global insenstive-case return locale (joke egirl entry)
iii
hcciekn
ccc
print s/(.)(.)/"$2$1"/egirl
ooo
chicken
***
use POSIX;
print ~~ strtol "abc", 36
---
base conversion from a base containing `0-9a-z` (2-36) to decimal
***
for $i (0..5) {
  for $j (0..5) {
    print $i + $j, $/
  }
}
---
nested for loop with custom variable
***
%A
---
hash variable %A
iii
ccc
%A = qw(a b);
$A{"e"} = 5;
print keys %A # unordered
ooo
ea
iii
abcdefabvcbaddfba
ccc
$- += $H{$_}++ == 1 for <> =~ /./g;
print $-
ooo
5
***
@A
---
list variable @A
iii
ccc
@A = qw(a b c);
print @A
ooo
abc
iii
ccc
@A = qw(a b c);
print ~~@A # cast to scalar
ooo
3
***
$#A
---
dollactothorp: print the length of the @A - 1 (last index of @A)
iii
a b c d
ccc
#!perl -a
print $#F
ooo
3
***
~~<@A>
---
first item of list @A (only on first call, kind of like iterator)
iii
ccc
@A = qw(a b c);
print <@A> . $/
ooo
a
iii
ccc
@A = qw(a b c);
print <@A> . $/ for @A
ooo
a
b
c
iii
ccc
@a = (1,2);
print <@a> . $/ for 1..10 # cycles with empty element at the end of each
ooo
1
2

1
2

1
2

1
iii
ccc
@a = (1, 2);
{ # different block has different cycle
  $j = 0;
  print "[". <@a> . "]\n";
  {
    print ~~<@a>, $/;
    $j++ < 3 && redo
  };
  $i++ < 3 && redo
}
ooo
[1]
1
2

1
[2]
2

1
2
[]

1
2

[1]
1
2

1
***
A .. "`"
---
char range list
iii
ccc
print "@{['A' .. 'Z']}" 
ooo
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
***
${\map $A += $_, @A}
---
get the last element of a list expression
iii
1
2
3
ccc
print 2 * ${\map $A += $_, 1..$_}, $A = $/ for <>
ooo
2
6
12
***
@{[ 1 + 1 ]}
---
baby cart: regex / string interpolate the expression `1 + 1` as a list
iii
1 2 3
ccc
@A = glob <>;
print "@{[map $_ + 1, @A]}"
ooo
2 3 4
iii
ccc
$_ = 6;
print /@{[3 + 3]}/ ? "yes" : "no"
ooo
yes
***
$A . $B
---
string concatenate $A and $B
***
eval "\$S =~ y/$A/$B/"
---
transliterate / translate $S with variable input chars $A and output $B
iii
w
d
ccc
$_ = "wow";
$a = <>;
$b = <>;
eval "y/$a/$b/";
print
ooo
dod
***
-($A < 0) + int $A
---
floor a positive / negative number
***
$A | 0
---
floor a positive number $A
***
$A + .5 | 0
---
round a positive number $A
***
sprintf "%.f", $_
---
round a positive / negative number
***
$_=$_%2?3*$_+1:$_/2|<>,$z++while$_-1
---
store number of values of the collatz sequence of <> into $z
***
$\ += $_ + <@B> for @A
---
zip sum of two lists @A and @B and store result in $\
***
@_
---
subroutine argument list
iii
ccc
sub F {
  my ($a, $b) = @_; # "my" keyword denotes local var
  $a < 1 and return $b;

  F int $a / 2, $b * 2
}

print F 5, 2;
ooo
16
***
print
---
print something with arguments delimited by $, and ending with $\
iii
ccc
@A = qw(1 2 3);
$, = "+";
print @A
ooo
1+2+3
iii
ccc
print "bruh", "nice"
ooo
bruhnice
iii
ccc
$\ = "wow";
$, = "chicken";
print 3, 5
ooo
3chicken5wow
ccc
***
substr $S, $A
---
substring of string $S starting from index $A
***
substr $S, $A, $B
---
substring of length $B of string $S starting from index $A
iii
ccc
print substr "abcdefgasdfsdf", 6, 2
ooo
ga
iii
ccc
print substr "abcdefgasdfsdf", 6, -2 # up to the -2 index
ooo
gasdfs
***
1 .. $n
---
range from 1 to $n inclusive
***
# ($`, $') = split $", <>;
<> =~ $"
---
split $" seperated line once into 2 variables $` and $' respectively
***
# chomp($` = <>); $' = `dd`;
`dd` =~ $/
---
split $/ seperated all of input into $` and $'
***
vec
---
treat string as bit vector
iii
ccc
$a = "abc";
print vec $a, 0, 8; # 8 bits offset of 0 chunks of 8 bits kinda like ord(($a =~ /./g)[0]) in this case
ooo
97
iii
ccc
printf "%b\n", ord n;
print vec "n", $_, 1 for 1..7
ooo
1101110
1110110
***
$A x $B
---
string multiplication of $A by $B
***
sqrt
---
low precedence square root
iii
ccc
$x = 256;
print sqrt $x ** .5
ooo
***
oct
---
convert binary (base 2) or octal (base 8) string to decimal
iii
ccc
$B = "1010";
print oct "b$B"
ooo
10
iii
ccc
$B = "1010";
print oct b . $B # bareword
ooo
10
iii
ccc
$B = "10";
print oct $B
ooo
8
***
hex
---
convert hexadecimal (base 16) string to decimal
iii
ccc
$B = "10";
print oct "b$B"
ooo
16
ccc
***
printf
---
print values after applying format
iii
ccc
printf "%02d:02d", 5, 32;
ooo
05:32
iii
5
ccc
printf "%b", <>
ooo
101
iii
8
ccc
printf "%o", <>
ooo
10
iii
15
ccc
printf "%x", <>
ooo
f
***
sprintf
---
return value of printf
iii
5
ccc
print sprintf("%b", <>) =~ y/0//
ooo
1
***
$_ = "we
go";
/^/; # might need this before if you used regex on $_
$T.=join("",/^./mg).$/while s///g
---
transpose $_ with \n seperated values and store in $T
***
$A = 3;
$B = 5;
print+(<i like   chicken >)[$A <=> $B];
---
3 way comparison with $A and $B
less last, equal earliest, greater goldilocks (give me a better last one lol)
***
@A = qw(i like chicken);
print $A[rand @A]
---
print a random value from a list
***
$_ = "12 43 5 -32 43 1";
s!\S+ !print $& - $', $/!ge
---
apply a function on each consecutive pair of space seperated pairs of values
***
$N = 10000;
$B = 10;
@D=(0)x!$N;
$D[@D]=$N%$B,$N=$N/$B|0while$N
---
store digits of $N in base $B into @D
***
use Math'BigInt bgcd;
$A = bgcd->from_base("chicken", 36);
$B = $A->to_base(36);
---
base conversion from a base containing `0-9a-z` (2-36)
***
use Math'BigInt bgcd;
$A = bgcd->from_base("chikenchikenchikenchiken", 6, "chiken");
$B = $A->to_base(6, "chiken");
---
base conversion from arbitrary base with specified base values
***
grep
---
filter a list by predicate
iii
1 2 3 4 5
ccc
print join $/, grep {$_ % 2} glob <> # $_ is default grep var
ooo
1
3
5
iii
1
2
3
4
5
ccc
print join $/, grep $_ % 2, <> # comma variation (only use with single statement)
ooo
1
3
5
***
sort
---
sort a list by string comparison by default or custom sort
iii
ccc
@A = (12, 21, 1, 31, 11111111111, 32);
print join $/, sort {$b cmp $a} @A # explicit reverse string sort
ooo
iii
ccc
print sort "hello" =~ /./g
ooo
ehllo
iii
ccc
@A = (1, 4, 3, 12);
print join $/, sort {$a - $b} @A
ooo
1
3
4
12
***
$A
---
scalar variable $A
iii
ccc
$A = 3;
print $A
ooo
3
iii
ccc
$A = "hi"; 
print $A .= "bruh"
ooo
hibruh
***
print"Hello, World!
"
---
Hello World program
***
/1/
---
check if there is a `1` in the string
iii
123
ccc
print <> =~ /1/ ? "one" : "no one"
ooo
one
iii
123
23
ccc
print /1/ ? "one" : "no one", $/ for <>
ooo
one
no one
***
`dd`
---
calls dd command from bash and returns scalar / list delimited by $/
iii
i like chicken
and chicken likes me
ccc
$A = `dd`;
print "[$A]"
ooo
[i like chicken
and chicken likes me]
iii
i like chicken
and chicken likes me
ccc
$/ = "l";
@A = `dd`;
print map {"[$_]"} @A
ooo
[i l][ike chicken
and chicken l][ikes me]
***
glob <>
---
split line of input on \s+ and remove empty values (won't work if any `}{*~` present)
***
use bigint;
$n = <>;
print bfac {$n*1}
---
print the factorial of $n as a bigint
***
$L = @A = qw(a b c);
sub c{c($_,@_)for"@_"+1..$L;push@C,"@{[map$A[$_-1],@_]}"x(@_<=$L)}c
---
get combinations of @A from length 1 to length $L of arr and store into @C
***
$L = @A = qw(a b c);
@P = map"@{[map$A[$_],/./g]}"x/^[0-$#A]{0,$L}$/,0..$$
---
get all permutations of @A from len 0 to length $L of arr and store into @P
***
/./g
---
list of chars
iii
bruh
ccc
print join $", <> =~ /./g
ooo
b r u h
iii
ccc
$_ = lc "BrUh";
print join $/, map ord, /./g
ooo
98
114
117
104
***
$A + $B
---
add $A to $B
iii
ccc
$a = 3;
$b = 5;
print $a + $b
ooo
8
iii
ccc
$a = 3;
$b = 5;
$c = $a + $b;
print $c
ooo
8
iii
ccc
$c = 3;
print $c + "5"
ooo
8
iii
ccc
$c = 3;
print $c + "5aaaa3"
ooo
8
iii
43aw
23
ccc
$c = 3;
print $c + <>
ooo
46
***
chr
---
character of the ascii value
iii
97
ccc
$_ = <>;
print chr
ooo
a
iii
ccc
$a = chr "97az32";
print $a
ooo
a
iii
100
98
97
ccc
print "a" . chr for <>
ooo
acabaa
***
ord
---
ascii value of character
iii
abc
ccc
$_ = <>;
print ord
ooo
97
iii
abc
ccc
print ord, $/ for <> =~ /./g
ooo
97
98
99
***
<>
---
stdin (list / scalar)
iii
1
2
3
ccc
print for <> # list context and preserves delimeter`,
ooo
1
2
3
iii
bruh
ccc
print $_, $/ for <> =~ /./g # scalar contex
ooo
b
r
u
h
iii
3
7
ccc
print <> * <>
ooo
21
iii
3 7
ccc
$/ = $";
print <> * <>
ooo
21
iii
bruh+bruh-cool
ccc
$/ = "+";
print $_, "
" for <> =~ /./g
ooo
b
r
u
h
+
***
$S =~ y///c
---
length of $S
iii
nice plate
ccc
$_ = <>;
print y///c
ooo
9
iii
nice plate
ccc
$a = <>;
print $a =~ y///c
ooo
9
***
$S =~ y/1//
---
count amount of `1` in string $S
iii
ccc
$_ = "chicken 1 chicken 2 123";
print y/1//
ooo
2
iii
ccc
$a = "chicken 1 chicken 2 123";
print $a =~ y/1//
ooo
2
