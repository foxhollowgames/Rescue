function sc_set_time_stop() 
{
    var _fx_tint = fx_create("_filter_tintfilter");
	fx_set_parameter(_fx_tint, "g_TintCol", [1, 0, 0, 1]);
	layer_set_fx("Background", _fx_tint);
	sc_stop_scroll();
}