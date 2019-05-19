import java.util.Random;
void setup() {
  size(640, 360);
  
  String  target = "Phrase to find"; // ASCII characters: <32,126>
  int length = target.length();
  
}

//@Magda with help
void draw(){
  // print: the best fit, total generations, average fitness, total population, mutation rate etc.
  // print: all generated phrases
}

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
    generations.add(new Population(pop_size, len));
  }
  
  /**
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
  * @fun createNewPopulation
  * @brief Delete old and create new population
  * @return void
  */
  public void createNewPopulation(int population, int len){
    this.iterator = 0;
    this.generations.clear();
    this.generations = new ArrayList<Population>();
    generations.add(new Population(population, len));    
  }
  
  /**
  * @fun algorithm
  * @brief Create mating pool, make crossovers (checking probabilities), mutate children accordingly and set best DNA of the generation.
  * @return void
  */
  private void algorithm(){
    generations.get(iterator).createMatingPool();
    generations.get(iterator).reproduction(this.pc, this.pm);
    
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
  * @fun fineStep
  * @brief Passing one generation. Run algorithm one time. 
  * @return void
  */
  public void fineStep(){
    algorithm();
  }
  
  /**
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
  * @fun getIterator
  * @brief Returns algorithm iterator
  * @return int iterator
  */
  public int getIterator() {return iterator;}
}

//
class Population{
  ArrayList<DNA> population; 
  DNA best;

  //generates random population, @Magda
  Population(int pop_size, int len){
    population = new ArrayList<DNA>();
    for(int i=0; i<pop_size; i++)
      population.add(new DNA(len));
  }
  
  Population(){
    population = new ArrayList<DNA>();
  }
  
  /**
  * @author Paweł Raglis
  * @fun createMatingPool
  * @brief Calculates propability of being parent for each chromosome (DNA object) in the population based on its fitness value.
  * @return DNA array of size 100 - one element corresponds to 1% chance of being parent
  * @see getParent
  */
  DNA[] createMatingPool(){
    DNA[] matingPool = new DNA[100];
    int propability, fitnessSum = 0, k =0;
    for(int i=0; i<this.population.size(); i++) fitnessSum += this.population.get(i).getFitness();
    for(int i=0; i<this.population.size(); i++) {
      propability = this.population.get(i).getFitness() / fitnessSum * 100;
      for(int j=0; j<propability; j++, k++) matingPool[k] = this.population.get(i);
    }
    return matingPool;
  }
  
/**
  * @author Paweł Raglis
  * @fun getParent
  * @brief Returns random chromosome for being parent from matingPool based on previously calculated propability. See createMatingPool()
  * @param mating pool (DNA array)
  * @return randomly chosen parent
  * @see createMatingPool
  */
  DNA getParent(DNA[] matingPool){
    Random generator = new Random();
    return matingPool[generator.nextInt(matingPool.length)];
  }
  
  /**
  * @fun checkIfBetter
  * @brief Checks if given DNA object has higher fitness value than the best from the population.
  * @param DNA object given to compare with the best from the population
  * @return DNA object with higher fitness value
  */
  public DNA checkIfBetter(DNA pretender){
    if(pretender.getFitness() > this.best.getFitness()) return pretender;
    else return this.best;
  }
  
  /**
  * @fun compareDNA
  * @brief Compares fitness values of given DNA instances.
  * @param DNA object given to compare with another
  * @param DNA object given to compare with another
  * @return DNA object with higher fitness value
  */
  public DNA compareDNA(DNA chromosome1, DNA chromosome2){
    if(chromosome1.getFitness() >= chromosome2.getFitness()) return chromosome1;
    else return chromosome2;
  }
  
  //@Magda
  void reproduction(float pc, float pm){
    DNA[] matingPool = createMatingPool();
    DNA parentA = getParent(matingPool);
    DNA parentB = getParent(matingPool); 
    DNA child;
    
    float crossover = random(0,1);
    float mutation;
    int midpoints = (int) random(0,8); //hardcoded max. number
    
    if(crossover <= pc){ 
      DNA[] children = parentA.crossover(parentB, midpoints);
      
      for(int i=0; i<2; i++){
        mutation = random(0,1);
        if(mutation <= pm) children[i].mutate();
        population.add(children[i]);
      }
    }
  }

}

/**
* @author Paweł Raglis
* @class DNA
* @brief Instances of this class represent chromosomes.
*/
class DNA {
  private char[] genes;
  private int fitness;
  
  DNA(int length){
    this.genes = new char[length];
    
    for(int i=0; i<length; i++)
      genes[i] = (char) random(32,126);
  }
  
  DNA(char[] genes){
    this.genes = new char[genes.length];
    
    for(int i=0; i<genes.length; i++)
      this.genes[i] = genes[i];
  }
  
  public char[] getGenes(){
    return this.genes;
  }
  
  public int getFitness(){
    return this.fitness;
  }
  
  /**
  * @fun calculateFitness
  * @brief Calculates fitness value, comparing the object with target.
  * @param target string
  */
  public void calculateFitness(String target){
    int fitness = 0;
    for(int i=0; i<target.length(); i++){
      if(genes[i] == target.toCharArray()[i]) fitness++;
    }
    this.fitness = fitness;
  }
  
  /**
  * @fun crossover
  * @brief Performs an crossover between the object and given partner.
  * @param stands for partner for the object to crossover with
  * @param number of randlomly chosen crossover points
  * @return DNA array containing two children - outcome of crossover
  */
  public DNA[] crossover(DNA partner, int crossoverPointsCount){
    char[] genes1 = new char[this.toString().length()];
    char[] genes2 = new char[partner.toString().length()];
    Random generator = new Random();
    boolean cPoints[] = new boolean[genes.length];
    int cPoint;
    
    for(int i=0; i<crossoverPointsCount; i++){
      cPoint = generator.nextInt(genes1.length-1);
      if(cPoints[cPoint]) i--;
      else cPoints[cPoint] = true;
    }
    
    boolean parentSwitch = true;
    
     for(int i=0; i<genes.length; i++){
    
      if(parentSwitch){
          genes1[i] = this.getGenes()[i];
          genes2[i] = partner.getGenes()[i];
      }
      else {
        genes1[i] = partner.getGenes()[i];
        genes2[i] = this.getGenes()[i];
      } 
      if (cPoints[i] == true) parentSwitch = !parentSwitch;
    }
     DNA[] children = {new DNA(genes1), new DNA(genes2)};
    return children;
  }
  
  /**
  * @fun mutate
  * @brief Performs mutation of the given number of genes.
  * @param number of randlomly affected genes
  */
  public void mutate(int genesCount){
    Random generator = new Random();
    int locus;
    for(int i=0; i<genesCount; i++){
      locus = generator.nextInt(genes.length);
      genes[locus] = (char) (generator.nextInt(90) + 32);
    }
  }
  
  /**
  * @fun mutate
  * @brief Performs mutation of the random number of genes.
  */
  public void mutate(){
    Random generator = new Random();
    int locus, genesCount;
    genesCount = generator.nextInt(genes.length-1) + 1;
    for(int i=0; i<genesCount; i++){
      locus = generator.nextInt(genes.length);
      genes[locus] = (char) (generator.nextInt(90) + 32);
    }
  }
  
  public String toString(){//overriding the toString() method  
    return new String(genes);  
  }  
}
