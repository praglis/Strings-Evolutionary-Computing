class GA{
 
  Population pop;
 
  String target;
  int pop_size;
  int iterations;
  float pm;
  float pc;
  int maxCrossPoints;
  int maxMutPoints;
  
  private int iterator = 0;
  
 
  
  // @Magda
  GA( String target, int pop_size, int iterations, float pm, float pc, int maxCross, int maxMut){
    //algorithm parameters:
    this.target = target;
    this.pop_size = pop_size;
    this.iterations = iterations;
    this.pm = pm;
    this.pc = pc;
    this.maxCrossPoints = maxCross;
    this.maxMutPoints = maxMut;
    
    //creating population:
    pop = new Population(pop_size, target);
    
  }
  
  //1 step of algortithm, next generation of population
  public void step(){
     pop.createMatingPool();
     pop.reproduction(this.pop_size, this.maxCrossPoints, this.maxMutPoints, this.pc, this.pm, this.target);
     iterator++;
  }
 
  //printing to the console best fit and number of generations
  public void printStats(){
    String best = pop.getBest().toString();
    println("\nBest fit[" + pop.getBest().getFitness()+ "] #" + this.iterator + ": ");
    println(best);
    println("Pop. size: " + pop.population.size());
  }
  
  public void printFinalStats(){
    println("\nString \"" + this.target + "\" was found.");
    println("Number of generations: " + this.iterator);
  }
  
  /**
  * @author Daniel Skórczyński
  * @fun getIterator
  * @brief Returns algorithm iterator
  * @return int iterator
  */
  public int getIterator() {return iterator;}
}
