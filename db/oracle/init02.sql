INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('wx.upload.save.rootdir','公众号网页上传文件的存放根目录','/data/files','公众号网页上传文件的存放根目录');
INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('wx.upload.public.url','公众号网页公开文件的上传url','/weixins/wx/web/upload/comm','公众号网页公开文件的上传url');
INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('wx.download.public.url','公众号网页公开文件的下载url','/weixins/wx/pubget','公众号网页公开文件的下载url');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('wx.pay.notify_url','微信支付回调url','http://www.cshyc.com/wx/comm/trade/notify','微信支付回调url');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('bzj.pay.body','保证金微信支付显示内容','保证金支付','保证金微信支付显示内容');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('cz.pay.body','充值微信支付显示内容','账户充值','充值微信支付显示内容');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('mess.fb.plat.fee','信息全平台推送收费金额','5','信息全平台推送收费金额');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('mess.prod.title.prefix','产品消息的标题前缀','新产品！','产品消息的标题前缀');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('mess.pd.title.prefix','派单消息的标题前缀','工单-','产品消息的标题前缀');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('zhi.gou.phone','平台直购电话','18888888888','平台直购电话');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('audit_id','认证审核者id','','认证审核者id，多个以英文;间隔');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('auth.audit.template.id','认证审核通知模板id','XPnVR4CYYBFpWnnd0cgKr4Sn38-HvRDbZqwYsLE1A1c','认证审核通知模板id');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('auth.audit.template.url','认证审核通知模板跳转url','http://www.cshyc.com/wx/web/auth/auditList','认证审核通知模板跳转url');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('work.order.template.id','工单通知模板id','6gsxTgD9g0NyOKJCAdGRffKt9AOfL2Ej_J9LvLhLrVw','工单通知模板id');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('work.order.template.url','工单通知模板跳转url','http://www.cshyc.com/wx/web/pd/view','工单通知模板跳转url');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('prod.fb.send.template','产品发布-模板消息开关(1开，0关)','0','产品发布-模板消息开关(1开，0关)');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('prod.template.id','新产品通知模板id','pj_IsC1QOQljISC2wnsebHzKsAd7Dgah7QSO5ZBM0-A','新产品通知模板id');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('prod.template.url','新产品通知模板跳转url','http://www.cshyc.com/wx/web/prod/view','新产品通知模板跳转url');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('mess.fb.send.template','信息发布-模板消息开关(1开，0关)','0','信息发布-模板消息开关(1开，0关)');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('mess.template.id','信息通知模板id','pj_IsC1QOQljISC2wnsebHzKsAd7Dgah7QSO5ZBM0-A','信息通知模板id');

INSERT INTO t_sys_param(ID,name,VALUE,remark)
VALUES('mess.template.url','信息通知模板跳转url','http://www.cshyc.com/wx/web/fb/view','信息通知模板跳转url');

INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('follwer.category','经营类别','follwer.category',100,'0','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('fct1','厂家','1',1,'follwer.category','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('fct2','商家','2',2,'follwer.category','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('fct3','专家','3',3,'follwer.category','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('fct4','安装工','4',4,'follwer.category','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('fct5','自然人','5',5,'follwer.category','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('fct6','其他','6',6,'follwer.category','s',1);

INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('baoZhengjin.standard','保证金标准','baoZhengjin.standard',101,'0','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('bzjs1','厂家','500',1,'baoZhengjin.standard','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('bzjs2','商家','500',2,'baoZhengjin.standard','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('bzjs3','专家','500',3,'baoZhengjin.standard','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('bzjs4','安装工','500',4,'baoZhengjin.standard','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('bzjs5','自然人','500',5,'baoZhengjin.standard','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('bzjs6','其他','500',6,'baoZhengjin.standard','s',1);

INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('cz.amount','充值金额选项','cz.amount',102,'0','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('cza1','200元','200',1,'cz.amount','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('cza2','300元','300',2,'cz.amount','s',1);
INSERT INTO t_sys_dict(Id,name,value,ordno,pid,type,valid) VALUES('cza3','500元','500',3,'cz.amount','s',1);