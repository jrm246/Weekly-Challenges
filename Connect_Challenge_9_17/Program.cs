using System;
using System.Collections.Generic;

namespace Connect_Challenge_9_17
{
    class Program
    {
        static string Prime(int num){
            if(num == 1){
                return "1";
            }
            bool compute = true;
            List<int> primes = new List<int>();
            int newnum = num;
            int multiplied;
            int powerNum;
            string val;
            while(compute){
                for(int i = 2; i <= newnum; i++){
                    if(newnum % i == 0){
                        primes.Add(i);
                        newnum = newnum / i;
                        break;
                    }
                }
                multiplied = primes[0];
                for(int x = 1; x < primes.Count; x++){
                    multiplied *= primes[x];
                }
                if(multiplied == num){
                    compute = false;
                }
            }

            val = "" + primes[0];
            powerNum = 1;
            for(int z = 1; z < primes.Count; z++){
                if(primes[z-1] == primes[z]){
                    powerNum++;
                }
                else {
                    if(powerNum > 1){
                        val += "^" + powerNum;
                    }
                    powerNum = 1;
                    val += " x " + primes[z];
                }
            }
            if(powerNum > 1){
                val += "^" + powerNum;
            }
            return val;
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Enter a positive integer");
            string input = Console.ReadLine();
            Console.WriteLine(Prime(Convert.ToInt32(input)));
        }
    }
}
