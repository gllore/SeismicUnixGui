package sustkvel_changes;

=head2 SYNOPSIS

PACKAGE NAME: sustkvel_changes

AUTHOR:  

DATE:

DESCRIPTION:

Version:

=head2 USE

=head3 NOTES

=head4 Examples

=head2 SYNOPSIS

=head2 CHANGES and their DATES

=cut

use Moose;
our $VERSION = '0.0.1';

=head2 Import packages

=cut

use L_SU_global_constants();
use SeismicUnix qw ($bin $ps $segy $su $suffix_bin $suffix_ps 
$suffix_segy $suffix_su $suffix_txt $txt);
use Project_config;

=head2 instantiation of packages

=cut

my $get					= new L_SU_global_constants();
my $Project				= new Project_config();
my $DATA_SEISMIC_SU		= $Project->DATA_SEISMIC_SU();
my $DATA_SEISMIC_BIN	= $Project->DATA_SEISMIC_BIN();
my $DATA_SEISMIC_TXT	= $Project->DATA_SEISMIC_TXT();
my $PS_SEISMIC      	= $Project->PS_SEISMIC();

my $var				= $get->var();
my $on				= $var->{_on};
my $off				= $var->{_off};
my $true			= $var->{_true};
my $false			= $var->{_false};
my $empty_string	= $var->{_empty_string};

sub changes {
	my ($self) = @_;
	
	my $result;
	my $aref;
	my ($label_aref, $suffix_type_aref,$directory_type_aref);
	my @array;
	my (@label, @suffix_type, @directory_type);
	
	$label_aref 			= \@label;
	$suffix_type_aref 		= \@suffix_type;
	$directory_type_aref 	= \@directory_type;
	
	@array = ($label_aref, $suffix_type_aref,$directory_type_aref);
	
	$result = $aref;
	
	return ($result);
}
