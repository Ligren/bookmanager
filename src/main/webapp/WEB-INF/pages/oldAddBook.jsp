<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <!--заголовок на вкладке-->
  <title>Add Book</title>
</head>
<body>

<!--все что в тэге form:form ассоциируется с контроллером-->
<!-- (value = "addBook", method = RequestMethod.POST) -->
<!-- method="post" method = RequestMethod.POST ++ action="addBook" value = "addBook" ++ commandName="book" -->
<!--ассоциируетсяс контроллером (value = "addBook", method = RequestMethod.POST)-->
<!--сущность Book commandName="book"-->
<!--@RequestMapping(value = "addBook", method = RequestMethod.POST)-->
<form:form method="post" action="addBook" commandName="book">
  <table>
    <tr>
      <td><form:label path="name">
        Name
      </form:label></td>
      <td><form:input path="name" /></td>
      <td><form:errors path="name"></form:errors></td>
    </tr>
    <tr>
      <td><form:label path="genre">
        Genre
      </form:label></td>
      <td><form:input path="genre" /></td> <!-- form:input type="password" path="genre" /></td> -->
      <td><form:errors path="genre"></form:errors></td>
    </tr>
    <tr>
      <!--Предназначен для создания одной ячейки таблицы. Тег <td> должен размещаться внутри контейнера <tr>, который в свою очередь располагается внутри тега <table>. -->
      <!-- кнопка с надписью Add Book типа submit (представлять)-->
      <!-- colspan="2" объединение 2х ячеек в одну-->
      <!-- атрибуеы тега <input>
      "text" - текстовое поле
      "password" поле с паролем
      "radio" переключатель,
      "checkbox" флажок
      "hidden" скрытое поле
      "button" кнопка
      "submit" кнопка для отправки формы
      "reset" кнопка для очистки формы
      "file" поле для отправки файла
      "image" кнопка с изображением-->
      <td colspan="2"><input type="submit" value="Add Book" /></td>
    </tr>
  </table>
</form:form>

</body>
</html>
