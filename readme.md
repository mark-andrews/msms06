# Model Selection and Model Simplification
## A Two-Day Workshop for Empirical Researchers

This two-day workshop provides practical training in statistical model building, evaluation, comparison, and selection for researchers working with observational data.
The course addresses common challenges faced when analyzing data with multiple potential predictors, limited sample sizes, and competing theoretical models.

Empirical researchers routinely face decisions about which variables to include in regression models, how to compare competing models, and how to validate their findings.
Traditional approaches such as stepwise selection have well-documented problems, yet alternatives are not widely taught or understood.
This course provides rigorous training in principled approaches to model selection grounded in information theory, cross-validation, and penalized estimation.


## Course Structure

The course consists of six two-hour sessions over two days, combining conceptual presentations with hands-on coding exercises using real research data.
The first three sessions establishe the theoretical foundation for model selection and introduces core methods for model evaluation and comparison.
Sessions 4-6 cover practical methods for variable selection, model averaging, and special topics including mixed models and causal inference.

### Session 1: The Model Selection Problem

Session 1 introduces the fundamental challenge of model selection and the bias-variance tradeoff.

We examine why model selection is unavoidable in empirical research when theory does not specify exact functional forms and many candidate predictors are available.
The session formalizes the bias-variance tradeoff and demonstrates the problems of overfitting and underfitting.

Key concepts include the mean squared error decomposition, the distinction between training error and test error, and why training error always decreases with model complexity while test error follows a U-shaped curve.

Demonstrations use simulation studies where the true model is known, allowing clear comparison of model performance across complexity levels.

### Session 2: Out-of-Sample Prediction

Session 2 addresses how to honestly evaluate model performance using held-out data and information criteria.

We examine why in-sample fit statistics such as R^2 and residual deviance are optimistically biased and misleading for model comparison.
The session introduces cross-validation methods including k-fold cross-validation and leave-one-out cross-validation.

Information criteria including AIC, AICc, and BIC are presented as approximations to cross-validated prediction error.
We derive AIC from first principles to show its connection to expected out-of-sample deviance and explain when to use AIC versus BIC.

Practical demonstrations compare cross-validation and information criteria on real data, showing how they typically agree but occasionally diverge.

### Session 3: Model Comparison Frameworks

Session 3 provides frameworks for comparing multiple candidate models, distinguishing nested from non-nested comparisons.

We introduce likelihood ratio tests for nested models and explain why they are inappropriate for non-nested comparisons.
The session addresses the multiple comparisons problem and its implications for model selection.

Practical guidance focuses on transparent reporting: showing all models considered, reporting AIC differences, and interpreting relative model support.

Workshops demonstrate model comparison workflows including fitting candidate models, extracting fit statistics, and presenting results in publication-quality tables.

### Session 4: Variable Selection

Session 4 critically examines variable selection methods, with particular attention to the problems of stepwise selection.

We demonstrate that stepwise regression induces selection bias, inflates Type I error rates, produces unstable selections, and yields invalid p-values and confidence intervals.
Simulations show these problems concretely, including stepwise selection on null data and instability across bootstrap samples.

The session introduces all-subsets selection for moderate numbers of predictors and regularization methods including ridge regression, lasso, and elastic net for higher-dimensional problems.

Workshops provide hands-on experience with the glmnet package for fitting regularized models and selecting penalty parameters via cross-validation.

### Session 5: Model Averaging

Session 5 introduces model averaging as an alternative to selecting a single best model.

Rather than choosing one model and ignoring model selection uncertainty, model averaging weights predictions across multiple competitive models using Akaike weights.

We derive Akaike weights from AIC differences, compute model-averaged predictions and coefficients, and define confidence sets of models accounting for 95% of cumulative weight.
Variable importance measures based on summed Akaike weights provide richer inference than binary inclusion or exclusion from a single selected model.

Workshops demonstrate both manual calculation of Akaike weights and automated model averaging using the MuMIn package, including validation comparisons showing that averaged predictions typically equal or outperform single-model selection.

### Session 6: Special Topics and Best Practices

Session 6 addresses practical complications and integrates concepts from previous sessions.

We cover model selection for mixed effects models, distinguishing the selection of fixed effects from the selection of random effects structure.
The session explains the critical difference between maximum likelihood and restricted maximum likelihood estimation and when each is appropriate for model comparison.

A major focus is distinguishing three goals of statistical modeling: prediction, explanation, and causation.
These goals require fundamentally different modeling strategies, and confusion among them leads to poor practice.
We demonstrate that models selected by AIC or other statistical criteria may have severely biased causal effect estimates.

The session concludes with guidance on transparent reporting practices, pre-registration of model selection strategies, and validation on independent data.
These practices address the replication crisis by reducing selective reporting and p-hacking.


