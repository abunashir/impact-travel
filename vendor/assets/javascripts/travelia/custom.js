jQuery(document).ready(function() {
  // top banner
  jQuery('.tp-banner').show().revolution({
    dottedOverlay:"none",
    delay:9000,
    startwidth:1170,
    startheight:925,
    minHeight:500,
    navigationType:"none",
    navigationArrows:"solo",
    navigationStyle:"preview1"
  });

  // check in and checkout datepicker
  jQuery("#search_check_out").datepicker({dateFormat: "dd/mm/yy" });
  jQuery("#search_check_in").datepicker({
    dateFormat: "dd/mm/yy",
    minDate:  0,
    onSelect: function(date){
      var date1 = jQuery("#search_check_in").datepicker("getDate")
        var date = new Date( Date.parse( date1 ) );
      date.setDate( date.getDate() + 1 );
      var newDate = date.toDateString();
      newDate = new Date( Date.parse( newDate ) );
      jQuery("#search_check_out").datepicker("option","minDate",newDate)
    }
  });

  // reset form filter
  jQuery('#filter_form_reset').on('click',function(){
    event.preventDefault();
    // reset the checkboxes and input field
    jQuery('input[type="checkbox"]').each(function(){ this.checked = false; });
    jQuery("input.custom_style").val("");
  });

  // submit sort filtering form
  jQuery("#results_sort_from select").on("change", function(){
    var selector = jQuery(this);
    // var sort  = jQuery(this).data("sort");
    // var value = jQuery(this).val();

    jQuery("#sort_param_name").val(selector.data("sort"));
    jQuery("#sort_param_order").val(selector.val());

    jQuery(this).closest('form').submit();
  });
  //Footer currency and country dropdown
    $('#currency-drop').click(function(){
        $('#language').hide();
        $("#language-drop button").removeClass('btn-active');
        $('#currency').show();
        $("#currency-drop button").addClass('btn-active');
    });
    $('#language-drop').click(function(){
        $('#currency').hide();
        $("#currency-drop button").removeClass('btn-active');
        $('#language').show();
        $("#language-drop button").addClass('btn-active');
    });
});

