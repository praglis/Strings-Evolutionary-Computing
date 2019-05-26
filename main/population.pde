import java.util.function.*;

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
    
    private int pns = 3;

    Population(int pop_size, String target, double pm, double pc, int maxCross, int maxMut){
        population = new ArrayList<DNA>();
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
        this.matingPool = new ArrayList<DNA>();

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
                //println ("A[" + parentA.getFitness() + "]: " + parentA.toString());
                //println ("B[" + parentB.getFitness() + "]: " + parentB.toString());
              
                DNA[] children = parentA.crossover(parentB.getGenes(), midpoints, this.target);

                for (int j = 0; j < 2; j++) {
                    mutation = random(0,1);
                    if (mutation <= this.pm) children[j].mutate(this.maxMutPoints);
                }
                
                //println ("AxB["+children[0].getFitness()+"] #1: " + children[0].toString());
                //println ("AxB["+children[1].getFitness()+"] #2: " + children[1].toString());

                population.add(i,children[0]);
                population.add(i+1,children[1]);
                i+=2;
            }
        }
        
        this.setBest();
        this.naturalSelection(0);
        this.setBest();
        this.generation++;
    }
    
    int minFitness(){
        int min = Integer.MAX_VALUE;
        for(int i = 0; i < population.size(); i++ ){
          if(this.population.get(i).getFitness() < min) min = this.population.get(i).getFitness();
        }
        
        return min;
    }
    
    void naturalSelection(int count){
        int min = this.getBest().getFitness()-pns;
        if(min < 0) min = 0;
        
        if(count == 0) count = -1;
        for(int i = 0, k = 0; i < this.population.size(); i++){
            if(this.population.get(i).getFitness() == min){
                this.population.remove(i);
                if(++k == count) break;
            }
        }
    }
   
    //--------- setters ----------------------
    void setBest(){
        best = population.get(0);
        for(int i=0; i<population.size(); i++)
            if(population.get(i).getFitness() > best.getFitness()) best = population.get(i);
    }
    
    public void setPns(int pns){
        this.pns = pns;
    }

    
    //--------- getters ----------------------
    public DNA getBest(){
        return this.best;
    }

    DNA getParent(){
        int i =(int)(random(0,this.matingPool.size()));
        return this.matingPool.get(i);
    }
    
    public int getPns(){ return this.pns; } 

    //--------- print functions ----------------------
    void printPopulation(){
        System.out.println("Generation nuber:"+this.generation);
        for(int i=0; i<population.size(); i++)
            System.out.println(population.get(i).toString());
    }
}
