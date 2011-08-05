<%--
  author: Bhagwat  Kumar bhagwat(at)intelligrape(dot)com
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>File tree demo</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript src="jqueryFileTree.js"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jqueryFileTree.css')}"/>
    <script type="text/javascript">
        $(function() {
            $('#file-tree').fileTree({
                root:'${basePath}',
                expandSpeed: 1000,
                script: "${createLink(action: 'generateFileList')}"
            }, function(file) {
                alert(file)
            });
        })
    </script>
</head>

<body>
<div class="body">
    <h1>File Manager</h1>

    <h3>Base Path : ${basePath}</h3>

    <div class="browser-panel">
        <div id="file-tree">
            Loading... <img src="${resource(dir: 'images', file: 'spinner.gif')}"/>
        </div>
    </div>
</div>
</body>
</html>
