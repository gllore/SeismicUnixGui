	SUBROUTINE THI(TWTT,VT,VB,DZ)
C
C THIS SUBROUTINE COMPUTES THE THICKNESS DZ OF A CONSTANT VEL. GRADIENT 
C LAYER WHEN THE 2-WAY TRAVELTIME FOR THE LAYER (TWTT),TOP AND BOTTOM
C VELOCITIES (VT,VB) ARE KNOWN.THE SPECIAL CASE VT=VB(HOMOGENEOUS LAYER)
C IS ALSO INCLUDED.
C
	IF(VT.NE.VB) GO TO 1
	DZ=TWTT*VT/2.
c HOMOGENEOUS LAYER
	RETURN
C
 1	AUX=(VB-VT)/ALOG(VB/VT)
	DZ=TWTT*AUX/2.
c CONSTANT VEL. GRADIENT LAYER
	RETURN
	END
