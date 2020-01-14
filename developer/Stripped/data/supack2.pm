 package supack2;


=head1 DOCUMENTATION

=head2 SYNOPSIS

 PACKAGE NAME:  SUPACK2 - pack segy trace data into 2 byte shorts		
 AUTHOR: Juan Lorenzo
 DATE:   
 DESCRIPTION:
 Version: 

=head2 USE

=head3 NOTES

=head4 Examples

=head3 SEISMIC UNIX NOTES

 SUPACK2 - pack segy trace data into 2 byte shorts		

 supack2 <segy_file >packed_file	gpow=0.5 		

 Required parameters:						
	none							

 Optional parameter: 						
	gpow=0.5	exponent used to compress the dynamic	
			range of the traces			


 Credits:
	CWP: Jack K. Cohen, Shuki Ronen, Brian Sumner

 Revised: 7/4/95  Stewart A. Levin  Mobil
          Changed encoding to ensure 2 byte length (short is
	    8 bytes on Cray).

 Caveats:
	This program is for single site use.  Use segywrite to make
	a portable tape.

	We are storing the local header words, ungpow and unscale,
	required by suunpack2 as floats.
	
 Notes:
	ungpow and unscale are defined in segy.h
	trid = SHORTPACK is defined in su.h and segy.h

 Trace header fields accessed: ns
 Trace header fields modified: ungpow, unscale, trid

=head2 CHANGES and their DATES

=cut
 use Moose;
 our $VERSION = '0.0.1';
	use L_SU_global_constants();

	my $get					= new L_SU_global_constants();

	my $var				= $get->var();
	my $empty_string    	= $var->{_empty_string};


	my $supack2		= {
		_gpow					=> '',
		_trid					=> '',
		_Step					=> '',
		_note					=> '',
    };


=head2 sub Step

collects switches and assembles bash instructions
by adding the program name

=cut

 sub  Step {

	$supack2->{_Step}     = 'supack2'.$supack2->{_Step};
	return ( $supack2->{_Step} );

 }


=head2 sub note

collects switches and assembles bash instructions
by adding the program name

=cut

 sub  note {

	$supack2->{_note}     = 'supack2'.$supack2->{_note};
	return ( $supack2->{_note} );

 }


=head2 sub clear

=cut

 sub clear {

		$supack2->{_gpow}			= '';
		$supack2->{_trid}			= '';
		$supack2->{_Step}			= '';
		$supack2->{_note}			= '';
 }


=head2 sub gpow 


=cut

 sub gpow {

	my ( $self,$gpow )		= @_;
	if ( $gpow ne $empty_string ) {

		$supack2->{_gpow}		= $gpow;
		$supack2->{_note}		= $supack2->{_note}.' gpow='.$supack2->{_gpow};
		$supack2->{_Step}		= $supack2->{_Step}.' gpow='.$supack2->{_gpow};

	} else { 
		print("supack2, gpow, missing gpow,\n");
	 }
 }


=head2 sub trid 


=cut

 sub trid {

	my ( $self,$trid )		= @_;
	if ( $trid ne $empty_string ) {

		$supack2->{_trid}		= $trid;
		$supack2->{_note}		= $supack2->{_note}.' trid='.$supack2->{_trid};
		$supack2->{_Step}		= $supack2->{_Step}.' trid='.$supack2->{_trid};

	} else { 
		print("supack2, trid, missing trid,\n");
	 }
 }


=head2 sub get_max_index
 
max index = number of input variables -1
 
=cut
 
  sub get_max_index {
 	my ($self) = @_;
	# only file_name : index=36
 	my $max_index = 36;
	
 	return($max_index);
 }
 
 
1; 