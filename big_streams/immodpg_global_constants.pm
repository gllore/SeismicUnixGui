package immodpg_global_constants;

use Moose;

=head private hash
similar names as the variables in immodpg.for
in the DICTIONARY ~ line 55
and also in moveNzoom.for

=cut

my $var = {
	_Vbot_file							=> 'Vbot', 
	_Vbot_minus_opt						=> 21,
	_Vbot_plus_opt						=> 22,
	_Vbot_upper_layer_file				=> 'Vbot_upper_layer', 	
	_VbotNVtop_lower_layer_plus_opt		=> 62,
    _VbotNVtop_lower_layer_minus_opt	=> 61,	
	_VbotNtop_minus_opt					=> 41,
	_VbotNtop_plus_opt					=> 42,
	_Vincrement_file					=> 'Vincrement',
	_Vincrement_opt						=> 7,
	_Vtop_file							=> 'Vtop',
	_Vtop_lower_layer_file				=> 'Vtop_lower_layer',						
    _Vtop_minus_opt						=> 12,
	_Vtop_plus_opt						=> 13,
    _VbotNtop_factor_file               => 'VbotNtop_factor',
    _VbotNtop_multiply_file             => 'VbotNtop_multiply',   
	_VbotNtop_multiply_opt				=> 16,
	_VtopNVbot_upper_layer_minus_opt   	=> 51,
	_VtopNVbot_upper_layer_plus_opt   	=> 52,
	_changeVbot_opt						=> 20,
	_Vbot_opt						    => 20,	
	_changeVbot_upper_layer_opt		    => 23,
	_Vbot_upper_layer_opt				=> 23,	
	_changeVtop_lower_layer_opt			=> 11,	
	_Vtop_lower_layer_opt				=> 11,		
	_change_Vtop_opt					=> 10,
	_Vtop_opt							=> 10,	
	_changeVbotNtop_factor_opt			=> 68,
	_VbotNtop_factor_opt			    => 68,
	_change_default						=> 'no',
	_change_file						=> 'change',
	_change_layer_number_opt			=> 0,
	_change_thickness_opt				=> 14,
	_change_thickness_increment_opt		=> 15,	
	_clip_file							=> 'clip',
    _clip4plot_opt						=> 9,
    _config_file_format			        => '%-35s%1s%-20s',
    _config_file_format_clip			=> '%-35s%1s%-5.1f',
    _exit_opt							=> 99,
    _immodpg_model	                    => 'immodpg.out',
    _immodpg_model_file_text		    => 'model.txt',
    _layer_file							=> 'layer',
    _move_down_opt						=> 83, 
	_move_left_opt						=> 84,
	_move_up_opt						=> 81,
	_move_right_opt						=> 82,
	_multiply_velocities_by_constant_opt =>11,
    _option_file						=> 'option',
	_zoom_minus_opt						=> 86,
	_zoom_plus_opt						=> 85,
};


sub var {
	my ($self) = @_;
	
    return ($var);
}

1;