import java.util.function.*;
import java.util.*;

class Population
{
    ArrayList<DNA> population;
    int pop_size;
    int pop_multiplier = 1;
    int generation;
    
    ArrayList<DNA> matingPool;
    DNA best;

    Population(int pop_size, String target){
        population = new ArrayList<DNA>();
        for(int i=0; i<pop_size; i++)
            population.add(new DNA(target));
        this.setBest();
        this.generation = 0;
        this.pop_size = pop_size;
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

    void reproduction(int pop_size, int maxCrossPoints, int maxMutPoints, float pc, float pm, String target){
        this.createMatingPool();
        for(int i=0; i<=pop_size-2;) {
            DNA parentA = getParent();
            DNA parentB = getParent();

            double crossover = random(0,1);
            double mutation;
            int midpoints = (int) (random(0,maxCrossPoints) + 1);

            if (crossover <= pc) {
 
                DNA[] children = parentA.crossover(parentB.getGenes(), midpoints, target);

                for (int j = 0; j < 2; j++) {
                    mutation = random(0,1);
                    if (mutation <= pm) children[j].mutate(maxMutPoints);
                }
                
                population.add(i,children[0]);
                population.add(i+1,children[1]);
                i+=2;
            }
        }
        
        this.setBest();
        this.naturalSelection();
        this.setBest();

    }
    
    int minFitness(){
        int min = Integer.MAX_VALUE;
        for(int i = 0; i < population.size(); i++ ){
          if(this.population.get(i).getFitness() < min) min = this.population.get(i).getFitness();
        }
        
        return min;
    }
    
    void naturalSelection(){
        Collections.sort(this.population);
        for(int i = 0; i < this.population.size() - (pop_size * pop_multiplier) / pop_size; i++){
            this.population.remove(0);
        }
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
