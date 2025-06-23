      FUNCTION CHEB (A,N,Z)
C *** FOR USE WITH ELSYM5
C
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION A(12),B(14)
      B(1)=0.
      B(2)=0.
      DO 1 I=1,N
      B(I+2)=Z*B(I+1)-B(I)+A(I)
    1 CONTINUE
      CHEB =.5*(B(N+2)-B(N))
      RETURN
      END
