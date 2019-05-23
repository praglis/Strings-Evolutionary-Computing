class Population
{
    ArrayList<DNA> population;
    DNA best;
    ArrayList<DNA> matingPool;

    String target;
    int pop_size;
    double pm;
    double pc;
    int maxCrossPoints;
    int maxMutPoints;
    int generation;

    //generates RANDOM population
    Population(int pop_size, String target, double pm, double pc, int maxCross, int maxMut){
        population = new ArrayList<>();
        this.pop_size = pop_size;
        this.pm = pm;
        this.pc = pc;
        this.target = target;
        for(int i=0; i<pop_size; i++)
            population.add(new DNA(target));
        this.maxCrossPoints = maxCross;
        this.maxMutPoints = maxMut;
        this.setBest();
        this.generation = 0;
    }

    void createMatingPool(){
        this.matingPool = new ArrayList<>();

        if(best.getFitness()==0) {
            matingPool.addAll(population);
        }
        else{
            int max=this.best.getFitness()+1;

            for(int i=0; i<this.population.size(); i++){
                int fit =  this.population.get(i).getFitness();
                int n = (int) ((100.0 *fit/max)/10);
                for (int x=0; x<n; x++)
                    matingPool.add(this.population.get(i));
            }

        }

    }



    void reproduction(){
        this.createMatingPool();
        for(int i=0; i<=pop_size-2;) {
            DNA parentA = getParent();
            DNA parentB = getParent();

            double crossover = random(0,1);
            double mutation;
            int midpoints = (int) (random(0,this.maxCrossPoints) + 1);

            if (crossover <= this.pc) {

                DNA[] children = parentA.crossover(parentB.getGenes(), midpoints, this.target);

                for (int j = 0; j < 2; j++) {
                    mutation = random(0,1);
                    if (mutation <= this.pm) children[j].mutate(this.maxMutPoints);
                }

                population.set(i,children[0]);
                population.set(i+1,children[1]);
                i+=2;
            }

        }

        this.generation++;
    }
   
    //--------- setters ----------------------
    void setBest(){
        best = population.get(0);
        for(int i=0; i<population.size(); i++)
            if(population.get(i).getFitness() > best.getFitness()) best = population.get(i);
    }

    
    //--------- getters ----------------------
    public DNA getBest(){
        return this.best;
    }

    DNA getParent(){
        int i =(int)(random(0,this.matingPool.size()));
        return this.matingPool.get(i);
    }

    //--------- print functions ----------------------
    void printPopulation(){
        System.out.println("Generation nuber:"+this.generation);
        for(int i=0; i<population.size(); i++)
            System.out.println(population.get(i).toString());
    }
}
