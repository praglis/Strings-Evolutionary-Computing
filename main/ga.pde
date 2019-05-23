void setup(){
    String target = "this is hard";
    int pop_size = 15;
    double pc = 1;
    double pm = 1;
    int iter = 100;
    int maxCrossPoints = 4 ;

    //maximum numbers of genes that will randomly mutate in DNA
    int maxMutations = target.length();


    Population pop = new Population(pop_size, target, pm, pc, maxCrossPoints, maxMutations);
    for(int i=0; i<iter; i++) {
            println("\nBest fit:");
            println(pop.getBest().toString());
            println("Fitness:");
            println(pop.getBest().getFitness());
           
            pop.createMatingPool();
            pop.reproduction();
        }

}
