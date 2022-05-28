#This scripts generates problem file
from random import random, randrange, sample
import sys
from object_lists import *

n=int(sys.argv[1])
nm=int(sys.argv[2])
demo=open('demo','r')
problem=open("problem-temporal.pddl",'w')
goal="(:goal\n(and"
for line in demo:
    problem.write(line);
mant=sample(range(0,len(line_list)),nm)
for lin in mant:
    #print(line_list[lin])
    problem.write(f"(maintenance-line {line_list[lin]})\n")
trainNo=sample(range(0,len(train_list)),n)
for i in trainNo:
    train=train_list[i]
    name=train[0]
    speed=randrange(10,20,5)
    problem.write(f"\n(=(train-speed {name}){speed})\n")
    problem.write(f"(train-at {name} {train[1][0]})\n")
    problem.write(f"(visited {name} {train[1][0]})\n")
    for stn in train[1][1:]:
        problem.write(f"(stoppage-at {name} {stn})\n")
        goal+=f"(visited {name} {stn})\n"
    
problem.write(")\n")
goal+="))\n"
problem.write(goal)
problem.write("(:metric minimize (total-cost))\n)\n")

demo.close()
problem.close()
