// Render HTML code for an order summary
function order_summary(order_object) {
  	var x, y;
	var subtotal_str;

	if (order_object.price_level == "free") {
		x= 0;
		subtotal_str = "Subtotal: This order is free";
	} else {
		if (order_object.price_level == "discount") {
			x =  order_object.price - (order_object.discount_percentage * order_object.price);
		} else if (order_object.price_level == "sale") {
			x =  order_object.price - order_object.markdown;
		} else {
			x = order_object.price;
		}
		subtotal_str = "Subtotal: $" + x;
	}

	if (order.taxes_applicable == true) {
		y = order_object.tax;
	} else {
		y = 0;
	}

	var tax_str = "Tax: $" + y;
	var total_str = "Order total: $" + x + y;

  	html = "<p>" + "Product:  " + order_object.product_name  + "</p>" + "<p>" + subtotal_str + "</p>" + "<p>" + tax_str + "</p>" + "<p>" + total_str + "</p>";
  	document.write("<h1> Order summary </h1>" + html);
}