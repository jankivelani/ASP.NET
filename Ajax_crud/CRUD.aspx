<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="Ajax_crud.CRUD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 29%;
            height: 70px;
        }
        .auto-style3 {
            width: 247px;
        }
        .auto-style4 {
            width: 49px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Name : </td>
                    <td class="auto-style3">
                       <input type="text" id="txt_name"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">City :</td>
                    <td class="auto-style3">
                        <input type="text" id="txt_city"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" id="insert" value="insert" onclick="insertrecord();" />
                        <input type="button" id="display" value="display" onclick="displayrecord();" />
                        <input type="button" id="delete" value="delete" onclick="deleterecord();" />
                        <input type="button" id="update" value="update" onclick="updaterecord();" />
                    </td>
                </tr>
            </table>
            <br />
            <div id="d1">

            </div>

        </div>
    </form>
    <script type ="text/javascript">
        
        function insertrecord() {
            
            var name = document.getElementById("txt_name").value;
            var city = document.getElementById("txt_city").value;

             
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET","insert.aspx?nm=" + name + "&ct=" + city+"&opr=insert", false);
            xmlhttp.send(null);


             document.getElementById("txt_name").value="";
             document.getElementById("txt_city").value ="";

            alert("record inserted succsessfully!");
        }

            function displayrecord() {
      
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET","insert.aspx?opr=display",false);
                xmlhttp.send(null);
                document.getElementById("d1").innerHTML = xmlhttp.responseText;

            
        }

         function deleterecord() {
             var name = document.getElementById("txt_name").value;    
             var xmlhttp = new XMLHttpRequest();
             xmlhttp.open("GET","insert.aspx?nm="+name+"&opr=delete",false);
             xmlhttp.send(null);
             

             document.getElementById("txt_name").value = "";
             displayrecord();
             alert("record deleted succsessfully!");
            
        }
        
         function updaterecord() {
             var oldname = document.getElementById("txt_name").value;
             var newname = document.getElementById("txt_city").value;
             var xmlhttp = new XMLHttpRequest();
             xmlhttp.open("GET","insert.aspx?oldname="+oldname+"&newname="+newname+"&opr=update",false);
             xmlhttp.send(null);
             document.getElementById("d1").innerHTML = xmlhttp.responseText;

             document.getElementById("txt_name").value = "";
             document.getElementById("txt_city").value = "";

             displayrecord();
             alert("record updated succsessfully!");
            
        }
    </script>
</body>
</html>
