using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de GeneradorPassword
/// </summary>
public class GeneradorPassword
{ 
    private string pswd;

    public static string codigo = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz1234567890.";
    private Random rnd  = new Random();

    public GeneradorPassword()
    {

        pswd = generador(15);
    }
    public GeneradorPassword(int size)
    {
       if( (size < 6) || (size >= 15) )
        {
            size = 15;



        }
        else
        {
            pswd = generador(size);
        }
    }


    private string generador(int s)
    {

        string cadenaVacia = String.Empty;
       
        for(int i=0; i <= s - 1; i++)
        {
            cadenaVacia += codigo[rnd.Next(0, codigo.Length)];

        }
            
        return cadenaVacia ;
    }

    public string getPW()
    {
        return pswd;
    }

    public static Boolean validar(string p)
    {
        Boolean ok = true;
        for(int i = 0; i <= p.Length - 1; i++)
        {
            if (!codigo.Contains(p[i]))
            {
                ok = false;
                break;
            }
        }
        return ok;
    }

    public Boolean casiIgual(string p)
    {
        Boolean ok = false;

        for(int i=0; i <= p.Length; i++)
        {
            if (pswd.Contains(p.Substring(i,4)))
            {
                ok = true;
                break;
            }
        }

        return ok;
    }
}