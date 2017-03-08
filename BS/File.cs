using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BS
{
    public class File
    {
        string filename;
        public int registercounter;
        FileStream fs;
        public BinaryReader br;
        public BinaryWriter bw;
        List<string> field;
        List<tipo> type;
        public Register reg;
        public List<string> devol;

        public File(string fnom, List<string> lista1, List<tipo> lista2)
        {
            filename = fnom;
            registercounter = 0;
            fs = null;
            br = null;
            bw = null;
            if (!System.IO.File.Exists(filename))
            {
                try
                {
                    if (!System.IO.Directory.Exists(@"C:\pingmynetwork\"))
                    {
                        System.IO.Directory.CreateDirectory(@"C:\pingmynetwork\");
                    }

                    fs = new FileStream(filename, FileMode.Create, FileAccess.Write);
                    fs.Close();
                }
                catch (Exception e1)
                {
                    throw new Exception(e1.Message);
                }
            }

            field = new List<string>();
            type = new List<tipo>();

            field.InsertRange(0, lista1);
            type.InsertRange(0, lista2);



            try
            {
                reg = new Register(lista1, lista2);
            }
            catch (Exception e1)
            {
                throw new Exception(e1.Message);
            }
            registercounter = getRegisterCounter();
        }

        int getRegisterCounter()
        {
            int cuenta = 0;
            bool endFile = false;
            if (openFile())
            {
                do
                {
                    try
                    {
                        reg.read(br);
                        cuenta++;
                    }
                    catch (Exception)
                    {
                        endFile = true;
                    }
                } while (endFile == false);
                closeFile();
            }
            return (cuenta);
        }

        public void escribe(List<string> listavalores)
        {
            try
            {
                reg.write(listavalores, bw);
                registercounter++;
            }
            catch (Exception e1)
            {
                throw new Exception(e1.Message);
            }
        }

        public List<string> lee()
        {
            try
            {
                devol = reg.read(br);
            }
            catch (Exception e1)
            {
                throw new Exception(e1.Message);
            }
            return (devol);
        }

        public void trunca()
        {
            fs = new FileStream(filename, FileMode.Truncate);
            fs.Close();
            registercounter = 0;
        }

        public bool openFile()
        {
            try
            {
                fs = new FileStream(filename, FileMode.Open, FileAccess.ReadWrite);
            }
            catch (Exception e1)
            {
                closeFile();
                throw new Exception(e1.Message + "\n" + e1.Source);
            }
            try
            {
                br = new BinaryReader(fs);
            }
            catch (Exception e1)
            {
                closeFile();
                throw new Exception(e1.Message + "\n" + e1.Source);
            }
            try
            {
                bw = new BinaryWriter(fs);
            }
            catch (Exception e1)
            {
                closeFile();
                throw new Exception(e1.Message + "\n" + e1.Source);
            }
            return (true);
        }

        public void closeFile()
        {
            if (br != null)
                br.Close();
            if (bw != null)
                bw.Close();
            if (fs != null)
                fs.Close();
            br = null;
            bw = null;
            fs = null;
        }

        public void startFile()
        {
            fs.Seek(0, SeekOrigin.Begin);
        }

        public void endFile()
        {
            fs.Seek(0, SeekOrigin.End);
        }

    }
}

