class GA{
  ArrayList<Population> generations;
 
  // Hermetyzacja !
  int pop_size;
  int iterations;
  int len;
  float pm;
  float pc;
  
  private int iterator = 0;
  
  // @Magda
  GA(int iterations, int pop_size, float pm, float pc, int len){
    this.iterations = iterations;
    this.pop_size = pop_size;
    this.pm = pm;
    this.pc = pc;
    this.len = len;
    this.generations = new ArrayList<Population>();
    //generations.add(new Population(pop_size, len));
  }
  
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
  public void createNewPopulation(int population, int len){
    this.iterator = 0;
    this.generations.clear();
    this.generations = new ArrayList<Population>();
    //generations.add(new Population(population, len));    
  }
  
  /**
  * @author Daniel Skórczyński
  * @fun algorithm
  * @brief Create mating pool, make crossovers (checking probabilities), mutate children accordingly and set best DNA of the generation.
  * @return void
  */
  private void algorithm(){
    generations.get(iterator).createMatingPool();
    //generations.get(iterator).reproduction(this.pc, this.pm);
    
    /**
        Missing mockups!
    */
    
    // generations.get(iterator).ChooseBest();
    // Stopping_condition_#1(obj);
    
    // Population generation = 
    //   generations.get(iterator).NaturalSelection(); / ~.DeleteWeakest();
    
    // generations.add(generation);
    
    ++iterator;
  }
  
  /**
  * @author Daniel Skórczyński
  * @fun auto
  * @brief Automatically run algorithm. Stops when stopping conditions are achieved
  * @return void
  */
  public void auto(){
    // Stopping conditions class/operators missing!
    for(;;)
      algorithm();
  }
  
  /**
  * @author Daniel Skórczyński
  * @fun fineStep
  * @brief Passing one generation. Run algorithm one time. 
  * @return void
  */
  public void fineStep(){
    algorithm();
  }
  
  /**
  * @author Daniel Skórczyński
  * @fun step
  * @brief Passing "count" generations. Run algorithm "count" times. 
  * @param count of iterations
  * @return void
  */
  public void step(int count){
    while(count-- > 0){
      algorithm();
    }
  }
  
  /**
  * @author Daniel Skórczyński
  * @fun getIterator
  * @brief Returns algorithm iterator
  * @return int iterator
  */
  public int getIterator() {return iterator;}
}
