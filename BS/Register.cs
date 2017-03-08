using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BS
{
    public enum tipo
    {
        cadena = 1,
        entero = 2
    }

     public class Register
    {
        List<string> fields;
        List<tipo> types;
        int fieldCounter;

        public Register(List<string> lista1, List<tipo> lista2)
        {
            int i = 0;
            fields = new List<string>();
            types = new List<tipo>();
            //for (i = 0; i < lista1.Count; i++)
            //{
            fields.InsertRange(0, lista1);
            types.InsertRange(0, lista2);

            //}
            fieldCounter = lista1.Count;

        }

        public void write(List<string> valuelist, BinaryWriter bw)
        {
            int entero = 0;

            try
            {
                for (int i = 0; i < valuelist.Count; i++)
                {
                    switch (types[i])
                    {
                        case tipo.cadena:
                            bw.Write(valuelist[i].ToString());
                            break;
                        case tipo.entero:
                            Int32.TryParse(valuelist[i], out entero);
                            bw.Write(entero);
                            break;
                        default:
                            throw new Exception("");
                    }
                }
            }
            catch (Exception e1)
            {
                throw new Exception(e1.Message + "\n" + e1.Source);
            }
        }


        public List<string> read(BinaryReader br)
        {
            List<string> devol;
            devol = new List<string>();
            try
            {
                for (int i = 0; i < fieldCounter; i++)
                {
                    switch (types[i])
                    {
                        case tipo.cadena:
                            devol.Add(br.ReadString());
                            break;
                        case tipo.entero:
                            devol.Add(br.ReadInt32().ToString());
                            break;
                        default:
                            throw new Exception("");
                    }
                }
            }
            catch (Exception e1)
            {
                throw new Exception(e1.Message + "\n" + e1.Source);
            }
            return (devol);
        }
    }
}


