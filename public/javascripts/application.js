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

function vote_slider(type, id, vote) {
  new Control.Slider('handle_' + type + '_' + id, 'track_' + type + '_' + id,
    {range:$R(0, 50), sliderValue:vote,
	  onSlide: function(value){
		$('current_value_' + type + '_' + id).innerHTML = Math.round(value)/10.0;
		$('fill_' + type + '_' + id).style.width = value;
		}, 
	  onChange:function(value){ new Ajax.Request('/ratings?rating%5Btarget_type%5D=' + capitalizeFirstLetter(type) + '&rating%5Btarget_id%5D=' + id + '&rating%5Bopinion%5D=' + value) }
	})
}

function capitalizeFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
