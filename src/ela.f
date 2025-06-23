C *** VERSION 5/80 LEVEL 3A
C *** ELSYM5 - ELASTIC LAYERED SYSTEM - CONTROL PROGRAM
C *** NUMBER OF ELASTIC LAYERS , MIN OF 1 , MAX OF 5
C *** NUMBER OF LOADS , MIN OF 1 , MAX OF 10
C *** NUMBER OF XY VALUES , MIN OF 1 , MAX OF 5
C *** NUMBER OF Z VALUES , MIN OF 1 , MAX OF 10
C *** BASE MAY BE 'ELASTIC' OR 'RIGID'
C *** WITH RIGID BASE , MAY BE 'FULL FRICTION' OR 'NO FRICTION'
C *** APPROX FORM OF INTEGRATION
C *** GAUSE FOUR POINT WITH NBZ=46
C *** GALE AHLBORN - CIVIL ENGINEERING DEPARTMENT
C                  - TRANSPORTATION ENGINEERING DIVISION
C                  - UNIVERSITY OF CALIFORNIA BERKELEY CA 94720
      MODULE ELSYM5
      use, intrinsic :: iso_fortran_env, only : dp => real64
      IMPLICIT DOUBLE PRECISION(A-H,O-Z)
      PRIVATE
      PUBLIC ELA
      COMMON E(5),V(5),DI(5),R(100),Z(10),EX(32),
     1        CDAB(5,736),AJ1(184),RJ1(184),RJ0(184),
     2        VSE,SSE,RDP,VDP,RSE,TSE,ST1,ST2,ST3,ST4,
     3        WR,WZ,WRL,RL,PRES,RLP,TST1,TST2,TST3,TST4,
     4        NSYM,NSY,NLSW,NBZ,NGQP,NX,NEX,NR,NRC,NZ,NZC,MSW,
     5        NEL,NEI,NI,NBLL,LAY,NTEST,NTSI,ITS,IND,NAB,NBZC,
     6        KSW1,KSW2,KSW3,KSW4,KSW5,KSW6,KSW7,KSW8,KSW9
      COMMON XL(10),YL(10),XP(10),YP(10),LAYZ(10),
     1  ANS(6,100,10),AS(9,3,10),TITLE(40),IXR(100),NLD,NXY,IO
      COMMON / COM2 / GP(184)
      COMMON / COM1 / EI(16,2,2),S(2,2,2),SV(4,9),ISC(4),SA(2,2),
     1 RB(2,2),BA(2,2,2),TB1,TB2,TB3,TB4,TB5,NE,NEXD2,NEIM1

      CONTAINS

      ! FUNCTION ELA(inp) RESULT(RET)
      FUNCTION ELA(veh, thk, mod, poi, wxp, wyp, oxp, oyp,
     1 nlay, nwhl, nloc) RESULT(RET)

      ! real(dp) :: RET(9,3,10)
      real(dp) :: RET(10,3,10)
      real(dp) :: veh(2)
      real(dp) :: thk(5)
      real(dp) :: mod(5)
      real(dp) :: poi(5)
      real(dp) :: wxp(10)
      real(dp) :: wyp(10)
      real(dp) :: oxp(10)
      real(dp) :: oyp(10)
      integer :: nlay
      integer :: nwhl
      integer :: nloc

C      integer :: kkk
C      do kkk = 1, nloc
C      print *, oxp(kkk)
C      end do

      IO=0
      NBZ=46
      NGQP=4
      TST1=68.0
      TST2=0.0001
      NSY=1
      NSYM=1
    4 CALL ELSY1
      ! print *, "elsy1"
    ! 2 CALL ELSYI(inp)
    2 CALL ELSYI(veh, thk, mod, poi, wxp, wyp, oxp, oyp,
     1nlay, nwhl, nloc)
      GO TO ( 20,20,25),NLSW
   25 CALL ELSY2A
      GO TO 16
   20 CALL ELSY2
   21 K4=1
      K1=1
      DO 22 K2=1,NBZ
      DO 22 K3=1,NGQP
      FM=GP(K1)/WRL
      CALL ELSY3 ( FM )
      CALL ELSY3A ( FM )
      CALL ELSY4 (FM,K4)
      K1=K1+1
      K4=K4+4
   22 CONTINUE
   16 K1=1
      RLDWRL=RL/WRL
      DO 24 K2=1,NBZ
      DO 24 K3=1,NGQP
      X=GP(K1)*RLDWRL
      AJ1(K1)=ELSY12(X,1)
      K1=K1+1
   24 CONTINUE
      GO TO ( 36,51),KSW3
   51 NTEST=2
      GO TO 34
   36 K1=1
      WRDWRL=WR/WRL
      DO 26 K2=1,NBZ
      DO 26 K3=1,NGQP
      X=GP(K1)*WRDWRL
      RJ0(K1)=ELSY12(X,0)
      RJ1(K1)=ELSY12(X,1)
      K1=K1+1
   26 CONTINUE
      IF(WR-RL) 49,49,50
   49 NTEST=RL/WR+0.0001
      GO TO 34
   50 NTEST=WR/RL+0.0001
   34 NTEST=NTEST+1
      IF(NTEST-10) 53,53,52
   52 NTEST=10
   53 NTSI=NTEST+1
      DO 47 K1=1,NZ
      KSW4=1
      NZC=K1
      WZ=Z(NZC)
      IF(WZ) 41,40,41
   40 KSW4=2
   41 GO TO ( 43,43,42),NLSW
   42 LAY=1
      GO TO 46
   43 DO 45 K2=1,NEI
      IF(WZ-(DI(K2)+0.001)) 44,44,45
   44 LAY=K2
      GO TO 46
   45 CONTINUE
      LAY=NEL
   46 LAYZ(NZC)=LAY
      CALL ELSY8
      CALL ELSY9
   47 CONTINUE
      KSW3=1
      NRC=NRC+1
      IF(NRC-NR) 48,48,33
   48 WR=R(NRC)
      IF(WR-RL) 36,36,54
   54 WRL=WR
      GO TO ( 21,21,25),NLSW
   33 CALL ELSY11
      NSY=NSY+1
      IF(NSY-NSYM ) 2,2,35
      NSYM=5
      GO TO 4
   35 RET(:9,:,:) = AS
      RETURN
      END FUNCTION ELA

      END MODULE ELSYM5
