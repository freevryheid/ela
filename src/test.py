import fmodpy
import numpy as np

ela = fmodpy.fimport('ela.f')

vehicle = np.array([8163.80, 1.0000, 100.0], order='F')
# Wheel X Coordinates - in, Wheel Y Coordinates - in
wheels = np.array([[0.0], [0.0]], order = 'F')
# Result Output X Coordinate - in, Result Output Y Coordinate - in
output = np.array([0.0, 0.0], order='F')

# 1 layer, upper layer to lower layer,
# Layer Thickness - in, Layer Modulus of Elasticity - psi, Poisson's Ratio default
pavement = np.array([[8.0, 10.0, 6.0, 0.0],[432000.0, 1414300.0, 167900.0, 17200.0], [0.35, 0.2, 0.3, 0.4]], order = 'F')
inputs = np.array([vehicle, pavement, wheels, output], order='F')


ret = ela.ela(inputs)

print(ret)
#
