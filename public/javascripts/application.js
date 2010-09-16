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

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function update_per_page(count) {
	$$('.per_page_count').each(function(s){s.innerHTML = count});
	$$('.per_page_slider').each(function(s){s.value = count});
	$$('.sort, .pagination a, .refresh').each(function(s) {
		var params = s.href.toQueryParams();
		params['per_page'] = count;
		s.href = s.href.split('?')[0].concat('?' + Object.toQueryString(params));
	});
}

function ajaxify_links() {
	$$('.sort, .pagination a, .refresh').each(function(s) {
		Event.observe(s, 'click', function(event) {
			new Ajax.Updater('big_box', this.href, {method: 'get', onComplete: ajaxify_links});
			event.stop();
		});
	});
}

document.observe('dom:loaded', function() {
	ajaxify_links();
	Event.observe($('login'), 'click', function(event) {
		new Effect.SlideDown('login_space');
		event.stop();
	});
})
