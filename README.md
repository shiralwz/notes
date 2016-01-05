Restful的登录API  
URL: /api/session  
请求类型: POST  
Body参数: username, password  
成功返回: HTTP 200,{token: '<token的值>'} 
失败返回:HTTP 200, {error: '错误内容'}  
token由JWT生成，payload为{user_id:<User的ID>},在后续的API中  
需要带上这个token，服务端解码这个token，就可以获得当前User的ID,  
这样就能识别用户身份了.  
  
可以将token的解码和用户身份验证放到helper方法中来实现，  
helper方法中可以访问当前请求的信息，比如参数,URL等，  
helper方法可以被其他API所复用。  
  
使用before hook来执行用户身份验证。  
  
Restful的用户信息更新API,  
URL: /api/user  
请求类型：PUT  
Body参数：user_bio,用户的简介信息  
URL参数： token,用户的访问凭证  
成功返回：HTTP 200, {success: true}  
失败返回：HTTP 200,{error: '错误内容'}  
访问凭证无效时返回：HTTP 401, {error: 'unauthorized assess'}  
  
Restful新增笔记API  
URL: /api/user/notes  
请求类型：POST  
Body参数：title, content  
URL参数： token,用户的访问凭证  
成功返回: HTTP200, {note_id: '新增note的ID'}  
失败返回: HTTP200,{error: '错误内容'}  
访问无凭证时返回： HTTP401, {error: 'unanthorized access'}  
  
Restful的修改笔记API  
URL: /api/user/notes/:id  
请求类型: PUT  
Body参数: title,content  
URL参数：token,用户的访问凭证  
成功返回： HTTP 200,{success: true}  
失败返回：HTTP200,{error: '错误内容'}  
笔记不存在时返回：HTTP 404, {error: 'not found'}  
访问凭证无效时候返回：HTTP 401,{error:'unauthorized access'}  

Restful的删除笔记API:  
URL: /api/user/notes/:id (包含一个路径id,笔记的ID)  
请求类型： DELETE  
URL参数： token, 用户的访问凭证  
成功返回：HTTP200 ,{success:true}  
失败返回：HTTP 200,{error: '错误内容'}  
笔记不存在时返回：HTTP 404, {error: 'not found'}  
访问凭证无效时返回：HTTP 401, {error: 'unauthorized access'}  
  
Restful的笔记读取API  
URL: /api/user/notes/:id(包含一个路径参数id,笔记的 ID)  
请求类型: GET  
URL参数: token, 用户的访问凭证  
成功返回: HTTP 200, {title: '笔记标题'， content: '笔记内容'}  
笔记不存在时返回: HTTP 404, {error: 'not found'}  
访问凭证无效时返回：HTTP 401, {error: 'unauthorized access'}  
  
Restful的笔记列表API  
URL: /api/user/notes  
请求类型: GET  
URL参数： token, 用户的访问凭证  
成功返回：HTTP 200,{notes: <notes数组，包含title和content>}  
访问凭证无效时返回： HTTP 401,{error: 'unauthorized access'}
