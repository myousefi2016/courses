#!/usr/bin/python

import commands
import os
import pickle
from numpy import *

x0 = loadtxt("eamempAu.txt")
e=array([[0,0,0]])
tmp1=array([])
tmp2=array([])
tmp3=array([])
for i in range(len(x0[:,1])/3):
	tmp1=append(tmp1, x0[i,0])
	tmp1=append(tmp1, x0[i,1])
	tmp1=append(tmp1, x0[i,2])
	tmp1=append(tmp1, x0[i,3])
	tmp1=append(tmp1, x0[i,4])
#	print e
for i in range(101,200):
	tmp2=append(tmp2, x0[i,0])
	tmp2=append(tmp2, x0[i,1])
	tmp2=append(tmp2, x0[i,2])
	tmp2=append(tmp2, x0[i,3])
	tmp2=append(tmp2, x0[i,4])
#	print e

for i in range(201,300):
	tmp3=append(tmp3, x0[i,0])
	tmp3=append(tmp3, x0[i,1])
	tmp3=append(tmp3, x0[i,2])
	tmp3=append(tmp3, x0[i,3])
	tmp3=append(tmp3, x0[i,4])
#	print e
e=delete(e,0,0)

tmp=array([[0,0,0]])
for i in range (0,499):
#	tmp[i,1]=tmp1[i] 
#	tmp[i,2]=tmp2[i] 
#	tmp[i,3]=tmp3[i] 
	tmp=append(tmp, [[tmp1[i] ,tmp2[i] ,tmp3[i]]],axis=0)
print tmp
#fout = open("test.dat","w")
#for i in range(0,len(e[:,0])):
#	fout.write(str(e[i,:])+"\n")
#fout.close
savetxt('test.dat',tmp1.view(float).reshape(-1,1))
#output = open('test.pk1','wb')
#pickle.dump(e,output)
#output.close()
