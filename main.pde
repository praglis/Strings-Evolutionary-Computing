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
    for()
      step(generacji)
  }
  // @Daniel
  void step(generation, matingPool){
      //create mating pool, make crossovers (checking probabilities), mutate children accordingly and set best DNA of the generation.
      pop.createMatingPool();
      crossovers
      mutations
     
  }



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
        child.mutate();
      population.add(child);
    }
  }

}

//@Pawel
class DNA {
  char[] genes;
  int fitness;
  
  void checkifbest(){}
  DNA(int length){
    this.genes = new char[length];
    
    for(int i=0; i<length; i++)
      genes[i] = (char) random(32,126);
  }
  
  //returns how many characters fit the target phrase
  int fitness(String target){
    return 0;
  }
  
  //crossover method (krzyżowanie)
  DNA crossover(DNA partner, int midpoints){
    DNA child = new DNA(5);
    //float pc = random(0,1);
    //we need to implement different crossover methods and choose one of them here
    return child;
  }
  
  void mutate(){
    //int mutation = random (1, np. 0.3*len)
    //mutation of the given number of letters
  }
  
  String toString
    return new String(genes);
  }

}
