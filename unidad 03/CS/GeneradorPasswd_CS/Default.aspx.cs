using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    
    protected void btnObtener_Click(object sender, EventArgs e)
    {
        int numero = int.Parse(ddlTamaño.SelectedValue);


        GeneradorPassword  generarPswd = new GeneradorPassword(numero);
        
        lblResultado.Text = " "+generarPswd.getPW();
       

    }

    protected void btnValidar_Click(object sender, EventArgs e)
    {

       

        lblResultado.Text = "" + GeneradorPassword.validar( txbValidar.Text);
    }
}