﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OPEEApps.Tarev.Indicadores
{
    public partial class IndicadoresRegion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AgregarVariablesForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "VariableIngresoExitoso();", true);
        }
    }
}