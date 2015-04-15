<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- добавляем taglib prefix для security -->
<!-- теперь можем использовать данный taglib-->

<t:template>
    <!--проверка на условие, если books is !empty тогда заходим в условие-->
    <c:if test = "${!empty books}">
        <!--начало таблицы-->
        <table class="book-list-table">
            <!--столбци-->
            <tr>
                <th>Name</th>
                <th>Genre</th>
                <sec:authorize access="hasRole('admin')">
                    <th>&nbsp;</th>
                </sec:authorize>

            </tr>
            <!--конец столбци-->
            <!--начало строки, цикл, для каждой строки из books (список из Джавы), каждая строка приписывается внутренней переменной book  -->
            <c:forEach items="${books}" var="book">
                <!-- выводим строку -->
                <tr>
                    <td>${book.name}</td>
                    <td>${book.genre}</td>
                    <sec:authorize access="hasRole('admin')">
                        <td><a href="javascript:BookUtil.deleteBook(${book.id})">Delete</a></td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <sec:authorize access="isAuthenticated()">
        <!-- ссылка на addBook с надписью Add book -->
        <!--@RequestMapping(value = "addBook", method = RequestMethod.GET) -->
        <a href="addBook">Add book</a>
    </sec:authorize>


</t:template>

