<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:template>
<form:form method="post" action="addBook" commandName="book"> <!-- addBook адрес, который в контроллере замапен -->
  <table>
  <tr>
      <td><form:label path="name">
        Name
      </form:label></td>
       <td><form:input path="name" accept-charset="UTF-8" /></td>
       <td><form:errors cssClass="error" path="name"></form:errors></td>
    </tr>
    <tr>
      <td><form:label path="genre">
        Genre
      </form:label></td>
      <td><form:input path="genre" accept-charset="UTF-8" /></td> <!-- form:input type="password" path="genre" /></td> -->
      <td><form:errors cssClass="error" path="genre"></form:errors></td>
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
</t:template>