#!/usr/bin/python

from numpy import *
from scipy import *
print __version__

a=5.0
A=array([a])

for i in range(0,10000):
	A=append(A,[a+0.0001*i], axis=0)
A=delete(A,0,0)
A=A.T

fout = open("a0.txt","w")
for x in range(0,len(A[:])):
	fout.write(str(A[x])+"\n")
fout.close
