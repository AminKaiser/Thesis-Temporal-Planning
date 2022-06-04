#This scripts generates problem file
from random import random, randrange, sample
import sys
from object_list_v2 import *

# input train number and number of line maintenance
train_number = int(sys.argv[1])
Line_maitenace_number = int(sys.argv[2])

static_problem_part = open('static_problem_file.pddl','r')

problem = open("problem_temporal.pddl",'w')

goal = "(:goal\n(and"

for line in static_problem_part:
    problem.write(line);
mant = sample(range(0,len(line_list)),Line_maitenace_number)
for lin in mant:
    problem.write(f"(maintenance-line {line_list[lin]})\n")
trainNo=sample(range(0,len(train_list)),train_number)
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
problem.write("(:metric minimize (total-time))\n)\n")

static_problem_part.close()
problem.close()
