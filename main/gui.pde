/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.
 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void tf_target_change(GTextField source, GEvent event) { //_CODE_:textfield_target:615273:
} //_CODE_:textfield_target:615273:

public void tf_popsize_change(GTextField source, GEvent event) { //_CODE_:textfield_popsize:775792:
 
} //_CODE_:textfield_popsize:775792:

public void tf_pc_change(GTextField source, GEvent event) { //_CODE_:textfield_pc:397611:
  
} //_CODE_:textfield_pc:397611:

public void tf_pm_change(GTextField source, GEvent event) { //_CODE_:textfield_pm:817859:

} //_CODE_:textfield_pm:817859:

public void tf_iter_change(GTextField source, GEvent event) { //_CODE_:textfield_iter:428777:
  
} //_CODE_:textfield_iter:428777:

public void set_target_click(GButton source, GEvent event) { //_CODE_:button_target:632577:
  String new_target = textfield_target.getText();
  target = new_target;
  textfield_target.setText(target);
} //_CODE_:button_target:632577:

public void set_popsize_click(GButton source, GEvent event) { //_CODE_:button_popsize:770449:
  String new_popsize = textfield_popsize.getText();
  pop_size = Integer.parseInt(new_popsize);
  textfield_popsize.setText(""+pop_size);
} //_CODE_:button_popsize:770449:

public void set_pc_click(GButton source, GEvent event) { //_CODE_:button_pc:565638:
  String new_pc = textfield_pc.getText();
  pc = Float.parseFloat(new_pc);
  textfield_pc.setText(""+pc);
} //_CODE_:button_pc:565638:

public void set_pm_click(GButton source, GEvent event) { //_CODE_:button_pm:601022:
  String new_pm = textfield_pm.getText();
  pm = Float.parseFloat(new_pm);
  textfield_pm.setText(""+pm);
} //_CODE_:button_pm:601022:

public void set_iter_click(GButton source, GEvent event) { //_CODE_:button_iter:362364:
  String new_iter = textfield_iter.getText();
  iter = Integer.parseInt(new_iter);
  textfield_iter.setText(""+iter);
  textfield1_maxiter.setText(""+iter);
} //_CODE_:button_iter:362364:

public void textfield_bfit_change(GTextField source, GEvent event) { //_CODE_:textfield_bestfit:576331:

} //_CODE_:textfield_bestfit:576331:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1_iter:608212:
 
} //_CODE_:textfield1_iter:608212:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield1_maxiter:777016:
 
} //_CODE_:textfield1_maxiter:777016:

public void textfield_bfit_val_change(GTextField source, GEvent event) { //_CODE_:textfield1_maxiter:777016:
  
} //_CODE_:textfield1_maxiter:777016:

public void imgTogButton1_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton1:632907:
  run = !run;
  textfield1_iter.setText(""+ga.iterator);
  textfield_bestfit.setText( ga.pop.getBest().toString());
  textfield_bfit_val.setText("" + ga.pop.getBest().fitness + "/" + target.length());
} //_CODE_:imgTogButton1:632907:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:815227:
  ga = new GA(target, pop_size, iter, pm, pc, maxCrossPoints, maxMutations);
  run = true;
} //_CODE_:button1:815227:

public void button2_click1(GButton source, GEvent event) { 
  step = true;
} 

public void show_cross_click(GButton source, GEvent event) { 
  DNA parent1 = ga.pop.getParent();
  DNA parent2 = ga.pop.getParent();
  textfield_parent1.setText(parent1.toString());
  textfield_parent2.setText(parent2.toString());
  String[] children = parent1.crossoverVisual(parent2.getGenes(), crossPoints);
  println("Crossover: "+children[0]);
  println("Crossover: "+children[1]);
  textfield_child1.setText(""+children[0]);
  textfield_child2.setText(""+children[1]);
}
public void tf_maxcross_change(GTextField source, GEvent event) { 
} 

public void tf_crossnum_change(GTextField source, GEvent event) {
} 

public void tf_parent1_change(GTextField source, GEvent event) { 
} 

public void tf_parent2_change(GTextField source, GEvent event) { 
} 

public void set_maxcross_click(GButton source, GEvent event) {
  String new_cross = textfield_maxcross.getText();
  maxCrossPoints = Integer.parseInt(new_cross);
  textfield_maxcross.setText(""+maxCrossPoints);
} 

public void tf_maxmut_change(GTextField source, GEvent event) { 
} 

public void set_maxmut_click(GButton source, GEvent event) { 
  String new_mut = textfield_maxmut.getText();
  maxMutations = Integer.parseInt(new_mut);
  textfield_maxmut.setText(""+maxMutations);
} 

public void set_crossnum_click(GButton source, GEvent event) { 
  String new_cross = textfield_crossnum.getText();
  crossPoints = Integer.parseInt(new_cross);
  textfield_crossnum.setText(""+crossPoints);
} 

public void tf_child1_change(GTextField source, GEvent event) { 
} 

public void tf_child2_change(GTextField source, GEvent event) { 
} 



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  textfield_target = new GTextField(this, 40, 30, 121, 30, G4P.SCROLLBARS_NONE);
  textfield_target.setPromptText("Target string");
  textfield_target.setOpaque(true);
  textfield_target.addEventHandler(this, "tf_target_change");
  textfield_popsize = new GTextField(this, 40, 80, 120, 30, G4P.SCROLLBARS_NONE);
  textfield_popsize.setPromptText("Population size");
  textfield_popsize.setOpaque(true);
  textfield_popsize.addEventHandler(this, "tf_popsize_change");
  textfield_pc = new GTextField(this, 40, 130, 120, 30, G4P.SCROLLBARS_NONE);
  textfield_pc.setPromptText("Crossover probability");
  textfield_pc.setOpaque(true);
  textfield_pc.addEventHandler(this, "tf_pc_change");
  textfield_pm = new GTextField(this, 40, 180, 120, 30, G4P.SCROLLBARS_NONE);
  textfield_pm.setPromptText("Mutation probability");
  textfield_pm.setOpaque(true);
  textfield_pm.addEventHandler(this, "tf_pm_change");
  textfield_iter = new GTextField(this, 40, 230, 120, 30, G4P.SCROLLBARS_NONE);
  textfield_iter.setPromptText("Max. number of iterations");
  textfield_iter.setOpaque(true);
  textfield_iter.addEventHandler(this, "tf_iter_change");
  set_target = new GButton(this, 170, 30, 79, 30);
  set_target.setText("Change");
  set_target.addEventHandler(this, "set_target_click");
  set_popsize = new GButton(this, 170, 80, 80, 30);
  set_popsize.setText("Change");
  set_popsize.addEventHandler(this, "set_popsize_click");
  set_pc = new GButton(this, 170, 130, 80, 30);
  set_pc.setText("Change");
  set_pc.addEventHandler(this, "set_pc_click");
  set_pm = new GButton(this, 170, 180, 80, 30);
  set_pm.setText("Change");
  set_pm.addEventHandler(this, "set_pm_click");
  set_iter = new GButton(this, 170, 230, 80, 30);
  set_iter.setText("Change");
  set_iter.addEventHandler(this, "set_iter_click");
  label_bfit = new GLabel(this, 291, 30, 80, 20);
  label_bfit.setText("Best Fit:");
  label_bfit.setOpaque(false);
  textfield_bestfit = new GTextField(this, 292, 50, 98, 30, G4P.SCROLLBARS_NONE);
  textfield_bestfit.setOpaque(true);
  textfield_bestfit.addEventHandler(this, "textfield_bfit_change");
  label1 = new GLabel(this, 290, 93, 80, 20);
  label1.setText("Iteration");
  label1.setOpaque(false);
  label_maxiter = new GLabel(this, 289, 122, 80, 20);
  label_maxiter.setText("Max. iter");
  label_maxiter.setOpaque(false);
  textfield1_iter = new GTextField(this, 381, 93, 120, 20, G4P.SCROLLBARS_NONE);
  textfield1_iter.setOpaque(true);
  textfield1_iter.addEventHandler(this, "textfield1_change1");
  textfield1_maxiter = new GTextField(this, 381, 122, 120, 21, G4P.SCROLLBARS_NONE);
  textfield1_maxiter.setOpaque(true);
  textfield1_maxiter.addEventHandler(this, "textfield2_change1");
  textfield_bfit_val = new GTextField(this, 395, 50, 83, 23, G4P.SCROLLBARS_NONE);
  textfield_bfit_val.setOpaque(true);
  textfield_bfit_val.addEventHandler(this, "textfield_bfit_val_change");
  label_bfit_val = new GLabel(this, 390, 29, 80, 20);
  label_bfit_val.setText("Fitness value:");
  label_bfit_val.setOpaque(false);
  TogButton = new GImageToggleButton(this, 540, 66);
  TogButton.addEventHandler(this, "imgTogButton1_click1");
  label_toggle = new GLabel(this, 520, 41, 80, 20);
  label_toggle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_toggle.setText("START/STOP");
  label_toggle.setOpaque(false);
  button_ga_auto = new GButton(this, 288, 172, 205, 32);
  button_ga_auto.setText("Run algorithm (auto)");
  button_ga_auto.addEventHandler(this, "button1_click1");
  button_ga_step = new GButton(this, 288, 217, 205, 30);
  button_ga_step.setText("Step");
  button_ga_step.addEventHandler(this, "button2_click1");
  target_label = new GLabel(this, 10, 10, 80, 20);
  target_label.setText("Target:");
  target_label.setOpaque(false);
  popsize_label = new GLabel(this, 10, 60, 80, 20);
  popsize_label.setText("Pop size:");
  popsize_label.setOpaque(false);
  pc_label = new GLabel(this, 10, 110, 80, 20);
  pc_label.setText("pc:");
  pc_label.setOpaque(false);
  pm_label = new GLabel(this, 10, 160, 80, 20);
  pm_label.setText("pm:");
  pm_label.setOpaque(false);
  iter_label = new GLabel(this, 10, 210, 80, 20);
  iter_label.setText("Iterations");
  iter_label.setOpaque(false);
  crossover_button = new GButton(this, 300, 440, 240, 30);
  crossover_button.setText("Show Crossover method");
  crossover_button.addEventHandler(this, "show_cross_click");
  maxcross_label = new GLabel(this, 10, 260, 110, 20);
  maxcross_label.setText("Max. cross points");
  maxcross_label.setOpaque(false);
  textfield_maxcross = new GTextField(this, 40, 280, 120, 30, G4P.SCROLLBARS_NONE);
  textfield_maxcross.setOpaque(true);
  textfield_maxcross.addEventHandler(this, "tf_maxcross_change");
  cross_label = new GLabel(this, 10, 420, 160, 20);
  cross_label.setText("Number of crossover points:");
  cross_label.setOpaque(false);
  textfield_crossnum = new GTextField(this, 30, 440, 130, 30, G4P.SCROLLBARS_NONE);
  textfield_crossnum.setOpaque(true);
  textfield_crossnum.addEventHandler(this, "tf_crossnum_change");
  parent1_label = new GLabel(this, 10, 510, 80, 20);
  parent1_label.setText("Parent #1");
  parent1_label.setOpaque(false);
  textfield_parent1 = new GTextField(this, 30, 530, 230, 30, G4P.SCROLLBARS_NONE);
  textfield_parent1.setOpaque(true);
  textfield_parent1.addEventHandler(this, "tf_parent1_change");
  parent2_label = new GLabel(this, 10, 570, 80, 20);
  parent2_label.setText("Parent #2");
  parent2_label.setOpaque(false);
  set_maxcross = new GButton(this, 170, 280, 80, 30);
  set_maxcross.setText("Change");
  set_maxcross.addEventHandler(this, "set_maxcross_click");
  maxmut_label = new GLabel(this, 10, 310, 120, 20);
  maxmut_label.setText("Max. mutation points");
  maxmut_label.setOpaque(false);
  textfield_maxmut = new GTextField(this, 40, 330, 120, 30, G4P.SCROLLBARS_NONE);
  textfield_maxmut.setOpaque(true);
  textfield_maxmut.addEventHandler(this, "tf_maxmut_change");
  set_maxmut = new GButton(this, 170, 330, 80, 30);
  set_maxmut.setText("Change");
  set_maxmut.addEventHandler(this, "set_maxmut_click");
  set_cross = new GButton(this, 170, 440, 80, 30);
  set_cross.setText("Change");
  set_cross.addEventHandler(this, "set_crossnum_click");
  textfield_parent2 = new GTextField(this, 30, 590, 230, 30, G4P.SCROLLBARS_NONE);
  textfield_parent2.setOpaque(true);
  textfield_parent2.addEventHandler(this, "tf_parent2_change");
  child1_label = new GLabel(this, 280, 510, 80, 20);
  child1_label.setText("child #1");
  child1_label.setOpaque(false);
  textfield_child1 = new GTextField(this, 300, 530, 240, 30, G4P.SCROLLBARS_NONE);
  textfield_child1.setOpaque(true);
  textfield_child1.addEventHandler(this, "tf_child1_change");
  textfield_child2 = new GTextField(this, 300, 590, 240, 30, G4P.SCROLLBARS_NONE);
  textfield_child2.setOpaque(true);
  textfield_child2.addEventHandler(this, "tf_child2_change");
  child2_label = new GLabel(this, 280, 570, 80, 20);
  child2_label.setText("child #2");
  child2_label.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GTextField textfield_target; 
GTextField textfield_popsize; 
GTextField textfield_pc; 
GTextField textfield_pm; 
GTextField textfield_iter; 
GButton set_target; 
GButton set_popsize; 
GButton set_pc; 
GButton set_pm; 
GButton set_iter; 
GLabel label_bfit; 
GTextField textfield_bestfit; 
GLabel label1; 
GLabel label_maxiter; 
GTextField textfield1_iter; 
GTextField textfield1_maxiter; 
GTextField textfield_bfit_val; 
GLabel label_bfit_val; 
GImageToggleButton TogButton; 
GLabel label_toggle; 
GButton button_ga_auto; 
GButton button_ga_step; 
GLabel target_label; 
GLabel popsize_label; 
GLabel pc_label; 
GLabel pm_label; 
GLabel iter_label; 
GButton crossover_button; 
GLabel maxcross_label; 
GTextField textfield_maxcross; 
GLabel cross_label; 
GTextField textfield_crossnum; 
GLabel parent1_label; 
GTextField textfield_parent1; 
GLabel parent2_label; 
GButton set_maxcross; 
GLabel maxmut_label; 
GTextField textfield_maxmut; 
GButton set_maxmut; 
GButton set_cross; 
GTextField textfield_parent2; 
GLabel child1_label; 
GTextField textfield_child1; 
GTextField textfield_child2; 
GLabel child2_label; 
