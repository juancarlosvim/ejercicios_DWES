using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string frase = "Hola mudno";
        //Response.Write(contarCaracteres(frase));
        //Response.Write(contarCaracteres("Prueba de frase", 'e'));
        lblResultado.Visible = false;
    }


    private object contarCaracteres(string frase)
    {

        
        return frase.ToLower();

    }
       

    private object contarCaracteres(string frase, char vocal)
    {

        frase = frase.ToLower();
        

        Boolean encontrado;
        int contador = 0;
        if (vocal==null)
        {
            encontrado = false;

            for (int i= 0;i <= frase.Length- 1; i++){

                for(int j=i+1;j<=frase.Length -1; j++)
                {
                    if (frase[i] == frase[j])
                    {
                        encontrado = true;
                        break;
                    }
                }
            }
            return encontrado;
        }else
        {
            contador =0;
            for(int i=0;i<=frase.Length-1; i++)
            {
                if(vocal == frase[i])
                {
                    contador +=1;
                }
            }

            return contador;

        }


    }


    protected void btnCalcular_Click(object sender, EventArgs e)
    {

       
            //String.isNullOrEmpty compruebo si esta vacio 
        if (String.IsNullOrEmpty(txbLetra.Text))
        {
            lblResultado.Visible = true;
            //Response.Write("Entro el if");
            lblResultado.Text = " " + contarCaracteres(txbFrase.Text);
           
        }
        else{

            lblResultado.Visible = true;
            lblResultado.Text = "Numero de veces de la letra " +txbLetra.Text+ " es de =>  "+ contarCaracteres(txbFrase.Text, char.Parse(txbLetra.Text));
        }
        

    }
}