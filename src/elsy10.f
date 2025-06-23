      SUBROUTINE ELSY10 (H,U,N,IVEC)
C *** FOR USE WITH ELSYM5
C     SYMMETRIC MATRIX
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION H(3,3),U(3,3),W(3),IQ(3)
C
      AN=N
      NMI1=N-1
      IF(IVEC-1)6,1,6
    1 DO 5 I=1,N
      DO 4 J=1,N
      IF(I-J)3,2,3
    2 U(I,J)=1.0
      GO TO 4
    3 U(I,J)=0.0
    4 CONTINUE
    5 CONTINUE
    6 DO 9 I=1,NMI1
      W(I)=0.0
      IPL1=I+1
      DO 8 J=IPL1,N
      IF(W(I)-ABS(H(I,J)))7,7,8
    7 W(I)=ABS(H(I,J))
      IQ(I)=J
    8 CONTINUE
    9 CONTINUE
   10 DO 12 I=1,NMI1
C
      IF(I-1) 11,11,17
   17 IF(XMAX-W(I)) 11,12,12
C
   11 XMAX=W(I)
      IPIV=I
      JPIV=IQ(I)
   12 CONTINUE
      IF(XMAX-1.E-12/AN)30,30,13
   13 Z=H(IPIV,IPIV)-H(JPIV,JPIV)
C
C     Y=2.D0*H(IPIV,JPIV) ***
C     TA=Y/(DABS(Z)+DSQRT(Z*Z+Y*Y)) ***
C     IF(Z.LT.0.0) TA=-TA ***
C     CO=1.D0/DSQRT(1.D0+TA*TA) ***
      Y=2.0*H(IPIV,JPIV)
      TA=Y/(ABS(Z)+SQRT(Z*Z+Y*Y))
      IF(Z) 18,19,19
   18 TA=-TA
   19 CO=1.0/SQRT(1.0+TA*TA)
C
      SI=TA*CO
      HII=H(IPIV,IPIV)
      HJJ=H(JPIV,JPIV)
      HIJ=H(IPIV,JPIV)
      DO 14 K=1,N
      HTE=H(K,IPIV)
      H(K,IPIV)=H(K,IPIV)*CO+H(K,JPIV)*SI
      H(K,JPIV)=H(K,JPIV)*CO-HTE*SI
      H(IPIV,K)=H(K,IPIV)
   14 H(JPIV,K)=H(K,JPIV)
      H(IPIV,JPIV)=0
      H(JPIV,IPIV)=0
      AA=HIJ*TA
      H(IPIV,IPIV)=HII+AA
      H(JPIV,JPIV)=HJJ-AA
      IF(IVEC) 6,6,15
   15 DO 16 K=1,N
      UTE=U(K,IPIV)
      U(K,IPIV)=U(K,IPIV)*CO+U(K,JPIV)*SI
   16 U(K,JPIV)=U(K,JPIV)*CO-UTE*SI
      GO TO 6
   30 RETURN
      END
