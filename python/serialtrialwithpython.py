import scipy
import math
import numpy as np
import pandas as pd
import csv
import matplotlib.pyplot as plt
from numpy import diff

# car parameter initialization

m = 1800  # kg mass of the vehicle
g = 9.81  # m/s^2 gravitational accelaration
mu = 0.008  # rolling friction dry road
ro = 1.225  # kg/m^3 air density
c_d = 0.35  # aerodynamic drag coefficient
A = 3.5  # m^2 frontal area of the vehicle
d = 0.5  # tyre diameter in meters
r = d / 2  # radius of the tyre
theta = 0

F_RR = m * g * math.cos(theta) * mu
F_CR = m * g * math.sin(theta)

C_1 = 1 * c_d * ro * A / 2
C_2 = F_RR + F_CR
C_3 = m

D_1 = C_1 * math.pi ** 2 * r ** 3 / 30 ** 2
D_2 = C_2 * r
D_3 = C_3 * math.pi * r ** 2 / 30

print(C_1)
print(C_2)
print(C_3)
print(D_1)
print(D_2)
print(D_3)

t = []  # time values
n = []  # rpm values
T = []  # torque values

with open('wltp.csv', 'r') as f:  # reading the csv file
    csvReader = csv.reader(f, delimiter=';')
    for row in csvReader:
        t.append(row[0])
        n.append(row[2])
dt = 1
n = np.asfarray(n, float)  # conversion to numpy float
dn = np.diff(n) / dt
t[0] = str(0.0)
t = np.asfarray(t, float)

dn = np.append(dn, [0.0])

T = (n ** 2 * D_1 + D_2 + dn * D_3)/4


plt.plot(t[778:1800], T[778:1800])
plt.xlabel('Time(s)')
plt.ylabel('Torque(N.m)')
plt.show()

np.savetxt("torque.csv", T, delimiter=";")