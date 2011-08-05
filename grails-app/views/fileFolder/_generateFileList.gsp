<%--
  author: Bhagwat  Kumar bhagwat(at)intelligrape(dot)com
--%>
<ul class="jqueryFileTree" style="display:none;">
    <g:each in="${dirList}" var="directory">
        <li class="directory collapsed ">
            <a href="#" rel="${dir + directory.name + File.separator}">${directory.name}</a>
        </li>
    </g:each>
    <g:each in="${fileList}" var="file">
        <g:set var="dotIndex" value="${file.name.lastIndexOf('.')}"/>
        <g:set var="extension" value="${dotIndex > 0 ? file.name.substring(dotIndex + 1) : ''}"/>
        <li class="file ext_${extension}" id="${dir + file.name}">
            <a href="#" rel="${dir + file.name}">${file.name}</a>
        </li>
    </g:each>
</ul>
