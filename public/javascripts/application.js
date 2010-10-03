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
			show_activity_indicator();
			new Ajax.Updater('content_home', this.href, {method: 'get', onComplete: ajaxify_links, evalScripts: true});
			event.stop();
		});
	});
}

function transform_login_form(event) {
	new Effect.Appear($('sign_up_fields'));
	new Effect.Fade($('remember_box'));
	$('new_user_session').action = "/users";
	$('user_session_username').name = "user[username]";
	$('user_session_password').name = "user[password]";
	new Effect.Fade($('i_m_new'));
	$('login_button').src = "/images/join.png";
	new Effect.Appear($('terms_link'));
	event.stop();
}

function show_activity_indicator() {
	$$('.activity_indicator').each(Element.show);
}

function hide_activity_indicator() {
	$$('.activity_indicator').each(Element.hide);
}

function adjust_list_spacing(val) {
	$('list_spacer').setStyle({height:val * 14 + 'px'});
}

document.observe('dom:loaded', function() {
	ajaxify_links();
	Event.observe($('login'), 'click', function(event) {
		new Effect.SlideDown('login_space');
		event.stop();
	});
	$$('#navigation a, #footer a').each(function(s) {
		Event.observe(s, 'click', function(event) {
			show_activity_indicator();
			new Ajax.Updater('content_home', this.href, {method: 'get', onComplete: ajaxify_links, evalScripts: true});
			event.stop();
		});
	});
})
