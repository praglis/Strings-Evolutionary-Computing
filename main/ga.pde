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
  
  public void algorithm(int moduloStats){
 
    for(int i=iterator; i<iterations; i++) {
      if(pop.getBest().getFitness()==target.length()){
          printFinalStats();
          break;
      }
            if(i%moduloStats==0){
                this.printStats();
            }
            
            if(this.pop.population.size() > 10000 &&
               this.pop.population.size() < 60000) this.pop.setPns(3);
            else if(this.pop.population.size() >= 60000) this.pop.setPns(1);

            this.step();
    }
    exit();
        
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

 // ************************old code********************************************
  /**
  * @author Daniel Skórczyński
  * @fun changeParameters
  * @brief Change parameters of algorithm
  * @return void
  */
  public void changeParameters(int population, float pm, float pc){
    this.pop_size = population;
    this.pm = pm;
    this.pc = pc;
  }
  
  /**
  * @author Daniel Skórczyński
  * @fun createNewPopulation
  * @brief Delete old and create new population
  * @return void
  */
  /*
  public void createNewPopulation(int population, int len){
    this.iterator = 0;
    this.generations.clear();
    this.generations = new ArrayList<Population>();
    //generations.add(new Population(population, len));    
  }
  */
  /**
  * @author Daniel Skórczyński
  * @fun algorithm
  * @brief Create mating pool, make crossovers (checking probabilities), mutate children accordingly and set best DNA of the generation.
  * @return void
  */
  /*
  private void algorithm(){
    generations.get(iterator).createMatingPool();
    //generations.get(iterator).reproduction(this.pc, this.pm);
    
    
       // Missing mockups!
    
    
    // generations.get(iterator).ChooseBest();
    // Stopping_condition_#1(obj);
    
    // Population generation = 
    //   generations.get(iterator).NaturalSelection(); / ~.DeleteWeakest();
    
    // generations.add(generation);
    
    ++iterator;
  }
  */
  /**
  * @author Daniel Skórczyński
  * @fun auto
  * @brief Automatically run algorithm. Stops when stopping conditions are achieved
  * @return void
  */
  /*
  public void auto(){
    // Stopping conditions class/operators missing!
    for(;;)
      algorithm();
  }
  */
  /**
  * @author Daniel Skórczyński
  * @fun fineStep
  * @brief Passing one generation. Run algorithm one time. 
  * @return void
  */
  /*
  public void fineStep(){
    algorithm();
  }
  */
  /**
  * @author Daniel Skórczyński
  * @fun step
  * @brief Passing "count" generations. Run algorithm "count" times. 
  * @param count of iterations
  * @return void
  */
  /*
  public void step(int count){
    while(count-- > 0){
      algorithm();
    }
  }
  */
 
}
