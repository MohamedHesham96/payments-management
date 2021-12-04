function updateDevicePriceAfterMonthlyInterest() {
    var devicePriceValue = convertToFloat($("#devicePrice").val());
    var monthsNumberValue = convertToFloat($("#monthsNumber").val());
    var monthlyInterestValue = convertToFloat($("#monthlyInterest").val());
    var priceAfterMonthlyInterest = devicePriceValue + monthsNumberValue * monthlyInterestValue;
    var content = devicePriceValue + " + " + monthsNumberValue + " * " + monthlyInterestValue + " = " + priceAfterMonthlyInterest;
    $("#devicePriceAfterMonthlyInterestSpan").text(content);
    updateRemainAmount();
}


function updateRemainAmount() {
    var devicePriceValue = convertToFloat($("#devicePrice").val());
    var monthsNumberValue = convertToFloat($("#monthsNumber").val());
    var monthlyInterestValue = convertToFloat($("#monthlyInterest").val());
    var priceAfterMonthlyInterest = devicePriceValue + monthsNumberValue * monthlyInterestValue;
    var payed = convertToFloat($("#payed").val());
    var remainAmount = priceAfterMonthlyInterest - payed;
    var content = priceAfterMonthlyInterest + " - " + payed + " = " + remainAmount;
    $("#remainAmountSpan").text(content);
}

function convertToFloat(value) {
    if (isNaN(value) || value == '') {
        return 0;
    } else {
        return parseFloat(value);
    }
}