void setup() {
  size(640, 360);
  
  String  target = "Phrase to find"; // ASCII characters: <32,126>
  int length = target.length();
  
  int pop_size = 50;
  float pm;
  float pc;
  
  Population population = new Population(pop_size, length);
}

void draw(){
  // print: the best fit, total generations, average fitness, total population, mutation rate etc.
  // print: all generated phrases
}

class Population{
  DNA[] population;
  
  //generates random population
  Population(int pop_size, int length){
    for(int i=0; i<pop_size; i++)
      population[i] = new DNA(length);
  }
  
  void createMatingPool(){
    //implementing either a list or a dictionary
    //with probability for each DNA how likely it is for it to become a parent
  }
  
  void reproduction(){
    DNA parentA = new DNA(5);
    DNA parentB = new DNA(5); // parents = random elements from mating pool 
    //(with applied correct probability based on fitness of each element)  
    DNA child = parentA.crossover(parentB);
    child.mutate();
    
   
  }
  
}

class DNA {
  char[] genes;
  int fitness;
  
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
  DNA crossover(DNA partner){
    DNA child = new DNA(5);
    //float pc = random(0,1);
    //we need to implement different crossover methods and choose one of them here
    return child;
  }
  
  void mutate(){
    //float pm = random (0,1);
  }
  
  String getPhrase(){
    return new String(genes);
  }

}
