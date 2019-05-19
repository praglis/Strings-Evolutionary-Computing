public class Main {

    public static void main(String[] args) {

        String target = "abcde";
        int pop_size = 15;
        double pc = 1;
        double pm = 0.6;
        int iter = 100;
        int maxCrossPoints = 2;

        //maximum numbers of genes that will randomly mutate in DNA
        int maxMutations = target.length()/3;

	//Genetic algorithm working:

        Population pop = new Population(pop_size, target, pm, pc, maxCrossPoints, maxMutations);
        for(int i=0; i<iter; i++) {
            pop.createMatingPool();
            pop.reproduction();
            
            /* 
            if(i%10==3){
                pop.printPopulation();
                System.out.println("\nBest fit:");
                System.out.println(pop.getBest().toString());
                System.out.println("Fitness:");
                System.out.println(pop.getBest().getFitness());
           }
           */
            
        }
    }
}
