/* ******************** Preambule **********************
declaration of: macro var, variables, parameters and shocks
initialisation of parameters
PENSION_SYSTEM: 1 = PAYG, 0 = FF
*/

@#include "model/model_variables.mod"
@#if PENSION_SYSTEM
    @#include "model/model_variables_PAYG.mod"
@#else
    @#include "model/model_variables_FF.mod"
@#endif
@#include "model/model_shocks.mod"
@#if PENSION_SYSTEM
    @#include "model/model_shocks_PAYG.mod"
@#endif
@#include "model/model_parameters.mod"
@#if PENSION_SYSTEM
    @#include "model/model_parameters_PAYG.mod"
@#endif
parameters pension_system;

// initialization
@#include "setparam/initialize_parameters_deep.mod"
@#include "setparam/initialize_parameters_dynamic.mod"
@#if PENSION_SYSTEM
    pension_system = 1;
@#else
    pension_system = 0;
@#endif

/* ******************** Model **************************
declaration of model equations - separate file used
*/
model;
@#if PENSION_SYSTEM
    @#include "model/model_equations_PAYG.mod"
@#else
    @#include "model/model_equations_FF.mod"
@#endif
end;