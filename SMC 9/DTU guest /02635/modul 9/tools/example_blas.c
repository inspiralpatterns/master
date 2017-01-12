/* 02635 week 8: example.c */
#include <stdlib.h>
#include <stdio.h>

/* Prototype for BLAS dscal */
void dscal_(
   const int * n,          /* length of array     */
   const double * a,       /* scalar a            */
   double * x,             /* array x             */
   const int * incx        /* array x, stride     */
);

int main(void) {

   int i,incx,n;
   double a, x[5] = {2.0,2.0,2.0,2.0,2.0};

   /* Scale the vector x by 3.0 */
   n = 5;
   a = 3.0;
   incx = 1;
   dscal_(&n, &a, x, &incx);

   /* Print the vector x */
   for (i=0;i<n;i++) printf("x[%d] = %.4g\n", i, x[i]);

   return 0;
}
