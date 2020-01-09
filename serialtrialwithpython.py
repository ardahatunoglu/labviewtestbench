# car parameter initialization
import math

m = 1235  # kg mass of the vehicle
g = 9.81  # m/s^2 gravitational accelaration
mu = 0.0075  # rolling friction dry road
ro = 1.225  # kg/m^3 air density
c_d = 0.4  # aerodynamic drag coefficient
A = 2  # m^2 frontal area of the vehicle
d = 0.5  # tyre diameter in meters
r=d/2 #radius of the tyre
theta = 0

F_RR = m * g * cos(theta) * mu
F_CR = m * g * sin(theta)

C_1 = 1 * c_d * ro * A / 2
C_2 = F_RR + F_CR
C_3 = m

D_1=C_1*math.pi^2*r^3/30^2
D_2=C_2*r
D_3=C_3*math.pi*r^2/30

T=D_1*n+D_2+D_3*dn/dt


print(C_1)
