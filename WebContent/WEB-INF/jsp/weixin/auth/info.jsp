<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>认证</title>
	<%@ include file="/WEB-INF/jsp/weixin/comm_css.jsp" %>
	<style>
		.upimg{
			width:79px;
			height:79px;
			display:inline;
			margin-right:5px;
		}
	</style>
</head>
<body ontouchstart="">
<div class="page">
    <div class="page__hd" style="margin-top:5px">
         <h2 style="text-align:center;vertical-align: middle;">认证信息填写</h2>
    </div>	
	<!-- 工厂信息填写  -->
    <div class="page__bd">
      <form action="../saveInfo" method="post" id="form">
		<div class="weui-cells weui-cells_form" style="margin-top:5px">    	
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">名称：</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" name="name" required maxlength="30" value="${fi.name }"
                    	placeholder="请输入公司/商家名称/个人姓名" emptyTips="请输入名称" 
                    	notMatchTips="名称长度不能超过30个字符"/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">法人/自然人姓名：</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" name="fname" maxlength="30" 
                    	placeholder="请输入公司/商家法人/自然人姓名" emptyTips="请输入公司/商家法人/自然人姓名" 
                    	notMatchTips="法人/自然人姓名长度不能超过30个字符"  value="${fi.fname }"/>
                </div>
                <div class="weui-cell__ft">
                    <i class="weui-icon-warn"></i>
                </div>
            </div>
            <div class="weui-cell" id="uploader">
                <div class="weui-cell__bd">
                    <div class="weui-uploader">
                        <div class="weui-uploader__hd">
                            <p class="weui-uploader__title">营业执照、工厂/店铺图片、法人/自然人照片上传：</p>
                            <div class="weui-uploader__info"><span id="uploadCount"></span></div>
                        </div>
                        <div class="weui-uploader__bd">
                            <ul class="weui-uploader__files" id="uploaderFiles">
                            <c:forTokens items="${fi.certificates }" var="it" delims=";">
                            	<img class="upimg" src="${ctx}/wx/web/upload/get/${it }" data-id="${it }" />
                            </c:forTokens>
                            </ul>
                            <div class="weui-uploader__input-box" id="uploadInput">
                            </div>
                        </div>
                    </div>
                </div>
			</div>
			<input type="hidden" name="certificates">
			<input type="hidden" name="newCertificates">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="" class="weui-label">定位：</label></div>
                <div class="weui-cell__ft">
                	<input name="lat" type="hidden" value="${fi.lat }"/>
                	<input name="lng" type="hidden" value="${fi.lng }"/>
                    <a class="weui-vcode-btn" id="location-btn" href="javascript:;">地图选址</a>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="" class="weui-label">地址：</label></div>
                <div class="weui-cell__bd">
                	<textarea class="weui-textarea"  name="address" placeholder="请输入地址" rows="3"  required emptyTips="请输入地址" >${fi.address }</textarea>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">手机号：</label>
                </div>
                <div class="weui-cell__bd">
                	<input class="weui-input" type="tel" name="mphone" value="${fi.mphone }" required pattern="^\d{11}$" maxlength="11" placeholder="请输入你的手机号" emptyTips="请输入手机号" notMatchTips="请输入正确的手机号">
                </div>
            </div>
            <div class="weui-cell" id="vcodeCell" style="display:${not empty fi.mphone ? 'none':''}">
                <div class="weui-cell__hd">
                    <label class="weui-label">短信验证码：</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="smsAuthCode" checkOk="${fi.mphone }" type="tel" placeholder="请输入短信验证码"/>
                </div>
                <div class="weui-cell__ft">
                    <a class="weui-vcode-btn" href="javascript:;" id="getVcode">获取验证码</a>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="" class="weui-label">微信号：</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="wechat" type="text" value="${fi.wechat }" required placeholder="请输入你的微信号" emptyTips="请输入你的微信号"/>
                </div>
            </div>
			<input type="hidden" name="openId" value="${fi.openId }">
        <div class="weui-cell no-top-line weui-btn-area_inline">
            <a class="weui-btn weui-btn_primary" href="category" id="cc2Pre">上一步</a>
            <!-- <a class="weui-btn weui-btn_primary" href="javascript:" id="toBrand">下一步</a> -->
            <a class="weui-btn weui-btn_primary" href="javascript:void(0);" id="formSubmitBtn">下一步</a>
        </div>
    </div>
    </form>
	</div>
	<%@ include file="/WEB-INF/jsp/weixin/footer.jsp" %>
</div>
<iframe id="mapPage" width="100%" height="100%" frameborder=0 
    src="http://apis.map.qq.com/tools/locpicker?search=1&type=1&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77&referer=myapp">
</iframe> 
</body>
<%@ include file="/WEB-INF/jsp/weixin/comm_js.jsp" %>
<%@ include file="/WEB-INF/jsp/weixin/js_sdk_config.jsp" %>
<script type="text/javascript" src="${ctx }/js/app/weixin/form.js"></script>
<script type="text/javascript" src="${ctx }/js/app/weixin/wx_js_sdk_img_upload.js"></script>
<script>
	$("input[name='mphone']").on("change",function(){
		var phoneNumbers = $(this).val();
		if(phoneNumbers.length == 11){
			var oldPhone = $("input[name='smsAuthCode']").attr("checkOk");
			if(phoneNumbers != oldPhone){
				$("#vcodeCell").show();
				$("#getVcode").html("获取验证码");
				$("#getVcode").on("click",phoneAuth);
				$("input[name='smsAuthCode']").val("");
				$("input[name='smsAuthCode']").removeAttr("readOnly");
			}else{
				$("#vcodeCell").hide();
			}
		}
	});
	
	$("input[name='smsAuthCode']").on("change",function(){
		var vCode = $(this).val();
		if(vCode.length == 4){
			//clearInterval(vcodeInterval);
			var phoneNumbers = $("input[name='mphone']").val();
			
			if(phoneNumbers.length != 11){
				weui.alert('请先输入正确的手机号！');
			}
			else{
				$.getJSON(ctx + "/wx/web/auth/checkVcode",{phoneNumbers:phoneNumbers,vcode:vCode},function(data){
					if(Constants.ResultStatus_Ok == data.status){
						$("#getVcode").off("click");
						clearInterval(vcodeInterval);
						$("input[name='smsAuthCode']").attr("readOnly","readOnly");
						$("input[name='smsAuthCode']").attr("checkOk",phoneNumbers);
						$("#getVcode").html("验证通过");
					}
					else{
						weui.alert(data.mess);
						if(data.data == "again"){
							clearInterval(vcodeInterval);
							$("#getVcode").html("重新获取");							
							$("input[name='smsAuthCode']").val("");							
						}
						else if(data.data == "reinput"){
							$("input[name='smsAuthCode']").focus();							
						}
					}
				});	
			}
		}
	});
	
	var vcodeInterval;
	
	function phoneAuth(){
		var phoneNumbers = $("input[name='mphone']").val();
		if(phoneNumbers.length != 11){
			weui.alert('请先输入正确的手机号！');
		}
		else{
			$.getJSON(ctx + "/wx/web/auth/phoneAuth",{phoneNumbers:phoneNumbers},function(data){
				if(Constants.ResultStatus_Ok == data.status){
					$("#getVcode").off("click");
					$("input[name='smsAuthCode']").removeAttr("readOnly");
					$("input[name='smsAuthCode']").focus();
					var tt = data.data * 60;
					function tf(){
						tt--;
						if(tt > 0) {
							$("#getVcode").html(tt+"秒");
						}
						else {
							clearInterval(vcodeInterval);
							$("#getVcode").html("重新获取");
							$("#getVcode").on("click",phoneAuth);
						}
					};
					vcodeInterval = setInterval(tf,1000);
				}
				else{
					if(data.mess){
						weui.alert(data.mess);
					}
				}
			});
		}
	}
	
	$("#getVcode").on("click",phoneAuth);
	
	var uploadCountDom = document.getElementById("uploadCount");

	var imgUploader = new WXImgUploader(3,0,"uploadInput",'uploadCount','uploaderFiles');
	
	function doFormSubmit(){
		if($("input[name='smsAuthCode']").attr("checkOk") != $("input[name='mphone']").val()){
			weui.alert("请获取验证码，验证手机号！");
			return;
		}
		if($("input[name='lat']").val() == ""){
			weui.alert("请完成定位，否则无法在地图上显示！");
			return;
		}
		
		var re = imgUploader.upload();
		if(re){
			var xx = 1;
			function ccck(){
				if(imgUploader.uploadOk.length < imgUploader.localIds.length && xx < 10){
					xx++;
					setTimeout(ccck,300);
				}
				else{
					weui.loading().hide();
					if(imgUploader.uploadOk.length == imgUploader.localIds.length){
						$("input[name='certificates']").val(imgUploader.getUploadedFileServerIdStr());
						$("input[name='newCertificates']").val(imgUploader.getNewUploadedFileServerIdStr());
						
						var loading = weui.loading('提交中...');
						//将文件加入到表单中提交
						$('#form').submit(); 
					}
					else {
						weui.alert('请等待3秒待都完成上传后，再点击 下一步');
					}
				}
			}
			setTimeout(ccck,300);
		}
	}
	
	
	$("#mapPage").hide();
	$("#location-btn").on("click",function(){
		$("#mapPage").show();
		$(".page").hide();
	});

    window.addEventListener('message', function(event) {
        // 接收位置信息，用户选择确认位置点后选点组件会触发该事件，回传用户的位置信息
        var loc = event.data;
        if (loc && loc.module == 'locationPicker') {//防止其他应用也会向该页面post信息，需判断module是否为'locationPicker'
          console.log('location', loc); 
        	var addr = loc.poiaddress + "-" + loc.poiname;
        	addr = addr.replace("-我的位置","");
			$("textarea[name='address']").val(addr);
			$("input[name='lat']").val(loc.latlng.lat);
			$("input[name='lng']").val(loc.latlng.lng);
          	$("#mapPage").hide();
  			$(".page").show();
        }                                
    }, false);
</script>
</html>