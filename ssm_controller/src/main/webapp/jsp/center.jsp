<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
    <link href="${pageContext.request.contextPath}/css/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/Index2.css" rel="stylesheet"/>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <h4>数据列表</h4>
        <div>
            <form action="#" method="post">
                <div class="uinArea" id="uinArea">
                    客户名称：
                    <input type="text" value="${customer.custName}" name="custName" class="inputstyle"/>
                    客户类型：
                    <input type="text" value="${customer.custType}" name="custType" class="inputstyle"/>
                    <button type="submit" style="width:60px;" class="button_blue">查询</button>
                </div>
            </form>
        </div>
        <div class="add"><a class="btn btn-success" onclick="openadd();">新增</a></div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>客户名称</th>
                        <th>客户类型</th>
                        <th>客户电话</th>
                        <th>客户地址</th>
                        <th>所属用户角色</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                      <tr v-for="e in list">
                          <td>{{e.cust_name}}</td>
                          <td>{{e.cust_type}}</td>
                          <td>{{e.cust_phone}}</td>
                          <td>{{e.cust_address}}</td>
                          <td>{{e.cust_link_user}}</td>

                          <td><a href="/user/deletdById>删除</a>
                          </td>
                      </tr>
                      <%--<tr>--%>
                          <%--<td>123</td>--%>
                          <%--<td>123</td>--%>
                          <%--<td>123</td>--%>
                          <%--<td>123</td>--%>
                          <%--<td>123</td>--%>
                          <%--<td><a href="#">删除</a></td>--%>
                      <%--</tr>--%>
                    </tbody>
                </table>
                <div id="page" class="tr"></div>
            </div>
        </div>

        <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">添加客户</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_form" action="/user/addCust" method="post">
                    <div class="control-group">
                        <label class="control-label" for="c_name">客户名称</label>
                        <div class="controls">
                            <input  type="text" id="c_name" name="cust_name" placeholder="客户名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="c_type">客户类型</label>
                        <div class="controls">
                            <input  type="text" id="c_type" name="cust_type" placeholder="客户类型">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="c_phone">客户电话</label>
                        <div class="controls">
                            <input  type="text" id="c_phone" name="cust_phone" placeholder="客户电话">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="c_address">客户地址</label>
                        <div class="controls">
                            <input  type="text" id="c_address" name="cust_address" placeholder="客户地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="rolename">所属用户角色</label>
                        <div class="controls">
                            <select  name="user.uid" id="rolename" placeholder="所属用户角色">
                                <option value="1">超级管理员--测试</option>
                            </select>
                        </div>
                    </div>
                    <input type="submit" >
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn btn-primary" id="add">保存</button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap2.3.2/js/bootstrap.min.js"></script>
<script src="../js/vuejs-2.5.16.js"></script>
<script src="../js/axios-0.18.0.js"></script>

<script type="text/javascript">

    function openadd() {
        $("#myModalLabel").text("添加用户");
        $("#userName").attr("readonly", false);
        $("input").val("");
        $("#addModal").modal("show");
        $("#add").show();
        $("#edt").hide();
    }

    var vue = new Vue({

        el:".w",
        data:{
            //数组中的数据，应该是通过异步请求获取之后再设置
            list:[],
        },
        methods:{
            findAll:function () {

                axios.post("/user/findAllCust").then((response)=>{

                    vue.list = response.data
                    // alert(88888888)
                })
            },
        },
        created:function () {
            //这个钩子函数，当数据初始化完之后
            this.findAll()
        }

    });


    $("#add").click(function () {

        // $("#add_form").submit();

        // var da = $("#add_form").serialize();


        $.ajax({

            url:'/user/addCust',
            type:'post',
            contentType:'application/json;charset=utf-8',
            data:JSON.stringify({

                cust_name:$("#c_name").val(),
                cust_type:$("#c_type").val(),
                cust_phone:$("#c_phone").val(),
                cust_address:$("#c_address").val(),
                cust_link_user:$("#rolename").val(),

            }),
            dataType:'text',
            success :function (result) {

                //点击保存后关闭表单框
                // $("#addModal").hide()
                //同上也是关闭表单框
                $("#addModal").modal("hide");

                // alert(result)
            },
            error: function(e) {
                console.log("error")
            }

        });





    })

</script>
</body>
</html>