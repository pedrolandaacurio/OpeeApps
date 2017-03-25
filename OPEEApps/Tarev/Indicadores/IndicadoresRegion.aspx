<%@ Page Title="Indicadores - Paso 1" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndicadoresRegion.aspx.cs" Inherits="OPEEApps.Tarev.Indicadores.IndicadoresRegion" %>
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
            <div class="panel-heading">Variables</div>
            <div class="panel-body">
                <asp:UpdatePanel runat="server" ID="AgregarVariablesUpdatePanel">
                    <ContentTemplate>
                        <asp:FormView runat="server" ID="AgregarVariablesForm" DataKeyNames="Id" DataSourceID="AgregarVariablesSQLCon" DefaultMode="Insert" CssClass="form-horizontal" Style="width: 100%" OnItemInserted="AgregarVariablesForm_ItemInserted">
                            <InsertItemTemplate>
                                <div class="input-group" style="width: 100%">
                                    <div class="input-group-btn">
                                        <asp:DropDownList Text='<%# Bind("grupo") %>' runat="server" ID="grupoDropDownList" CssClass="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" DataSourceID="DropDownListGruposSQLCon" DataTextField="grupo" DataValueField="grupo" />
                                        <asp:SqlDataSource runat="server" ID="DropDownListGruposSQLCon" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [grupo] FROM [grupos_variables]"></asp:SqlDataSource>
                                    </div>
                                    <asp:TextBox Text='<%# Bind("variable") %>' runat="server" ID="variableTextBox" CssClass="form-control" placeholder="Escriba nombre de la variable" />
                                    <div class="input-group-btn">
                                        <asp:LinkButton runat="server" Text="Agregar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-default" />
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn btn-default" Visible="false" />
                            </InsertItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="AgregarVariablesSQLCon" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [variables] WHERE [Id] = @Id" InsertCommand="INSERT INTO [variables] ([grupo], [variable]) VALUES (@grupo, @variable)" SelectCommand="SELECT * FROM [variables]" UpdateCommand="UPDATE [variables] SET [grupo] = @grupo, [variable] = @variable WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="grupo" Type="String"></asp:Parameter>
                                <asp:Parameter Name="variable" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="grupo" Type="String"></asp:Parameter>
                                <asp:Parameter Name="variable" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">Variables</div>
            <div class="panel-body">
                <asp:UpdatePanel runat="server" ID="VistaVariables">
                    <ContentTemplate>
                        <asp:DropDownList runat="server" ID="SelectordeGrupodeVariables" DataSourceID="SelectorGruposDeVariables" DataTextField="grupo" DataValueField="grupo" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SelectorGruposDeVariables" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [grupo] FROM [variables]"></asp:SqlDataSource>
                        <hr />
                        <asp:ListView runat="server" ID="ListaDeVariablesEnUpdate" DataSourceID="ListaDeVariables" DataKeyNames="Id">
                            <ItemTemplate>
                                <div class="alert alert-dismissible alert-info">
                                    <asp:LinkButton runat="server" class="close" data-dismiss="alert" CommandName="Delete" ID="DeleteButton" CausesValidation="False" OnClientClick="ConfirmacionEliminarVariable()">&times;</asp:LinkButton>
                                    <asp:Label Text='<%# Bind("variable") %>' runat="server" ID="variableLabel" />
                                </div>
                                <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" Visible="false" />
                                <asp:LinkButton runat="server" Visible="false" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />
                                <asp:LinkButton runat="server" Visible="false" Text="Nuevo" CommandName="New" ID="NewButton" CausesValidation="False" />
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="ListaDeVariables" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [variable], [Id] FROM [variables] WHERE ([grupo] = @grupo)" DeleteCommand="DELETE FROM [variables] WHERE [Id] = @Id" InsertCommand="INSERT INTO [variables] ([variable]) VALUES (@variable)" UpdateCommand="UPDATE [variables] SET [variable] = @variable WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="variable" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="SelectordeGrupodeVariables" PropertyName="SelectedValue" Name="grupo" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="variable" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="AgregarVariablesForm" EventName="ItemInserted" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <a runat="server" class="btn btn-block btn-default" href="IndicadoresRegion2.aspx">Siguiente paso</a>
    </div>
    <!--Modal de Información-->
    <div class="modal fade" tabindex="-1" role="dialog" id="InfoRegInd">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Herramienta de Cálculo de de Indicadores</h4>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class=" btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
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

        function ConfirmacionEliminarVariable() {
            confirm("¿Está seguro de eliminar esta variable?")
        }
    </script>
</asp:Content>
