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
  
  DNA(char[] genes){
    this.genes = new char[genes.length];
    
    for(int i=0; i<genes.length; i++)
      this.genes[i] = genes[i];
  }
  
  char[] getGenes(){
    return this.genes;
  }
  
  int getFitness(){
    return this.fitness;
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
  * @fun crossover
  * @brief Performs an crossover between the object and given partner.
  * @param stands for partner for the object to crossover with
  * @param number of randlomly chosen crossover points
  * @return DNA array containing two children - outcome of crossover
  */
  DNA[] crossover(DNA partner, int crossoverPointsCount){
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
  void mutate(int genesCount){
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
  void mutate(){
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
