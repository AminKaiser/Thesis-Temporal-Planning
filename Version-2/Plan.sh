echo "genarating Problem"
python3 problem_generator_v2.py $1 $2
echo "Searching for Plan....."
./lpg-td -o domain_temporal.pddl -f problem_temporal.pddl -quality -out train_plan
echo "Finish"