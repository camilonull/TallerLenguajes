public class Fibonacci {

   public static void main( String[] args) {
        int n = 10;
        printFibonacciSeries(n);
    }

   public static void printFibonacciSeries(int n) {
        int [] fibonacciSeries = new  int [n];

       if (n >= 1) {
            fibonacciSeries[0] = 0;
        }

       if (n >= 2) {
            fibonacciSeries[1] = 1;
        }

       for (int x = 2; x < n; x++) {
            fibonacciSeries[x] = fibonacciSeries[x - 1] + fibonacciSeries[x - 2];
        }

       System.out.println ("Secuencia de Fibonacci de " + n + " términos:");
        
       for (int x = 0; x < n; x++) {
           System.out.println (fibonacciSeries[x] + " ");
        }
    }
}