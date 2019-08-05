/* ******************** TERMINAL STATE **********************
Solve terminal steady state for a given scenario and pension system.
*/
global oo_ x shk_file_name

endval;
@#include TERM_FILENAME
end;

steady;
check;

evalin('base','save results/workspace_term oo_ M_ options_');