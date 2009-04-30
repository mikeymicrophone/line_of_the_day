function make_publishable(group_id) {
	$('publishable-groups').update($('publishable-groups').innerHTML + ' ' + group_id);
}

function hotness_slider(type, id) {
  new Control.Slider('handle_' + type + '_' + id, 'track_' + type + '_' + id,
    {range:$R(0, 100), sliderValue:0,
	    onSlide: function(value){
	    $('current_value_' + type + '_' + id).innerHTML = Math.round(value) / 10.0;
	    $('fill_' + type + '_' + id).style.width = value;
    }
  })
}