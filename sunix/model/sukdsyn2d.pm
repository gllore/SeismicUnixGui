 package sukdsyn2d;


=head1 DOCUMENTATION

=head2 SYNOPSIS

 PACKAGE NAME:  SUKDSYN2D - Kirchhoff Depth SYNthesis of 2D seismic data from a	
 AUTHOR: Juan Lorenzo
 DATE:   
 DESCRIPTION:
 Version: 

=head2 USE

=head3 NOTES

=head4 Examples

=head3 SEISMIC UNIX NOTES

 SUKDSYN2D - Kirchhoff Depth SYNthesis of 2D seismic data from a	
             migrated seismic section					

   sukdsyn2d  infile  outfile [parameters] 				

 Required parameters: 							
 infile=stdin		input migrated section				
 outfile=stdout	file for output seismic traces  		
 ttfile		file for input traveltime tables		

 The following 9 parameters describe traveltime tables:		
 fzt= 			first depth sample 				
 nzt= 			number of depth samples 			
 dzt=			depth interval 					
 fxt=			first lateral sample 				
 nxt=			number of lateral samples 			
 dxt=			lateral interval 				
 fs=			x-coordinate of first source			
 ns=			number of sources				
 ds=			x-coordinate increment of sources		

 The following 6 parameters describe the migration section:		
 fz=                   first z-coordinate in migrated section 		
 dz=     		vertical spacing of migrated section 		
 nz=           	number of depth points in migrated section	
 fx=                   first x-coordinate of migrated section 		
 dx=     		horizontal spacing of migrated section 		
 nx=           	number of lateral points in migrated section  	

 Optional Parameters:							
 nt=501        	number of time samples				
 dt=0.004      	time sampling interval (sec)			
 ft=0.0        	first time (sec)				
 nxo=1                 number of source-receiver offsets		
 dxo=25                offset sampling interval  			
 fxo=0.0               first offset  					
 nxs=101               number of shotpoints  				
 dxs=25                shotpoint sampling interval  			
 fxs=0.0               first shotpoint 				
 fmax=1/(4*dt)         maximum frequency in migration section (Hz)	
 aperx=nxt*dxt/2  	modeling lateral aperature 			
 angmax=60		modeling angle aperature from vertical		
 v0=1500(m/s)		reference velocity value at surface		
 dvz=0.0  		reference velocity vertical gradient		
 ls=1	                flag for line source				
 jpfile=stderr		job print file name 				
 mtr=100  		print verbal information at every mtr traces	

 Notes:								
 This program takes a migrated seismic section and a set of travel time
 tables generated using rayt2d for a specific background velocity model
 and generates synthetic seismic data in the form of common shot gathers.
 (Common offset gathers may be generated by using nxo=1.) (Demigration.)

 This program is a tool which may be used for the migration residual	
 statics estimation technique of Tjan, Audebert, and Larner 1994.	

1. The traveltime tables are generated by program rayt2d (or other ones)
   on relatively coarse grids, with dimension ns*nxt*nzt. In the	
   modeling process, traveltimes are interpolated into shot/geophone 	
   positions and migration section grids. 				
2. The input migration section must be an array of binary floats (no SU
   headers).								", 
3. The synthesized traces are output in common-shot gathers in SU format.
4. The memory requirement for this program is about			
    	(ns*nxt*nzt+nx*nz+4*nr*nzt+3*nxt*nzt)*4 bytes 			
    where nr = 1+min(nxt*dxt,0.5*offmax+aperx)/dxo. 			


 Author:  CWP: Zhenyue Liu, 07/24/95,  Colorado School of Mines 

 References: 

 Tjan, T., F. Audebert, and K. Larner, 1994,
    Prestack migration for residual statics estimation in complex media
    (Appeared in 1994 Project Review, CWP-153.)

 Tjan, T., 1995, Residual statics estimation for data from structurally
    complex areas using prestack depth migration: M.Sc. thesis, Colorado
    School of Mines. (In progress.)

 Larner, K., and Tjan, T., 1995, Simultaneous statics and velocity
    estimation for data from structurally complex areas.
    (Appeared in 1995 Project Review, CWP-185.)


 Trace header fields set: ns, dt, delrt, tracl, tracr, fldr, tracf
                          offset, sx, gx, trid, counit


=head2 CHANGES and their DATES

=cut
 use Moose;
 our $VERSION = '0.0.1';
	use L_SU_global_constants();

	my $get					= new L_SU_global_constants();

	my $var				= $get->var();
	my $empty_string    	= $var->{_empty_string};


	my $sukdsyn2d		= {
		_angmax					=> '',
		_aperx					=> '',
		_ds					=> '',
		_dt					=> '',
		_dvz					=> '',
		_dx					=> '',
		_dxo					=> '',
		_dxs					=> '',
		_dxt					=> '',
		_dz					=> '',
		_dzt					=> '',
		_fmax					=> '',
		_fs					=> '',
		_ft					=> '',
		_fx					=> '',
		_fxo					=> '',
		_fxs					=> '',
		_fxt					=> '',
		_fz					=> '',
		_fzt					=> '',
		_infile					=> '',
		_jpfile					=> '',
		_ls					=> '',
		_mtr					=> '',
		_nr					=> '',
		_ns					=> '',
		_nt					=> '',
		_nx					=> '',
		_nxo					=> '',
		_nxs					=> '',
		_nxt					=> '',
		_nz					=> '',
		_nzt					=> '',
		_outfile					=> '',
		_v0					=> '',
		_Step					=> '',
		_note					=> '',
    };


=head2 sub Step

collects switches and assembles bash instructions
by adding the program name

=cut

 sub  Step {

	$sukdsyn2d->{_Step}     = 'sukdsyn2d'.$sukdsyn2d->{_Step};
	return ( $sukdsyn2d->{_Step} );

 }


=head2 sub note

collects switches and assembles bash instructions
by adding the program name

=cut

 sub  note {

	$sukdsyn2d->{_note}     = 'sukdsyn2d'.$sukdsyn2d->{_note};
	return ( $sukdsyn2d->{_note} );

 }


=head2 sub clear

=cut

 sub clear {

		$sukdsyn2d->{_angmax}			= '';
		$sukdsyn2d->{_aperx}			= '';
		$sukdsyn2d->{_ds}			= '';
		$sukdsyn2d->{_dt}			= '';
		$sukdsyn2d->{_dvz}			= '';
		$sukdsyn2d->{_dx}			= '';
		$sukdsyn2d->{_dxo}			= '';
		$sukdsyn2d->{_dxs}			= '';
		$sukdsyn2d->{_dxt}			= '';
		$sukdsyn2d->{_dz}			= '';
		$sukdsyn2d->{_dzt}			= '';
		$sukdsyn2d->{_fmax}			= '';
		$sukdsyn2d->{_fs}			= '';
		$sukdsyn2d->{_ft}			= '';
		$sukdsyn2d->{_fx}			= '';
		$sukdsyn2d->{_fxo}			= '';
		$sukdsyn2d->{_fxs}			= '';
		$sukdsyn2d->{_fxt}			= '';
		$sukdsyn2d->{_fz}			= '';
		$sukdsyn2d->{_fzt}			= '';
		$sukdsyn2d->{_infile}			= '';
		$sukdsyn2d->{_jpfile}			= '';
		$sukdsyn2d->{_ls}			= '';
		$sukdsyn2d->{_mtr}			= '';
		$sukdsyn2d->{_nr}			= '';
		$sukdsyn2d->{_ns}			= '';
		$sukdsyn2d->{_nt}			= '';
		$sukdsyn2d->{_nx}			= '';
		$sukdsyn2d->{_nxo}			= '';
		$sukdsyn2d->{_nxs}			= '';
		$sukdsyn2d->{_nxt}			= '';
		$sukdsyn2d->{_nz}			= '';
		$sukdsyn2d->{_nzt}			= '';
		$sukdsyn2d->{_outfile}			= '';
		$sukdsyn2d->{_v0}			= '';
		$sukdsyn2d->{_Step}			= '';
		$sukdsyn2d->{_note}			= '';
 }


=head2 sub angmax 


=cut

 sub angmax {

	my ( $self,$angmax )		= @_;
	if ( $angmax ne $empty_string ) {

		$sukdsyn2d->{_angmax}		= $angmax;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' angmax='.$sukdsyn2d->{_angmax};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' angmax='.$sukdsyn2d->{_angmax};

	} else { 
		print("sukdsyn2d, angmax, missing angmax,\n");
	 }
 }


=head2 sub aperx 


=cut

 sub aperx {

	my ( $self,$aperx )		= @_;
	if ( $aperx ne $empty_string ) {

		$sukdsyn2d->{_aperx}		= $aperx;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' aperx='.$sukdsyn2d->{_aperx};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' aperx='.$sukdsyn2d->{_aperx};

	} else { 
		print("sukdsyn2d, aperx, missing aperx,\n");
	 }
 }


=head2 sub ds 


=cut

 sub ds {

	my ( $self,$ds )		= @_;
	if ( $ds ne $empty_string ) {

		$sukdsyn2d->{_ds}		= $ds;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' ds='.$sukdsyn2d->{_ds};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' ds='.$sukdsyn2d->{_ds};

	} else { 
		print("sukdsyn2d, ds, missing ds,\n");
	 }
 }


=head2 sub dt 


=cut

 sub dt {

	my ( $self,$dt )		= @_;
	if ( $dt ne $empty_string ) {

		$sukdsyn2d->{_dt}		= $dt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dt='.$sukdsyn2d->{_dt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dt='.$sukdsyn2d->{_dt};

	} else { 
		print("sukdsyn2d, dt, missing dt,\n");
	 }
 }


=head2 sub dvz 


=cut

 sub dvz {

	my ( $self,$dvz )		= @_;
	if ( $dvz ne $empty_string ) {

		$sukdsyn2d->{_dvz}		= $dvz;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dvz='.$sukdsyn2d->{_dvz};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dvz='.$sukdsyn2d->{_dvz};

	} else { 
		print("sukdsyn2d, dvz, missing dvz,\n");
	 }
 }


=head2 sub dx 


=cut

 sub dx {

	my ( $self,$dx )		= @_;
	if ( $dx ne $empty_string ) {

		$sukdsyn2d->{_dx}		= $dx;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dx='.$sukdsyn2d->{_dx};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dx='.$sukdsyn2d->{_dx};

	} else { 
		print("sukdsyn2d, dx, missing dx,\n");
	 }
 }


=head2 sub dxo 


=cut

 sub dxo {

	my ( $self,$dxo )		= @_;
	if ( $dxo ne $empty_string ) {

		$sukdsyn2d->{_dxo}		= $dxo;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dxo='.$sukdsyn2d->{_dxo};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dxo='.$sukdsyn2d->{_dxo};

	} else { 
		print("sukdsyn2d, dxo, missing dxo,\n");
	 }
 }


=head2 sub dxs 


=cut

 sub dxs {

	my ( $self,$dxs )		= @_;
	if ( $dxs ne $empty_string ) {

		$sukdsyn2d->{_dxs}		= $dxs;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dxs='.$sukdsyn2d->{_dxs};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dxs='.$sukdsyn2d->{_dxs};

	} else { 
		print("sukdsyn2d, dxs, missing dxs,\n");
	 }
 }


=head2 sub dxt 


=cut

 sub dxt {

	my ( $self,$dxt )		= @_;
	if ( $dxt ne $empty_string ) {

		$sukdsyn2d->{_dxt}		= $dxt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dxt='.$sukdsyn2d->{_dxt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dxt='.$sukdsyn2d->{_dxt};

	} else { 
		print("sukdsyn2d, dxt, missing dxt,\n");
	 }
 }


=head2 sub dz 


=cut

 sub dz {

	my ( $self,$dz )		= @_;
	if ( $dz ne $empty_string ) {

		$sukdsyn2d->{_dz}		= $dz;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dz='.$sukdsyn2d->{_dz};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dz='.$sukdsyn2d->{_dz};

	} else { 
		print("sukdsyn2d, dz, missing dz,\n");
	 }
 }


=head2 sub dzt 


=cut

 sub dzt {

	my ( $self,$dzt )		= @_;
	if ( $dzt ne $empty_string ) {

		$sukdsyn2d->{_dzt}		= $dzt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' dzt='.$sukdsyn2d->{_dzt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' dzt='.$sukdsyn2d->{_dzt};

	} else { 
		print("sukdsyn2d, dzt, missing dzt,\n");
	 }
 }


=head2 sub fmax 


=cut

 sub fmax {

	my ( $self,$fmax )		= @_;
	if ( $fmax ne $empty_string ) {

		$sukdsyn2d->{_fmax}		= $fmax;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fmax='.$sukdsyn2d->{_fmax};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fmax='.$sukdsyn2d->{_fmax};

	} else { 
		print("sukdsyn2d, fmax, missing fmax,\n");
	 }
 }


=head2 sub fs 


=cut

 sub fs {

	my ( $self,$fs )		= @_;
	if ( $fs ne $empty_string ) {

		$sukdsyn2d->{_fs}		= $fs;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fs='.$sukdsyn2d->{_fs};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fs='.$sukdsyn2d->{_fs};

	} else { 
		print("sukdsyn2d, fs, missing fs,\n");
	 }
 }


=head2 sub ft 


=cut

 sub ft {

	my ( $self,$ft )		= @_;
	if ( $ft ne $empty_string ) {

		$sukdsyn2d->{_ft}		= $ft;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' ft='.$sukdsyn2d->{_ft};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' ft='.$sukdsyn2d->{_ft};

	} else { 
		print("sukdsyn2d, ft, missing ft,\n");
	 }
 }


=head2 sub fx 


=cut

 sub fx {

	my ( $self,$fx )		= @_;
	if ( $fx ne $empty_string ) {

		$sukdsyn2d->{_fx}		= $fx;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fx='.$sukdsyn2d->{_fx};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fx='.$sukdsyn2d->{_fx};

	} else { 
		print("sukdsyn2d, fx, missing fx,\n");
	 }
 }


=head2 sub fxo 


=cut

 sub fxo {

	my ( $self,$fxo )		= @_;
	if ( $fxo ne $empty_string ) {

		$sukdsyn2d->{_fxo}		= $fxo;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fxo='.$sukdsyn2d->{_fxo};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fxo='.$sukdsyn2d->{_fxo};

	} else { 
		print("sukdsyn2d, fxo, missing fxo,\n");
	 }
 }


=head2 sub fxs 


=cut

 sub fxs {

	my ( $self,$fxs )		= @_;
	if ( $fxs ne $empty_string ) {

		$sukdsyn2d->{_fxs}		= $fxs;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fxs='.$sukdsyn2d->{_fxs};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fxs='.$sukdsyn2d->{_fxs};

	} else { 
		print("sukdsyn2d, fxs, missing fxs,\n");
	 }
 }


=head2 sub fxt 


=cut

 sub fxt {

	my ( $self,$fxt )		= @_;
	if ( $fxt ne $empty_string ) {

		$sukdsyn2d->{_fxt}		= $fxt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fxt='.$sukdsyn2d->{_fxt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fxt='.$sukdsyn2d->{_fxt};

	} else { 
		print("sukdsyn2d, fxt, missing fxt,\n");
	 }
 }


=head2 sub fz 


=cut

 sub fz {

	my ( $self,$fz )		= @_;
	if ( $fz ne $empty_string ) {

		$sukdsyn2d->{_fz}		= $fz;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fz='.$sukdsyn2d->{_fz};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fz='.$sukdsyn2d->{_fz};

	} else { 
		print("sukdsyn2d, fz, missing fz,\n");
	 }
 }


=head2 sub fzt 


=cut

 sub fzt {

	my ( $self,$fzt )		= @_;
	if ( $fzt ne $empty_string ) {

		$sukdsyn2d->{_fzt}		= $fzt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' fzt='.$sukdsyn2d->{_fzt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' fzt='.$sukdsyn2d->{_fzt};

	} else { 
		print("sukdsyn2d, fzt, missing fzt,\n");
	 }
 }


=head2 sub infile 


=cut

 sub infile {

	my ( $self,$infile )		= @_;
	if ( $infile ne $empty_string ) {

		$sukdsyn2d->{_infile}		= $infile;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' infile='.$sukdsyn2d->{_infile};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' infile='.$sukdsyn2d->{_infile};

	} else { 
		print("sukdsyn2d, infile, missing infile,\n");
	 }
 }


=head2 sub jpfile 


=cut

 sub jpfile {

	my ( $self,$jpfile )		= @_;
	if ( $jpfile ne $empty_string ) {

		$sukdsyn2d->{_jpfile}		= $jpfile;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' jpfile='.$sukdsyn2d->{_jpfile};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' jpfile='.$sukdsyn2d->{_jpfile};

	} else { 
		print("sukdsyn2d, jpfile, missing jpfile,\n");
	 }
 }


=head2 sub ls 


=cut

 sub ls {

	my ( $self,$ls )		= @_;
	if ( $ls ne $empty_string ) {

		$sukdsyn2d->{_ls}		= $ls;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' ls='.$sukdsyn2d->{_ls};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' ls='.$sukdsyn2d->{_ls};

	} else { 
		print("sukdsyn2d, ls, missing ls,\n");
	 }
 }


=head2 sub mtr 


=cut

 sub mtr {

	my ( $self,$mtr )		= @_;
	if ( $mtr ne $empty_string ) {

		$sukdsyn2d->{_mtr}		= $mtr;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' mtr='.$sukdsyn2d->{_mtr};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' mtr='.$sukdsyn2d->{_mtr};

	} else { 
		print("sukdsyn2d, mtr, missing mtr,\n");
	 }
 }


=head2 sub nr 


=cut

 sub nr {

	my ( $self,$nr )		= @_;
	if ( $nr ne $empty_string ) {

		$sukdsyn2d->{_nr}		= $nr;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nr='.$sukdsyn2d->{_nr};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nr='.$sukdsyn2d->{_nr};

	} else { 
		print("sukdsyn2d, nr, missing nr,\n");
	 }
 }


=head2 sub ns 


=cut

 sub ns {

	my ( $self,$ns )		= @_;
	if ( $ns ne $empty_string ) {

		$sukdsyn2d->{_ns}		= $ns;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' ns='.$sukdsyn2d->{_ns};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' ns='.$sukdsyn2d->{_ns};

	} else { 
		print("sukdsyn2d, ns, missing ns,\n");
	 }
 }


=head2 sub nt 


=cut

 sub nt {

	my ( $self,$nt )		= @_;
	if ( $nt ne $empty_string ) {

		$sukdsyn2d->{_nt}		= $nt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nt='.$sukdsyn2d->{_nt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nt='.$sukdsyn2d->{_nt};

	} else { 
		print("sukdsyn2d, nt, missing nt,\n");
	 }
 }


=head2 sub nx 


=cut

 sub nx {

	my ( $self,$nx )		= @_;
	if ( $nx ne $empty_string ) {

		$sukdsyn2d->{_nx}		= $nx;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nx='.$sukdsyn2d->{_nx};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nx='.$sukdsyn2d->{_nx};

	} else { 
		print("sukdsyn2d, nx, missing nx,\n");
	 }
 }


=head2 sub nxo 


=cut

 sub nxo {

	my ( $self,$nxo )		= @_;
	if ( $nxo ne $empty_string ) {

		$sukdsyn2d->{_nxo}		= $nxo;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nxo='.$sukdsyn2d->{_nxo};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nxo='.$sukdsyn2d->{_nxo};

	} else { 
		print("sukdsyn2d, nxo, missing nxo,\n");
	 }
 }


=head2 sub nxs 


=cut

 sub nxs {

	my ( $self,$nxs )		= @_;
	if ( $nxs ne $empty_string ) {

		$sukdsyn2d->{_nxs}		= $nxs;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nxs='.$sukdsyn2d->{_nxs};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nxs='.$sukdsyn2d->{_nxs};

	} else { 
		print("sukdsyn2d, nxs, missing nxs,\n");
	 }
 }


=head2 sub nxt 


=cut

 sub nxt {

	my ( $self,$nxt )		= @_;
	if ( $nxt ne $empty_string ) {

		$sukdsyn2d->{_nxt}		= $nxt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nxt='.$sukdsyn2d->{_nxt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nxt='.$sukdsyn2d->{_nxt};

	} else { 
		print("sukdsyn2d, nxt, missing nxt,\n");
	 }
 }


=head2 sub nz 


=cut

 sub nz {

	my ( $self,$nz )		= @_;
	if ( $nz ne $empty_string ) {

		$sukdsyn2d->{_nz}		= $nz;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nz='.$sukdsyn2d->{_nz};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nz='.$sukdsyn2d->{_nz};

	} else { 
		print("sukdsyn2d, nz, missing nz,\n");
	 }
 }


=head2 sub nzt 


=cut

 sub nzt {

	my ( $self,$nzt )		= @_;
	if ( $nzt ne $empty_string ) {

		$sukdsyn2d->{_nzt}		= $nzt;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' nzt='.$sukdsyn2d->{_nzt};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' nzt='.$sukdsyn2d->{_nzt};

	} else { 
		print("sukdsyn2d, nzt, missing nzt,\n");
	 }
 }


=head2 sub outfile 


=cut

 sub outfile {

	my ( $self,$outfile )		= @_;
	if ( $outfile ne $empty_string ) {

		$sukdsyn2d->{_outfile}		= $outfile;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' outfile='.$sukdsyn2d->{_outfile};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' outfile='.$sukdsyn2d->{_outfile};

	} else { 
		print("sukdsyn2d, outfile, missing outfile,\n");
	 }
 }


=head2 sub v0 


=cut

 sub v0 {

	my ( $self,$v0 )		= @_;
	if ( $v0 ne $empty_string ) {

		$sukdsyn2d->{_v0}		= $v0;
		$sukdsyn2d->{_note}		= $sukdsyn2d->{_note}.' v0='.$sukdsyn2d->{_v0};
		$sukdsyn2d->{_Step}		= $sukdsyn2d->{_Step}.' v0='.$sukdsyn2d->{_v0};

	} else { 
		print("sukdsyn2d, v0, missing v0,\n");
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