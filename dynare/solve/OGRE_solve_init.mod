/* ******************** INITIAL STATE **********************
Solve initial steady state for default initial settings.
*/

initval;
@#include "setparam/init_state_default.mod"
end;

steady;
check;

evalin('base','save results/workspace_ini oo_ M_ options_');