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
 
  int pop_size;
  float pm;
  float pc;
  int iterations;
  int len;
  
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
  
  // @Daniel
  void algorithm(){
    //for()
      //step(generacji);
  }
  // @Daniel
  /*
  void step(generation, matingPool){
      //create mating pool, make crossovers (checking probabilities), mutate children accordingly and set best DNA of the generation.
      pop.createMatingPool();
      crossovers
      mutations
     
  }*/



}

//
class Population{
  ArrayList<DNA> population; 

  //generates random population, @Magda
  Population(int pop_size, int len){
    population = new ArrayList<DNA>();
    for(int i=0; i<pop_size; i++)
      population.add(new DNA(len));
  }
  
  Population(){
    population = new ArrayList<DNA>();
  }
  
  //@Pawel
  void createMatingPool(){
    // for(int i=0; i<pop_size; i++) DNA.fitness()
    // implementing either a list or a dictionary
    // with probability for each DNA how likely it is for it to become a parent
    //return matingPool;
  }
  
  //@Pawel, getting parent from marting pool
  DNA getParent(){
    return new DNA(5);
  }
  
  //@Magda
  void reproduction(float pc, float pm){
    DNA parentA = getParent();
    DNA parentB = getParent(); 
    DNA child;
    
    float crossover = random(0,1);
    float mutation = random(0,1);
    int midpoints = (int) random(0,8); //hardcoded max. number
    
    if(crossover <= pc){ 
      child = parentA.crossover(parentB, midpoints);
      if(mutation <= pm)
        child.mutate(1);
      population.add(child);
    }
  }

}

//@Pawel
class DNA {
  private char[] genes;
  private int fitness;
  
  void checkifbest(){}
  DNA(int length){
    this.genes = new char[length];
    
    for(int i=0; i<length; i++)
      genes[i] = (char) random(32,126);
  }
  
  /**
  * @fun calculateFitness
  * @brief Calculates fitness value, comparing the object with target.
  * @param target string
  */
  void calculateFitness(String target){
    int fitness = 0;
    for(int i=0; i<target.length(); i++){
      if(genes[i] == target.toCharArray()[i]) fitness++;
    }
    this.fitness = fitness;
  }
  
  /**
  * @fun getFitness
  * @return fitness value
  */
  int getFitness(){
    return this.fitness;
  }
  
  //crossover method (krzyżowanie)
  DNA crossover(DNA partner, int midpoints){
    DNA child = new DNA(5);
    //float pc = random(0,1);
    //we need to implement different crossover methods and choose one of them here
    return child;
  }
  
  /**
  * @fun mutate
  * @brief Performs mutation of the given number of genes.
  * @param number of randlomly affected genes
  */
  void mutate(int numberOfGenes){
    Random generator = new Random();
    int locus;
    for(int i=0; i<numberOfGenes; i++){
      locus = generator.nextInt(genes.length);
      genes[locus] = (char) (generator.nextInt(90) + 32);
    }
  }
  
  /**
  * @fun mutate
  * @brief Performs mutation of the random number of genes.
  */
  void mutate(){
    Random generator = new Random();
    int locus, numberOfGenes;
    numberOfGenes = generator.nextInt(genes.length-1) + 1;
    for(int i=0; i<numberOfGenes; i++){
      locus = generator.nextInt(genes.length);
      genes[locus] = (char) (generator.nextInt(90) + 32);
    }
  }
  
  
  public String toString(){//overriding the toString() method  
  return new String(genes);  
 }  
}
