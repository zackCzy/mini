<!doctype html>
<html dir="ltr" lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<style type="text/css">
#editor {
	float: left;
	width: 380px;
	background: #D5F3F4;
	padding-left: 10px;
}

#editor span.button {
	display: block;
	float: left;
	border: 1px solid #CCC;
	margin: 1px 5px 1px 0px;
	color: #000;
	background: #D0E8FC;
	width: 40px;
	height: 20px;
	text-align: center;
}

#editor select {
	display: block;
	float: left;
	height: 24px;
	width: 60px;
	margin-right: 5px;
}

#textarea {
	width: 382px;
	height: 100px;
}
</style>
		<script type="text/javascript">
	var addEvent = (function() {
		if (document.addEventListener) {
			return function(el, type, fn) {
				el.addEventListener(type, fn, false);
			};
		} else {
			return function(el, type, fn) {
				el.attachEvent('on' + type, function() {
					return fn.call(el, window.event);
				});
			}
		}
	})();
	var deliver = function(iframe) {
		addEvent(iframe.contentWindow, 'blur', function() {
			var tip = document.getElementById("exe");
			iframeDocument = iframe.contentDocument
					|| iframe.contentWindow.document;
			tip.innerHTML = "失去焦点，并取得iframe的内容为："
					+ iframeDocument.body.innerHTML
			tip.style.backgroundColor = "#9999CC";
		})
	}
	window.onload = function() {
		var editor = document.getElementById("editor");
		var buttons = editor.getElementsByTagName("span");
		var selects = editor.getElementsByTagName("select");
		var textarea = document.getElementById("textarea");
		textarea.style.display = "none";
		var iframe = document.createElement("iframe");
		iframe.style.width = "390px";
		iframe.style.height = "100px";
		iframe.frameBorder = 0;
		textarea.parentNode.insertBefore(iframe, textarea);
		var iframeDocument = iframe.contentDocument
				|| iframe.contentWindow.document;
		iframeDocument.designMode = "on";
		iframeDocument.open();
		iframeDocument
				.write('<html><head><style type="text/css">body{ font-family:arial; font-size:13px;background:#DDF3FF }</style></head></html>');
		iframeDocument.close();
		var switchEditMode = true;
		for ( var i = 0, l = buttons.length; i < l; i++) {
			buttons[i].onclick = new function() {
				var command = buttons[i].getAttribute("title");
				return function() {
					switch (command) {
					case 'createlink':
					case 'insertimage':
						var value = prompt('请输入超链接:', 'http://');
						iframeDocument.execCommand(command, false, value);
						break;
					case "html"://查看源码
						if (switchEditMode) {//切换到textarea
							iframe.style.display = "none";
							textarea.style.display = "block";
							textarea.value = iframeDocument.body.innerHTML;
							textarea.focus();
							switchEditMode = false;
						} else {//切换到iframe
							iframe.style.display = "block";
							textarea.style.display = "none";
							iframeDocument.body.innerHTML = textarea.value;
							iframe.contentWindow.focus();
							switchEditMode = true;
						}
						break;
					default:
						iframeDocument.execCommand(command, false, '');
						iframe.contentWindow.focus();
					}
				};
			};
		}
		;
		for (i = 0, l = selects.length; i < l; i++) {
			selects[i].onchange = new function() {
				var select = selects[i];
				return function() {
					var command = select.getAttribute("title"), value = select.options[select.selectedIndex].value;
					if (command == 'backcolor' && /a/[-1] == 'a') {
						iframeDocument.execCommand('hilitecolor', false, value);
					} else {
						iframeDocument.execCommand(command, false, value);
					}
				};
			};
		}
		;
		deliver(iframe);
	}
</script>
		<title>富文本编辑器</title>
	</head>
	<body>
		<p id="exe"></p>
		<div id="editor">
			<span class="button" title="bold" unselectable="on">加粗</span>
			<span class="button" title="italic" unselectable="on">斜体</span>
			<span class="button" title="underline" unselectable="on">下划</span>
			<span class="button" title="justifycenter" unselectable="on">居中</span>
			<span class="button" title="justifyleft" unselectable="on">居左</span>
			<span class="button" title="justifyright" unselectable="on">居右</span>
			<span class="button" title="outdent" unselectable="on">悬挂</span>
			<span class="button" title="indent" unselectable="on">缩进</span>
			<span class="button" title="insertunorderedlist" unselectable="on">无序</span>
			<span class="button" title="insertorderedlist" unselectable="on">有序</span>
			<span class="button" title="createlink" unselectable="on">链接</span>
			<span class="button" title="insertimage" unselectable="on">图片</span>
			<span class="button" title="html" unselectable="on">源码</span>
			<select title="fontname">
				<option value="SimSun">
					宋体
				</option>
				<option value="LiSu">
					隶书
				</option>
				<option value="KaiTi_GB2312">
					楷体
				</option>
				<option value="YouYuan">
					幼圆
				</option>
				<option value="SimHei">
					黑体
				</option>
				<option value="Microsoft YaHei">
					雅黑
				</option>
				<option value="Comic Sans MS">
					Comic Sans MS
				</option>
			</select>
			<select title="fontsize">
				<option value="1">
					特小
				</option>
				<option value="2">
					很小
				</option>
				<option value="3">
					小
				</option>
				<option value="4">
					普通
				</option>
				<option value="5">
					大
				</option>
				<option value="6">
					很大
				</option>
				<option value="7">
					特大
				</option>
			</select>
			<select title="forecolor">
				<option style="color: #000000" value="#000000">
					■■
				</option>
				<option style="color: #FF8080" value="#FF8080">
					■■
				</option>
				<option style="color: #FFFF00" value="#FFFF00">
					■■
				</option>
				<option style="color: #80FF00" value="#80FF00">
					■■
				</option>
				<option style="color: #00FFFF" value="#00FFFF">
					■■
				</option>
				<option style="color: #0000FF" value="#0000FF">
					■■
				</option>
				<option style="color: #FF00FF" value="#FF00FF">
					■■
				</option>
			</select>
			<select title="backcolor">
				<option style="color: #000000" value="#000000">
					■■
				</option>
				<option style="color: #FF8080" value="#FF8080">
					■■
				</option>
				<option style="color: #FFFF00" value="#FFFF00">
					■■
				</option>
				<option style="color: #80FF00" value="#80FF00">
					■■
				</option>
				<option style="color: #00FFFF" value="#00FFFF">
					■■
				</option>
				<option style="color: #0000FF" value="#0000FF">
					■■
				</option>
				<option style="color: #FF00FF" value="#FF00FF">
					■■
				</option>
			</select>
		</div>
		<br style="clear: both" />
		<textarea id="textarea"></textarea>
		<p>
			编辑完，试一下在iframe内外来回点击！
		</p>
	</body>
</html>
