#include <stdio.h>
#ifdef _OPENMP
#include <omp.h>
#endif

int main(int argc, char const *argv[]) {
  int t_id = 0;

  #pragma omp parallel private (t_id)
  {
    #ifdef _OPENMP
    t_id = omp_get_thread_num();
    #endif
    printf("Hello world from %d\n", t_id);
  } /* end parallel */
  return 0;
}
