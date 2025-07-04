      FUNCTION ELSY12 (X,N)
C *** FOR USE WITH ELSYM5
C
C *** EXCLUSIVE ROUTINE ARRAYS
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
C
      DIMENSION B1(12),B2(5),B3(5),B4(12),B5(5),B6(5)
      DIMENSION B7(12),B8(5),B9(5)
C
      DATA  B1                 /-.000000003 , .000000076 ,
     1-.000001762 , .000032460 ,-.000460626 , .004819180 ,-.034893769 ,
     2 .158067102 ,-.370094994 , .265178613 ,-.008723442 , .315455943 /

      DATA  B2                /
     1-.000000001 , .000000018 ,-.000000741 , .000068385 ,-.031111709 /
C
      DATA  B3               /
     1 .000000002 ,-.000000052 , .000003075 ,-.000536522 , 1.99892070 /
C
      DATA  B4                 /-.000000001 , .000000029 ,
     1-.000000762 , .000015887 ,-.000260444 , .003240270 ,-.029175525 ,
     2 .177709120 ,-.661443934 , 1.28799410 ,-1.19180120 , 1.29671754 /
C
      DATA  B5             /
     1 .000000001 ,-.000000021 , .000000914 ,-.000096277 , .093555574 /
C
      DATA  B6            /
     1-.000000002 , .000000062 ,-.000003987 , .000898990 , 2.00180610 /
C
      DATA  B7           / 0.0        , .000000010 ,
     1-.000000300 , .000006870 ,-.000127390 , .001829980 ,-.019569010 ,
     2 .147707600 ,-.730405480 , 2.13203940 ,-3.30639360 , 3.32384070 /
C
      DATA  B8          /
     1 0.0        , .000000040 ,-.000001730 , .000293150 , .469339820 /
C
      DATA  B9         /
     1 0.0        ,-.000000112 , .000008970 ,-.006371780 , 1.98723830 /
C
      NP1=N+1
      IF(X-8.) 14,14,22
   14 XZ=X*X*.0625-2.
      GO TO (16,18,20),NP1
   16 BESS=CHEB(B1,12,XZ)
      GO TO 48
   18 BESS=X*CHEB(B4,12,XZ)/8.0
      GO TO 48
   20 BESS=X*X/64.0*CHEB(B7,12,XZ)
      GO TO 48
   22 XZ=256./(X*X)-2.0
      A=0.78539816
      B=2.3561945
      C=0.797884561
      D=3.9269908
      GO TO (24,26,28),NP1
   24 BESS=-(8.0/X)*CHEB(B2,5,XZ)*SIN(X-A)
      BESS=BESS+CHEB(B3,5,XZ)*COS(X-A)
      BESS=BESS*C/SQRT(X)
      GO TO 48
   26 BESS=-(8.0/X)*CHEB(B5,5,XZ)*SIN(X-B)
      BESS=BESS+CHEB(B6,5,XZ)*COS(X-B)
      BESS=BESS*C/SQRT(X)
      GO TO 48
   28 BESS=-(8.0/X)*CHEB(B8,5,XZ)*SIN(X-D)
      BESS=BESS+CHEB(B9,5,XZ)*COS(X-D)
      BESS=BESS*C/SQRT(X)
   48 ELSY12=BESS
      RETURN
      END
