# Description:
#    Test the filter-out function.
#
# Details:
#    The makefile created in this test has two variables.  The
#    filter-out function is first used to discard names ending in
#    .o with a single simple pattern.  The second filter-out function
#    augments the simple pattern with three literal names, which are
#    also added to the text argument.  This tests an internal hash table
#    which is only used if there are multiple literals present in both
#    the pattern and text arguments.  The result of both filter-out
#    functions is the same single .elc name.


use t::Gmake;

plan tests => 3 * blocks();

run_tests;

__DATA__

=== TEST 1:
--- source
files1 := $(filter-out %.o, foo.elc bar.o lose.o)
files2 := $(filter-out foo.i bar.i lose.i %.o, foo.i bar.i lose.i foo.elc bar.o lose.o)
all: ; @echo $(files1) $(files2)

--- stdout
foo.elc foo.elc

--- stderr
--- error_code:  0

