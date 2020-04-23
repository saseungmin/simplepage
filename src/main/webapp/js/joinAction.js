function submits(){
    var userID=document.getElementById("userID");
    var userPassword1=document.getElementById("userPassword1");
    var userPassword2=document.getElementById("userPassword2");
    var userName=document.getElementById("userName");
    var userBirthdate=document.getElementById("userBirthdate");
    var userEmail=document.getElementById("userEmail");
    var userNumber=document.getElementById("userNumber");
    var termAgree=document.getElementsByName("termagree");
    var agrees=document.getElementsByName("Agree");

    if(userID.value==""){
        alert("아이디를 입력하세요.");
        userID.focus();
        return false;
    }else if(userPassword1.value==""){
        alert("비밀번호를 입력하세요.");
        userPassword1.focus();
        return false;
    }else if(userPassword2.value==""){
        alert("비밀번호 확인란을 확인하세요.");
        userPassword2.focus();
        return false;
    }else if(userName.value==""){
        alert("이름을 입력하세요.");
        userName.focus();
        return false;
    }else if(userBirthdate.value==""){
        alert("생년월일을 입력하세요.");
        userBirthdate.focus();
        return false;
    }else if(userEmail.value==""){
        alert("이메일을 입력하세요.");
        userEmail.focus();
        return false;
    }else if(userNumber.value==""){
        alert("휴대폰번호를 입력하세요.");
        userNumber.focus();
        return false;
    }else if(!termAgree[0].checked){
        alert("약관에 동의하세요.");
        return false;
    }
    if(userPassword1.value.length<9){
        alert("비밀번호를 8자이상 입력하세요.");
        userPassword1.focus();
        return false;
    }
    if(userPassword1.value!=userPassword2.value){
        alert("비밀번호 확인란이 다릅니다.");
        userPassword2.focus();
        return false;
    }
    if(userNumber.value){
        alert("- 를 빼고 입력하세요.");
        userNumber.focus();
        return false;
    }
    

    return true;
}


$(document).ready(function(){

    //8자 이하
    var bad = /(?=.{8,}).*/;
    //숫자와 영어8자이상
    var good = /^(?=\S*?[a-z])(?=\S*?[0-9])\S{8,}$/;
    //적어도 하나의 대문자, 소문자 및 (숫자 또는 특수 문자)를 포함.
    var better = /^(?=\S*?[A-Z])(?=\S*?[a-z])((?=\S*?[0-9])|(?=\S*?[^\w\*]))\S{8,}$/;
    // 적어도 하나의 대문자, 소문자 및 (숫자와 하나의 특수 문자)를 포함.
    var best = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{8,}$/;
    
    $('#userPassword1').on('keyup', function () {
        var password = $(this);
        var pass = password.val();
        var passLabel = $('[for="userPassword1"]');
        var stength = 'Weak';
        var pclass = 'danger';
        if (best.test(pass) == true) {
            stength = '매우 안전';
            pclass = 'success';
        } else if (better.test(pass) == true) {
            stength = '안전';
            pclass = 'warning';
        } else if (good.test(pass) == true) {
            stength = '보통';
            pclass = 'warning';
        } else if (bad.test(pass) == true) {
            stength = '약함';
        } else {
            stength = '매우 약함';
        }
    
        var popover = password.attr('data-content', stength).data('bs.popover');
        popover.setContent();
        popover.$tip.addClass(popover.options.placement).removeClass('danger success info warning primary').addClass(pclass);
    
    });
    
    $('input[data-toggle="popover"]').popover({
        placement: 'top',
        trigger: 'focus'
    });
    
    })