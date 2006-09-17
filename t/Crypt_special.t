# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Crypt.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 2;

BEGIN { use Crypt::Lite; };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $c = Crypt::Lite->new(debug => 0, encoding => 'hex8');


$enc = $c->encrypt('a', 'b');
ok($c->decrypt($enc, 'b') eq 'a', 'Short text, short secret');


$enc = $c->encrypt('abcdef', '!*()*!');
ok($c->decrypt($enc, '!*()*!') eq 'abcdef', 'Using non alpha characters as passphrase');

sleep 1;
