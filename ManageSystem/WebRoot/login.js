function resetLogin() {
	//重置表单
	Login_Panel.form.reset();
	//刷新验证码图片
	Ext.getDom('randImage').src='colorimage?date='+new Date();
	//聚焦到用户名
	Login_Panel.findByType('textfield')[0].focus(true,true);
}

//定义登录提交
function doLogin() {
	if (Login_Panel.form.isValid()) {
		Login_Panel.form.submit({
			waitMsg: '正在登录......',
			waitTitle: '请稍候',
			url : 'checkin.jsp',
			method : 'post',
			success : function(form, action) {
				window.location.href=window.location.href;
				Login_Panel.hide();

				//Tab.person_tab.fireEvent('activate','');//触发tab事件，加载数据
				Ext.get('background').fadeOut({remove:false});
				uId = action.result.uId;
			},
			failure : function(form, action) {
				var message;
				if (action.result) {
					message = action.result.data;
				} else {
					message = '登录失败！失败原因：'+action.failureType;
				}
                Ext.Msg.show({
                    title: '提示',
                    msg: message+' ',
                    buttons: Ext.Msg.OK,
                    icon: Ext.Msg.ERROR,
                    fn: function callback(id){
                		resetLogin();
        			}

                });
			}
		});
	}
}

var Login_Panel = new Ext.FormPanel({
	border: false,
	bodyBorder: false,
	buttonAlign: 'center',
	bodyStyle:'padding:5px 5px 0',
	labelWidth: 45,
	width: 270,
	defaults: {width: 180,allowBlank: false},
	defaultType: 'textfield',
	items: [{
			fieldLabel: '用户名',
			name: 'username',
			blankText : '用户名不能为空'
		},{
			fieldLabel: '密&nbsp;&nbsp;&nbsp;码',
			name: 'password',
			inputType: 'password',
			blankText : '密码不能为空'
		},{
			fieldLabel: '验证码',
			id:'randCode',
			name: 'rand',
			width: 90,
			blankText : '验证码不能为空',
			enableKeyEvents: true,
			listeners: {
				keypress: function(t,e) {
					if (e.getKey()==13) {
						doLogin();
					}
				}
			}
		}],	
	buttons:[{
			text: '登 录',
			handler: doLogin
		},{
			text: '重 填',
			handler:function(btn){
				resetLogin();
			}
		}]
});