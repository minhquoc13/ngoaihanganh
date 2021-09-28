$('#btn-search').click(function(event) {
	if ($('input[name=keyword]').val().length == 0) {
		event.preventDefault();
	}
});
