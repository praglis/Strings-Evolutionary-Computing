import java.util.Random;

void setup(){
    String target = "czekaj tam";

    int pop_size = 10;
    double pc = 0.85;
    double pm = 0.25;
    int iter = 40000;
    int maxCrossPoints = 4;

    int maxMutations = target.length();

    Population pop = new Population(pop_size, target, pm, pc, maxCrossPoints, maxMutations);

    String best = pop.getBest().toString();
    println("\nBest fit["+pop.getBest().getFitness()+"] #-1:");
    println(best);
   
    for(int i=0; i<iter; i++) {
            if(i%1000==0){
                println("\nBest fit["+pop.getBest().getFitness()+"] #" + i + ": " );
                println(pop.getBest().toString());
                println("Pop. size: " + pop.population.size());
            }

            if(pop.population.size() > 10000 &&
               pop.population.size() < 60000) pop.setPns(3);
            else if(pop.population.size() >= 60000) pop.setPns(1);

            pop.createMatingPool();
            pop.reproduction();
        }
   
}

