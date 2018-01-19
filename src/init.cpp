#include "scran.h"

#include "R_ext/Rdynload.h"
#include "R_ext/Visibility.h"

#define REGISTER(x, i) {#x, (DL_FUNC) &x, i}

extern "C" {

static const R_CallMethodDef all_call_entries[] = {
    // Normalization.
    REGISTER(forge_system, 4),
    REGISTER(subset_and_divide, 3),

    // Cell cycle calling.
    REGISTER(shuffle_scores, 8),
    REGISTER(auto_shuffle, 2),

    // Correlation calclulations.
    REGISTER(get_null_rho, 2),
    REGISTER(get_null_rho_design, 3),
    REGISTER(rank_subset, 4),
    REGISTER(compute_rho, 4),
    REGISTER(combine_corP, 7),

    // Variance calculations.
    REGISTER(fit_linear_model, 5),
    REGISTER(fit_oneway, 3),
    REGISTER(combine_simes, 2),

    // Miscellaneous functions.
    REGISTER(get_residuals, 5),

    REGISTER(get_scaled_ranks, 3),

    REGISTER(compute_CV2, 4),

    REGISTER(build_snn, 1),

    REGISTER(overlap_exprs, 4),

    // MNN calculations.
    REGISTER(find_mutual_nns, 2),
    REGISTER(cosine_norm, 2),
    REGISTER(smooth_gaussian_kernel, 4),
    REGISTER(adjust_shift_variance, 4),
    {NULL, NULL, 0}
};

void attribute_visible R_init_scran(DllInfo *dll) {
    R_registerRoutines(dll, NULL, all_call_entries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
    R_forceSymbols(dll, TRUE);
}

}

