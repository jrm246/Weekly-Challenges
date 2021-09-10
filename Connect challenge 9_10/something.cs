using System;

namespace something
{
    class Program
    {
        public static string GiveMeSomething(string s) {
            return "something " + s;
        }

        static void Main(string[] args)
        {
            string x = Console.ReadLine();
            Console.WriteLine(GiveMeSomething(x));
        }
    }
}