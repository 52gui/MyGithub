<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@include file="./include/getUserInfo.jspf"%>
<html>
  <head>
    <title>Dreamer管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="./ext/resources/css/ext-all.css" />
	<link rel="stylesheet" type="text/css" href="./theme/theme.css" />
	<link rel="icon" href="http://dreamerdiy.vicp.cc/ManageSystem/favicon.ico" type="image/x-icon" /> 
	<link rel="shortcut icon" href="http://dreamerdiy.vicp.cc/ManageSystem/favicon.ico" type="image/x-icon" />
  </head>
  
  <body>
    <div id="loading-mask" style=""></div>
	<div id="loading">
		<div class="loading-indicator"><img src="./images/extanim32.gif" width="32" height="32" style="margin-right:8px;float:left;vertical-align:top;"/>Dreamer管理系统<br /><span id="loading-msg">正在加载风格和图片...</span></div>
	</div>
	<div>
		<script type="text/javascript">document.getElementById('loading-msg').innerHTML = '正在加载核心接口，请稍候...';</script>
		<script type="text/javascript" src="./ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript">document.getElementById('loading-msg').innerHTML = '正在加载界面组件，请稍候...';</script>
		<script type="text/javascript" src="./ext/ext-all.js"></script>
		<script type="text/javascript" src="./ext/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="./login.js"></script>
		<script type="text/javascript">document.getElementById('loading-msg').innerHTML = '正在初始化，请稍候...';</script>
		<script type="text/javascript">
			Ext.BLANK_IMAGE_URL = './ext/resources/images/default/s.gif';
			var document_load_time=0;//页面打开时间
			var last_session_check_time=0;//上次检测session时间
			var session_fail_tims=0;//session检测失败次数，失败3次之后跳出
			var theTimer;
			//安全退出
			function safeexit() {
				Ext.MessageBox.confirm('提示', '确实要退出吗? ',function (btn){
					if (btn == 'yes') {
						Ext.getBody().mask("安全退出中，请稍候...","x-mask-loading");
						Content_Panel.setTitle('当前位置');
						var conn = new Ext.data.Connection();
						conn.request({
							url: "./logout.jsp",
							method: 'post',
							scope: this,
							callback:function(options,success,response){
								if (success) {
									//成功退出，回到登录界面
									Ext.get('background').fadeIn();
									Content_Panel.removeAll();
									Content_Panel.doLayout();
									resetLogin();
									Login_Panel.show();
								}
								Ext.getBody().unmask();
							}
						});
					}
				});
			}
			//加载页面
			function loadPage(extobj,URL,Params) {
				extobj.removeAll();
				extobj.load({
					url: URL,
					params: Params,
					text: '页面加载中，请稍候......',
					timeout:300000,
					scripts: true
				});
			}
			Ext.onReady(function(){
				Ext.QuickTips.init();
				Ext.form.Field.prototype.msgTarget = 'side';
				
				//显示登录框
				Login_Panel.render('login_panel');
				Login_Panel.findByType('textfield')[0].focus(true,true);
				//显示验证码图片到验证码输入框后面
				var bd = Ext.getDom('randCode');   
				var bd2 = Ext.get(bd.parentNode);  
				bd2.createChild({tag: 'img', id:'randImage', src: 'colorimage',align:'absmiddle',style:'position: relative; left: 30px; cursor:hand',alt:'点击刷新验证码'});
				//增加点击验证码图片事件 
				Ext.get('randImage').on('click',function(){
					Ext.getDom('randImage').src='colorimage?date='+new Date();	
					Login_Panel.findByType('textfield')[2].focus(true,true);
				});
			
				
				//定义背景位置变化
				function bkResize() {
					var body_width=Ext.getBody().getWidth();
					var body_height=Ext.getBody().getHeight();
					var pic_width=794;
					var pic_height=533;
					var bg_xoffset = (body_width-pic_width)/2;
					bg_xoffset = bg_xoffset>0?bg_xoffset:0;
					var bg_yoffset = (body_height-pic_height)/2;
					bg_yoffset = bg_yoffset>0?bg_yoffset:0;
					Ext.get('backgroundimage').moveTo(bg_xoffset,bg_yoffset);
					Ext.get('login_panel').moveTo(bg_xoffset+455,bg_yoffset+180);
					Ext.get('login_readme').moveTo(bg_xoffset,bg_yoffset+425);
				}
			
				Ext.get('background').on('resize',function(){bkResize();});
				<%if (u_id>0) {//如果已经登录，则移除登录层%>
					Login_Panel.hide();
					Top_Panel.show();
					Content_Panel.show();
					Ext.get('background').fadeOut({remove:false});
					Ext.getBody().on('click',function(){
						var conn = new Ext.data.Connection();
						conn.request({
							url: "./include/checkUserInfo.jsp",
							method: 'post',
							scope: this,
							callback:function(options,success,response){
								if (success) {
									var obj = Ext.decode(response.responseText);
									if (obj.success) {
											if(obj.type==2){
												top.location.href='./index.jsp';
											}
									}									
								}else{
									top.location.href='./index.jsp';
								}								
							}
						});
					});
				<%}%>
				//移除遮挡动画
				var hideMask = function () {
					bkResize();
					Ext.get('loading').remove();
					Ext.fly('loading-mask').fadeOut({remove:true});
				};	
				hideMask.defer(250);
				//loadPage(Main_Panel,'./case/index.jsp','',function(){
					//if(typeof(Date_Case)!='undefined'){
						//Date_Case.expand();
						//var targetNode = Date_Case.getRootNode().firstChild;
						//targetNode.select();
						//targetNode.fireEvent("click",targetNode);
					//}
				//});
			});
			//定义标题区
			Top_Panel = new Ext.Panel({
				region:'north',
				autoScroll:false,
				height:63,
				layout: 'column',
				tbar:[{
					xtype:'button',
					text: '首 页',
					iconAlign: 'top',
					icon:'./images/icons/home.png',
					scale :'large',
					style :'margin:2px 15px 0 5px;',
					handler:function(){
						//Ext.getBody().mask("数据加载中，请稍候...","x-mask-loading");
						//loadPage(Content_Panel,'./index.jsp');
						Ext.Msg.alert("提示","正在实现！");
					}
				},{
					text: '<font color=#15428b>用户管理</font>',
					scale: 'large',
					ref:'./note',
					style :'margin:0 5px 0 5px',
					icon:'./images/icons/users.png',
					iconAlign: 'top',
					id:'tbar_union',
					handler:function(){
						//Ext.getBody().mask("数据加载中，请稍候...","x-mask-loading");
						//loadPage(Content_Panel,'./uims/index.jsp');
						Ext.Msg.alert("提示","正在实现！");
					}
				},{
					text: '<font color=#15428b>退出</font>',
					scale: 'large',
					style :'margin:0 5px 0 5px',
					icon:'./images/icons/exit.png',
					iconAlign: 'top',
					handler:safeexit
				},'->',{
					xtype:'panel',
					ref:'./hint',
					border:false,
					bodyStyle:'background-color:transparent;',
					style:'text-align:right',
					html:'<span style="width:200px;valign:middle;text-align:left;font-size:13px;padding-top:15px;padding-left:5px;">当前用户:<%=user_name%><br>版本：1.0<br>本软件由<b>Dreamer</b>开发</span>'
				}],
				aotuWidth:true
			});
			
			//定义工作区
			Content_Panel = new Ext.Panel ({
				title:'',
				border:true,
				region:'center',
				layout:'fit',
				autoScroll: false,
				margins:'5 0 5 0'
			});
			
			//定义布局
			var Viewport = new Ext.Viewport({
				layout:'border',
				items:[Top_Panel, Content_Panel],
				listeners: {
					resize: function() {
						///doResize.defer(250);
					}
				}
			});
			
		</script>
	</div>
  	<div id='background' style="z-index:8999;position:absolute;left:0;top:0;width:100%;height:100%;background-color:white">
		<div id='backgroundimage'>
			<img src="./images/login.gif" border=0>
			<div id='login_panel'></div>
			<div id='login_readme'>
				<table style="color: #8f8f8f; font: normal 10px arial, tahoma, sans-serif">
					<tr><td height=20>特别提示：</td>
						<td>
							1. 本系统支持浏览器包括 Windows Internet Explorer 6 及更高版本。 Mozilla Firefox 1.5 及更高版本（PC 和Macintosh）。Apple Safari 2 						
						</td>
					</tr>
					<tr><td>&nbsp;</td>
						<td height=20>
							&nbsp;&nbsp;&nbsp;&nbsp;及更高版本。Opera 9 及更高版本（PC 和 Mac）。
						</td>
					</tr>
				</table>
			</div>
		</div>
	 </div>
  </body>
</html>
