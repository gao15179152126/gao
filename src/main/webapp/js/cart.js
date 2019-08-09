$(document).ready(function(){
    $("[name = checkItem]").click(function () {
        refreshTotalPrice();
    })
    $("[name = addButton]").click(function () {
        addNumber($(this).prev());
        refreshTotalPrice();
    })
    $("[name = delButton]").click(function () {
        delNumber($(this).next());
        refreshTotalPrice();
    })
});
function refreshTotalPrice() {
    var total = 0;
    $("[name = checkItem]:checked").each(function (i, e) {
        var singlePrice = parseFloat($(this).parent().parent().children().eq(-3).text());
        var number = parseInt($(this).parent().parent().children().eq(-2).children().eq(-2).text());
        var price = singlePrice*number;
        total += parseFloat(price);
    });
    $("#total").text(total);
}
function addNumber(labelForNum) {
    var number = parseInt($(labelForNum).text());
    number += 1;
    $(labelForNum).text(number);
}
function delNumber(labelForNum) {
    var number = parseInt($(labelForNum).text());
    if(number<=0) number=0
    else number -= 1;
    $(labelForNum).text(number);
}
/*function orderObj(productId,username,orderMoney,orderNumber) {
    this.productId = productId;
    this.username = username;
    this.orderMoney = orderMoney;
    this.orderNumber = orderNumber;
}*/
function submit() {
    var order=[];
    $("[name = checkItem]:checked").each(function (i, e){
        var productId = parseInt($(this).parent().next().next().text());
        var username = $(this).parent().next().text()
        var orderMoney = parseFloat($(this).parent().next().next().next().next().next().text());
        var orderNumber = parseInt($(this).parent().next().next().next().next().next().next().children().eq(1).text());
        order.push({"productId":productId,"username":username,"orderMoney":orderMoney,"orderNumber":orderNumber})
    });
    var orderList = JSON.stringify(order);
    $.ajax({
        async: false,
        contentType:'application/json',
        type:'post',
        data:orderList,
        dateType:'json',
        url:'/order/submitOrder',
        success:function () {
            alert('success')
            location.replace("/order/myOrder")
        }
    })
}