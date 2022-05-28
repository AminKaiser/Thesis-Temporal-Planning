echo "genarating Problem"
python3 problem_generator.py $1 $2
echo "Searching Plan....."
./lpg-td -o domain_temporal.pddl -f problem-temporal.pddl -quality -timesteps -out plan
echo "Finish"