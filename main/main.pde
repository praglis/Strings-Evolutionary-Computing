import java.util.Random;

// G4P Library needed for creating gui
import g4p_controls.*;

//global variables
GA ga;
String target;
int pop_size, iter, maxCrossPoints, maxMutations, crossPoints;
float pc, pm;

// Flags:
Boolean run = false;
Boolean step = false;

void setup(){
  
    // gui/window setup
    size(840,680,JAVA2D);
    background(255);
    createGUI();
    //customGUI();
        
    //Algorithm default parameters:
    target = "czekaj";
    pop_size = 10;
    pc = 0.85;
    pm = 0.25;
    iter = 40000;
    maxCrossPoints = 4;
    maxMutations = target.length();
    crossPoints=2;
    
    //ga.algorithm(1000);
    
    //temporary default setup
     textfield_target.appendText(""+ target);
     textfield_popsize.appendText("" + pop_size); 
     textfield_pc.appendText("" + pc); 
     textfield_pm.appendText("" + pm);  
     textfield_iter.appendText("" + iter); 
     textfield1_maxiter.appendText(""+iter);
     textfield_crossnum.setText(""+crossPoints);
}


void draw(){
  if(step){ //dfjslkdfj kjfsd stopping condition for completed search
    run = false;
    step = false;
    if(ga.pop.getBest().getFitness()==ga.target.length()){ 
        ga.printFinalStats();
        textfield1_iter.setText(""+ga.iterator);
        textfield_bestfit.setText( ga.pop.getBest().toString());
        textfield_bfit_val.setText("" + ga.pop.getBest().fitness + "/" + target.length());
     }
     if(ga.iterator <= ga.iterations) {
    
            if(ga.iterator%1000==0){
                ga.printStats(); 
                
            }
            
            if(ga.pop.population.size() > 10000 &&
               ga.pop.population.size() < 60000) ga.pop.setPns(3);
            else if(ga.pop.population.size() >= 60000) ga.pop.setPns(1);
            
            textfield1_iter.setText(""+ga.iterator);
            textfield_bestfit.setText( ga.pop.getBest().toString());
            textfield_bfit_val.setText("" + ga.pop.getBest().fitness + "/" + target.length());
            ga.step();
    }
  }
  
  if(run){
    if(ga.pop.getBest().getFitness()==ga.target.length()){ 
        ga.printFinalStats();
        textfield1_iter.setText(""+ga.iterator);
        textfield_bestfit.setText( ga.pop.getBest().toString());
        textfield_bfit_val.setText("" + ga.pop.getBest().fitness + "/" + target.length());
        run = false;
     }
    if(ga.iterator <= ga.iterations) {
    
            if(ga.iterator%1000==0){
                ga.printStats(); 
                
            }
            
            if(ga.pop.population.size() > 10000 &&
               ga.pop.population.size() < 60000) ga.pop.setPns(3);
            else if(ga.pop.population.size() >= 60000) ga.pop.setPns(1);
            
            textfield1_iter.setText(""+ga.iterator);
            textfield_bestfit.setText( ga.pop.getBest().toString());
            textfield_bfit_val.setText("" + ga.pop.getBest().fitness + "/" + target.length());
            ga.step();
    }
    }
    //exit();  
  
 
}
