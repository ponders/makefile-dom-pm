# Description:
#    The following test creates a makefile to test comments
#    and comment continuation to the next line using a 
#    backslash within makefiles.
#
# Details:
#    To test comments within a makefile, a semi-colon was placed 
#    after a comment was started.  This should not be reported as
#    an error since it is within a comment.  We then continue the 
#    comment to the next line using a backslash.  To test whether
#    the comment really continued, we place an echo command with some
#    text on the line which should never execute since it should be 
#    within a comment


use t::Gmake;

plan tests => 3 * blocks() - 1;

run_tests;

__DATA__

=== TEST 1:
--- source
# Test comment vs semicolon parsing and line continuation
target: # this ; is just a comment \
	@echo This is within a comment. 
	@echo There should be no errors for this makefile.

--- stdout
There should be no errors for this makefile.

--- stderr

