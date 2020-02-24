// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

calTotalPrice = function(){
	var ticket_price = $("#ticket_price").text();
	var available_seats = $("#available_seats").text();
	var selected_seats = $("#selected_seats").val();
	var coupon_price = $("#coupon_price").text();
	var gender_type = $("#gender_discout").attr("type")
	var actual_price = (ticket_price * selected_seats) - coupon_price;
	var discount_amount = 0;
	if (gender_type == "female") {
		discount_amount = (actual_price * 0.05)
	}
	var total_price = actual_price - discount_amount
	$("#total_price").text(total_price);
	$("#gender_discout").text(discount_amount * -1);
}

bookTicket = function(){
	var selected_seats = $("#selected_seats").val();
	var coupon_price = $("#coupon_price").text();
	var total_price = $("#total_price").text();
	var show_id = $("#time").attr("time_id");

	var data = {}
	data.booked_seats = $("#selected_seats").val();
	data.coupon_price = $("#coupon_price").text();
	data.amount = $("#total_price").text();
	data.movie_screen_id = $("#movie_screen").attr("movie_screen_id");
	
	$.ajax({
      type: 'POST',
      url: '/bookings/ticket_checkout',
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data){
      	if(data.status == 'success'){
        	alert("Ticket Booked Successfully!");
        	location.reload();
      	}else{
      		alert("Something went wrong!");	
      	}        
      },
      error: function(message){
      	alert("Something went wrong!");
      }
    });
}