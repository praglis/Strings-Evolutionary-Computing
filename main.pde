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
  ArrayList<DNA> population = new ArrayList();

  //generates random population
  //@Magda
  Population(int pop_size, int length){
    for(int i=0; i<pop_size; i++)
      population[i] = new DNA(length);
  }
  
  //@Pawel
  void createMatingPool(){
    // for(int i=0; i<pop_size; i++) DNA.fitness()
    // implementing either a list or a dictionary
    // with probability for each DNA how likely it is for it to become a parent
    //return matingPool;
  }
  
  //@Magda
  void reproduction(float pc){
    DNA parentA = new DNA(5);
    DNA parentB = new DNA(5); // parents = random elements from mating pool 
    //(with applied correct probability based on fitness of each element)  
    float c = random(0,1);
    int midpoints;
    DNA child = parentA.crossover(parentB, midpoints);
    child.mutate();
    
    child add to population
    child.checkifbest()
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
  
  void mutate(int mutations){
    //mutation of the given number of letters
  }
  
  String toString
    return new String(genes);
  }

}
