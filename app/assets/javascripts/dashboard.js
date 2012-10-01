$(document).ready(function(){
    var edit_mode=false;
    $(".custom-status-button").click(function(evt){
      var btn=$(evt.target)
      var cell=btn.closest(".user-container").find(".custom-status");
      if (edit_mode){
        var custom_status_value=$(".custom-status input").val();
        $.ajax({
          "type":"POST",
          "url":"/dashboard/update_custom_status",
          "data":{"status":custom_status_value},
          "success":function(){
            btn.html("Modify Custom Status");
            edit_mode=false
            cell.html( custom_status_value );
          }
        })
      }
      else{
        var custom_status_value=cell.text();
        var text_field=$("<input type='text'>");
        text_field.attr( "value",custom_status_value ); 
        cell.html( text_field );
        btn.html("Set Custom Status");
        edit_mode=true
      }
    })
})

