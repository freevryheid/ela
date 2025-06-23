#include <stdio.h>
// #include "ela.h"

extern void cela(double *ela, double *veh, double *thk, double *mod, double *poi, double *wxpos, double *wypos, double *oxpos, double *oypos, int nlay, int nwhl, int nloc);

int main(void) {
  
  double veh[2] = {10000, 125};
  double wxpos[10] = {0};
  double wypos[10] = {0};
  double  oxpos[10] = {0, 8, 12, 18, 24, 36, 48, 60, 72};
  double  oypos[10] = {0, 0,  0,  0,  0,  0,  0,  0,  0};
  double thk[5] = {8, 10, 36, 0};
  double mod[5] = {100000, 50000, 25000, 1000000};
  double poi[5] = {0.35, 0.35, 0.35, 0.35};
  int nlay = 4;
  int nwhl = 1;
  int nloc = 9;
  double ela[10][3][10];
  char *prop[9][3] = {{ "SXX",  "SYY",  "SZZ"},
                      { "SXY",  "SXZ",  "SYZ"},
                      { "PS1",  "PS2",  "PS3"},
                      {"PSS1", "PSS2", "PSS3"},
                      {  "UX",   "UY",   "UZ"},
                      { "EXX",  "EYY",  "EZZ"},
                      { "EXY",  "EXZ",  "EYZ"},
                      { "PE1",  "PE2",  "PE3"},
                      {"PSE1", "PSE2", "PSE3"}};

    // - Fortran `arr1(i,j,k)` aligns with C `arr2[k-1][j-1][i-1]`.
  // Initialize array
  for (int i = 0; i < 10; ++i)
    for (int j = 0; j < 3; ++j)
      for (int k = 0; k < 10; ++k)
        ela[k][j][i] = 0.0;
  
  cela(&ela[0][0][0], veh, thk, mod, poi, wxpos, wypos, oxpos, oypos, nlay, nwhl, nloc);
  
  for (int k = 0; k < nloc; ++k) {
    // for (int i = 0; i < 9; ++i) {
      // for (int j = 0; j < 3; ++j) {
        printf("%s: %lf\n", prop[4][2], ela[k][2][4]);
      // }
    // }
  }   
  
  return 0;
}
