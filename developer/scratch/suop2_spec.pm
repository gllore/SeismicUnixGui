package suop2_spec;
	use Moose;
	our $VERSION = '0.0.1';

	use Project_config;
	use SeismicUnix qw ($su $suffix_su);
	use L_SU_global_constants;
	use suop2;

	my $get					= new L_SU_global_constants();
	my $Project 			= new Project_config;
	my $suop2			    = new suop2;

	my $var					= $get->var();

	my $empty_string    	= $var->{_empty_string};
	my $true      			= $var->{_true};
	my $false      			= $var->{_false};
	my $file_dialog_type	= $get->file_dialog_type_href();
	my $flow_type			= $get->flow_type_href();

	my $DATA_SEISMIC_SU  	= $Project->DATA_SEISMIC_SU();   # output data directory
	my $max_index           = $suop2->get_max_index();

	my $suop2_spec = {
		_DATA_DIR_IN		    => $DATA_SEISMIC_SU,
	 	_DATA_DIR_OUT		    => $DATA_SEISMIC_SU,
		_binding_index_aref	    => '',
	 	_suffix_type_in			=> $su,
		_data_suffix_in			=> $suffix_su,
		_suffix_type_out			=> $su,
	 	_data_suffix_out		=> $suffix_su,
		_file_dialog_type_aref	=> '',
		_flow_type_aref			=> '',
	 	_has_infile				=> $false,
	 	_has_pipe_in			=> $false,	
	 	_has_pipe_out           => $true,
	 	_has_redirect_in		=> $false,
	 	_has_redirect_out		=> $true,
	 	_has_subin_in			=> $false,
	 	_has_subin_out			=> $false,
	 	_is_data				=> $false,
		_is_first_of_2			=> $true,
		_is_first_of_3or_more	=> $true,
		_is_first_of_4or_more	=> $true,
	 	_is_last_of_2			=> $false,
	 	_is_last_of_3or_more	=> $false,
		_is_last_of_4or_more	=> $false,
		_is_suprog				=> $true,
	 	_is_superflow			=> $false,
	 	_max_index              => $max_index,
	};


=head2  sub _sub_binding_index_aref

=cut

 sub binding_index_aref {

	my $self 	= @_;

	my @index;

	$index[0]	= 0;   # first item is bound to DATA_DIR_IN
	$index[1]	= 1;   # second item is bound to DATA_DIR_IN
	
	$suop2_spec ->{_binding_index_aref} = \@index;
	return();

 }


=head2  sub file_dialog_type_aref

  type of dialog (Data, Flow, SaveAs) is needed by binding
  one type of dialog for each index

=cut

 sub file_dialog_type_aref {

	my $self 	= @_;

	my @type;

	$type[0]	= $file_dialog_type->{_Data};
	$type[1]	= $file_dialog_type->{_Data};

	$suop2_spec ->{_file_dialog_type_aref} = \@type;
	return();
 
 } 
 
 
=head2  sub flow_type_aref

=cut

 sub flow_type_aref {

	my $self 	= @_;

	my @type;

	$type[0]	= $flow_type->{_user_built};

	$suop2_spec ->{_flow_type_aref} = \@type;
	return();

 }


=head2 sub get_binding_index_aref

=cut

 sub get_binding_index_aref{

	my $self 	= @_;
	my @index;

	if ($suop2_spec->{_binding_index_aref} ) {

		my $index_aref = $suop2_spec->{_binding_index_aref};
		return($index_aref);

	} else {
		print("suop2_spec, get_binding_index_aref, missing binding_index_aref\n");
		return();
	}

	my $index_aref = $suop2_spec->{_binding_index_aref};

 }


=head2 sub get_binding_length

=cut

 sub get_binding_length{

	my $self 	= @_;

	if ($suop2_spec->{_binding_index_aref} ) {

		my $binding_length= scalar @{$suop2_spec->{_binding_index_aref}};
		return($binding_length);

	} else {
		print("suop2_spec, get_binding_length, missing binding_length\n");
		return();
	}

	return();
 }


=head2 sub get_file_dialog_type_aref

=cut

 sub get_file_dialog_type_aref{

	my $self 	= @_;
	if ($suop2_spec->{_file_dialog_type_aref} ) {

		my $index_aref = $suop2_spec->{_file_dialog_type_aref};
		return($index_aref);

	} else {
		print("suop2_spec, get_file_dialog_type_aref, missing get_file_dialog_type_aref\n");
		return();
	}

	return();
 }


=head2 sub get_flow_type_aref

=cut

 sub get_flow_type_aref {

	my $self 	= @_;

	if ($suop2_spec->{_flow_type_aref} ) {

			my $index_aref = $suop2_spec->{_flow_type_aref};
			return($index_aref);

	} else {
		print("suop2_spec, get_flow_type_aref, missing flow_type_aref\n");
		return();
	}

 }


=head2 sub get_prefix_aref

=cut

 sub get_prefix_aref {

	my $self 	= @_;

	if ($suop2_spec->{_prefix_aref} ) {

		my $prefix_aref= scalar @{$suop2_spec->{_prefix_aref}};
		return($prefix_aref);

	} else {
		print("suop2_spec, get_prefix_aref, missing prefix_aref\n");
		return();
	}

	return();
 }


=head2 sub get_incompatibles

=cut

 sub get_incompatibles{

	my $self 	= @_;
	my @needed;

	my @_need_both;

	my @_need_only_1;

	my @_none_needed;

	my @_all_needed;

	my $params = {

		_need_both			=> \@_need_both,
		_need_only_1		=> \@_need_only_1,
		_none_needed		=> \@_none_needed,
		_all_needed			=> \@_all_needed,

	};

	my @of_two					= ('xx','yy');
	push @{$params->{_need_only_1}}	,	\@of_two;

	my $len_1_needed			= scalar @{$params->{_need_only_1}};

	if ($len_1_needed >= 1) {

		for (my $i=0; $i < $len_1_needed; $i++) {

			print("suop2, get_incompatibles,need_only_1:  @{@{$params->{_need_only_1}}[$i]}\n");

		}

	} else {
		print("get_incompatibles, no incompatibles\n")
	}

	return($params);

 }


=head2 sub variables

return a hash array 
with definitions
 
=cut
 
 sub variables {
 	my ($self) = @_;
 	my $hash_ref = $suop2_spec;
 	return ($hash_ref);
 }

1;
