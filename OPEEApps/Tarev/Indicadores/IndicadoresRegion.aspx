<%@ Page Title="Indicadores - Nivel Regional" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndicadoresRegion.aspx.cs" Inherits="OPEEApps.Tarev.Indicadores.IndicadoresRegion" %>
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
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">Grupos de variables</div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="VistaGrupoUpdate" runat="server">
                        <ContentTemplate>
                            <asp:ListView ID="GruposVista" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" Visible="false" />
                                    <div class="alert alert-dismissible alert-info">
                                        <asp:LinkButton runat="server" CommandName="Delete" ID="DeleteButton" CausesValidation="False" CssClass="close" OnClientClick="EliminarGrupo()">&times;</asp:LinkButton>
                                        <asp:Label Text='<%# Bind("grupo") %>' runat="server" ID="grupoLabel" />
                                        <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" Visible="false" />
                                        <asp:LinkButton runat="server" Text="Nuevo" CommandName="New" ID="NewButton" CausesValidation="False" Visible="false" />
                                    </div>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <center>No hay grupos de variables aún...</center>
                                </EmptyDataTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [grupos_variables] WHERE [Id] = @Id" InsertCommand="INSERT INTO [grupos_variables] ([grupo]) VALUES (@grupo)" SelectCommand="SELECT * FROM [grupos_variables]" UpdateCommand="UPDATE [grupos_variables] SET [grupo] = @grupo WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="grupo" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="grupo" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="AgregarNuevoGrupo" EventName="ItemInserted" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    <a data-toggle="modal" data-target="#AgregarGrupoModal" href="#" class="btn btn-xs btn-default">Agregar nuevo grupo de variables</a>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Variables</div>
                <div class="panel-body">
                    
                </div>
                <div class="panel-footer">
                    <asp:Button runat="server" ID="AgregarVariableBtn" data-toggle="modal" data-target="#AgregarVariableModal" href="#" class="btn btn-xs btn-default" Text="Agregar nueva variable" />
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Indicadores</div>
                <div class="panel-body"></div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Resultados preliminares</div>
                <div class="panel-body">...</div>
            </div>
        </div>
    </div>
    <!--Modal de Información-->
    <div class="modal fade" tabindex="-1" role="dialog" id="InfoRegInd">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Bienvenido a la Herramienta de Cálculo de de Indicadores (Nivel Regional)</h4>
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
    <!--Modal de Agregar Grupo de Variables-->
    <div class="modal fade" tabindex="-1" role="dialog" id="AgregarGrupoModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Agregar grupo de variables</h4>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="InsertandoGruposUpdate" runat="server">
                        <ContentTemplate>
                            <div class="input-group">
                                <asp:TextBox runat="server" ID="Textboxdeprueba" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:LinkButton runat="server" ID="inpulinkprueba" CssClass="btn btn-default" Text="Ayayay"></asp:LinkButton>
                                </span>
                            </div>
                            <asp:FormView runat="server" ID="AgregarNuevoGrupo" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" RowStyle-Wrap="True">
                                <InsertItemTemplate>
                                    <div class="input-group">
                                <asp:TextBox runat="server" ID="Textboxdeprueba" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:LinkButton runat="server" ID="inpulinkprueba" CssClass="btn btn-default" Text="Ayayay"></asp:LinkButton>
                                </span>
                            </div>
                                    <div class="input-group">
                                            <asp:TextBox Text='<%# Bind("grupo") %>' runat="server" ID="grupoTextBox" CssClass="form-control" placeholder="Escriba el nombre del grupo de variables..." />
                                            <span class="input-group-btn">
                                                <asp:LinkButton runat="server" Text="Insertar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-default" />
                                            </span>
                                        </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="grupoTextBox" CssClass="text-danger" Text="Debe ingresar un nombre al grupo de variables"></asp:RequiredFieldValidator>
                                    <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn btn-default btn-sm" Visible="false" />
                                </InsertItemTemplate>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <!--Modal de Agregar Variables-->
    <div class="modal fade" tabindex="-1" role="dialog" id="AgregarVariableModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Agregar variables</h4>
                </div>
                <div class="modal-body">
                    
                </div>
            </div>
        </div>
    </div>
    <script>
        function EliminarGrupo() {
            return confirm("¿Seguro que quieres eliminar este grupo de variables?")
        }
    </script>
</asp:Content>
