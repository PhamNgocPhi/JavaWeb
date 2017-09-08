var maxhieght=function(id){
	var max = -1;
	$(id).each(function() {
		var h = $(this).height(); 
		max = h > max ? h : max;
	});
	$(id).css("height",max);
};
$(document).ready(function(){
	maxhieght(".reason");
	$(window).resize(function(){
		$(".reason").css("height","");
		maxhieght(".reason");
	});
	maxhieght(".info");
	$(window).resize(function(){
		$(".info").css("height","");
		maxhieght(".info");
	});
});
$( ".img" ).hover(
	function() {
		$( this ).addClass( "rotate360" );
	}, function() {
		$( this ).removeClass( "rotate360" );
	}
	);
$('.khName').click(function() {
	$('.khName.khActive').removeClass('khActive');
	$(this).closest('.khName').addClass('khActive');
});
$('.header-bot ul li a').click(function() {
	$('ul li.liActive').removeClass('liActive');
	$(this).closest('li').addClass('liActive');
});
// check email
function isEmail(str) 
{ 
	atpos = str.indexOf("@"); 
	dotpos = str.lastIndexOf("."); 
	if (atpos < 1 || ( dotpos - atpos < 2 ))  
	{  
		return false;
	} 
	return true; 
}
function isCorrectPass(pass,confirmPass){
	if(pass == confirmPass){
		return true;
	} return false;
}
function isEmpty(str) {
	if(str == null || str == "") {
		return true;
	}
	return false;
}
function isNumber(str){
	var re = /^\d+$/;
	return (re.test(str));
}
function isDate(str){
	if(str.length!=10 || str.charAt(2) != "/" || str.charAt(5) != "/" || !isPositiveInteger(str.substring(0,2) + 
		str.substring(3,5) + str.substring(6,10)) ) {
		return false;
	}
	var d = substring(3,5) - 0;
	var m = subString(0,2) - 0;
	var y = substring(6,10) - 0;
	if(d == 0 || m == 0 || y == 0){
		return false;
	}
	if (m > 12) return false; 
	if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) 
		var dmax = 31; 
	else 
		if (m == 4 || m == 6 || m == 9 || m == 11) dmax = 30; 
	else 
		if ((y%400==0) || (y%4==0 && y%100!=0)) dmax = 29; 
	else dmax = 28; 
	if (d>dmax) return false; 
	return true; 
}
function hasSpecialcharacter(str) {
	var re = /^[ A-Za-z0-9_@./#&+-]*$/;
	return (!re.test(str));
}
// function validateForm(){
	
// 	isEmail(str) isCorrectPass(var pass, var confirmPass)
// 	isEmpty(str) isNumber(str) isDate(str) hasSpecialcharacter(str)
// }
//login
$('.tab a').on('click', function (e) {

	e.preventDefault();

	$(this).parent().addClass('active');
	$(this).parent().siblings().removeClass('active');

	target = $(this).attr('href');

	$('.tab-content > div').not(target).hide();

	$(target).fadeIn(600);

});

function checkLogin() {
    var str = document.getElementById('email').value;
    if(isEmail(str) == true){
	    if (hasSpecialcharacter(str) == true){
	        document.getElementById('errorEmail').innerHTML = 'vui lòng không sủ dụng ký tự đặc biệt';
	        return false;
	    } else {
	        document.getElementById('errorEmail').innerHTML = 'email hợp lệ';
	        return true;
	    }
    } else {
    	document.getElementById('errorEmail').innerHTML = 'email chưa chính xác';
	        return true;
    }
}

function checkEmailSignup() {
    var str = document.getElementById('emailHV').value;
    if(isEmail(str) == true){
	    if (hasSpecialcharacter(str) == true){
	        document.getElementById('errorEmailHV').innerHTML = 'vui lòng không sủ dụng ký tự đặc biệt';
	        return false;
	    } else {
	        document.getElementById('errorEmailHV').innerHTML = 'email hợp lệ';
	        return emailCheck(str);
	    }
    } else {
    	document.getElementById('errorEmailHV').innerHTML = 'email chưa chính xác';
	        return true;
    }
}
function checkPassSignup(){
	var pass = document.getElementById('passwordHV').value;
	var confirmPass = document.getElementById('ConfirmPasswordHV').value;
	if (isCorrectPass(pass,confirmPass) == false){
	    document.getElementById('errorConfirm').innerHTML = 'mật khẩu nhập lại không đúng';
	    return false;
	} else {
	    document.getElementById('errorConfirm').innerHTML = 'mật khẩu nhập lại đã đúng';
	    return true;
	}
}

function formSigup(){
	if(checkEmailSignup() == true && checkPassSignup() == true) return true;
	else return false;
}
