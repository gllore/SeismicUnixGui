package clean;

=head1 DOCUMENTATION

=head2 SYNOPSIS 
program restores work area
to pre-testing state

 PERL module NAME: clean.pm
 AUTHOR: 	Juan Lorenzo
 DATE: 		May 1 2021

DESCRIPTION 
For testing perl scripts in:
demos and Servilleta_demos

 BASED ON:

=cut

=head2 USE

=head3 NOTES

=head4 Examples


=head2 CHANGES and their DATES

=cut 

use Moose;
our $VERSION = '0.0.1';

# L_SU is a global variable for locating the  main folder

sub get_instructions {
	my ($self) = @_;

	# L_SU is a global variable for locating the  main folder
	my $L_SU = $ENV{'L_SU'};

	my $username = 'tester';
	my ( @instruction, @message );

	if ( not length($L_SU) ) {

		print "global variable L_SU must be set";
		print "e.g. in .bashrc: ";
		print " export L_SU=/usr/local/pl/L_SU ";

	} else {
#		print("\$L_SU = $L_SU \n");
	}

	my $PATH = $L_SU . '/t';

	$instruction[0] = ( "getent passwd $username > /dev/null		\
									if [ \$\? -eq 0 ]; then									\
    								    sudo /usr/sbin/userdel -r $username   	\
									else																\
    									echo \"No, the user does not exist\"		\
									fi");
									
	$instruction[1]  = ("DIR=$PATH . '/' . $username                     \
									if [ -d \"\$HOME\" ]                                   \
									then echo \"rm -rf \$DIR.\"                  \
									rm -rf \$DIR                                         \
									else echo \"\$DIR does not exist\"       \
									fi");

	$message[0] = ("   \nclean.pm\n    Clean any pre-existing account information and files belonging to 'tester'\n");
	$message[1] = ("   Remove directory belonging to 'tester'");
	
	return ( \@message, \@instruction );

}

1;