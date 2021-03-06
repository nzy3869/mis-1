<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<content tag="title">Edit user</content>

<content tag="content">
    <section class="content-header">
        <h1>
            Edit user
        </h1>
    </section>
    <section class="content">

        <div class="row">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Edit user</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <form role="form" action="<c:url value="/users/update" />" method="POST">
                            <input type="hidden" name="_method" value="put" />
                            <div class="row">
                                <input type="hidden" name="id" value="${user.id}">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>First Name:</label>
                                        <input name="firstName" value="${user.firstName}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Last Name:</label>
                                        <input name="lastName" value="${user.lastName}" class="form-control">
                                    </div>
                                </div>                                    
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input name="email" value="${user.email}" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">                                                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input name="username" value="${user.username}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="password" value="${user.password}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Role</label>
                                        <select name="roleId" class="form-control">
                                            <c:forEach var="role" items="${roles}">
                                                <c:set var="found" scope="page" value="false"/>
                                                <c:forEach var="userRole" items="${user.roles}">
                                                    <c:if test="${role.id==userRole.id}">
                                                        <c:set var="found" scope="page" value="true"/>
                                                    </c:if>                                                    
                                                </c:forEach>
                                                <option value="${role.id}" ${found==true ? 'selected="selected"' : ''}>${role.publicName}</option>
                                            </c:forEach>
                                        </select>                                        
                                    </div>
                                </div>
                            </div>                                
                            <button type="submit" class="btn btn-default">Update</button>
                        </form>
                    </div><!-- /.box-body -->
                </div>
            </div>
        </div>
    </section>
</content>

