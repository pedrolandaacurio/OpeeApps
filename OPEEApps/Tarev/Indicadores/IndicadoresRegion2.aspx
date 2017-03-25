<%@ Page Title="Indicadores - Paso 2" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndicadoresRegion2.aspx.cs" Inherits="OPEEApps.Tarev.Indicadores.IndicadoresRegion2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Contenido-->
    <div class="container">
        <div class="text-center">
            <a href="#" data-toggle="modal" data-target="#InfoRegInd">
                <img src="../../img/Logomakr_3TgKee.png" runat="server" width="70" />
            </a>
        </div>
        <hr />
        <!--Aplicativo-->
        <div class="panel panel-default">
            <div class="panel-heading">Indicadores</div>
            <div class="panel-body"></div>
        </div>
    </div>
    <!--Modal de Ingreso exitoso de Variable-->
    <div class="modal fade" tabindex="-1" role="dialog" id="VariableIngresoExistosoModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    Ingreso exitoso
                </div>
            </div>
        </div>
    </div>    
    <script type="text/javascript">
        function VariableIngresoExitoso() {
            $('#VariableIngresoExistosoModal').modal('show');
            setTimeout($('#VariableIngresoExistosoModal').modal('hide'), 5000);
        }
    </script>
</asp:Content>
