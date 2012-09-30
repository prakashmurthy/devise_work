$(document).ready(function(){
    var edit_mode=false;
    $("#custom-status-button").click(function(){
      var that=$(this)
      if (edit_mode){
        var custom_status_value=$("#custom-status input").val();
        $.ajax({
          "type":"POST",
          "url":"/dashboard/update_custom_status",
          "data":{"status":custom_status_value},
          "success":function(){
            that.html("Modify Custom Status");
            edit_mode=false
            $("#custom-status").html( custom_status_value );
          }
        })
      }
      else{
        var custom_status_value=$("#custom-status").html();
        var text_field=$("<input type='text'>");
        text_field.attr( "value",custom_status_value ); 
        $("#custom-status").html( text_field );
        that.html("Set Custom Status");
        edit_mode=true
      }
    })
})

