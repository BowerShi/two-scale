# Two-scale Scheme for the  Monge-Ampere Equation 
## Final project @ Finite Difference Methods II (差分方法II) at Peking University.

Codes include functions and 4 .mlx files which implement the monotone operator(two\_scale\_newton.mlx and tow\_scale\_perron.mlx), accurate operator(two\_scale\_accurate.mlx) and filter scheme(two\_scale\_filter.mlx).

### Introduction
We consider the Monge-Ampère equation with Dirichlet boundary condition:

$$
\begin{cases}
\det D^2 u = f & \text{in } \Omega \subset \mathbb{R}^d, \\
u = g & \text{on } \partial \Omega
\end{cases}
$$

where \(\Omega\) is a uniformly convex domain and \(f \geq 0\) and \(g\) are uniformly continuous functions. We seek a convex solution \(u\), which is critical for the upper equation to be elliptic and have a unique viscosity solution.

If we rewrite the determinant of \(D^2u\) into

$$
\det D^2 w(x) = \min_{\boldsymbol{v} \in \mathbb{S}^{\perp}} \prod_{j=1}^d v_j^T D^2 w(x) v_j
$$

where \(\mathbb{S}^{\perp}\) is the set of all \(d\)-orthonormal bases \(\boldsymbol{v} = (v_j)_{j=1}^d, v_j \in \mathbb{R}^d\). The minimum here is achieved by the eigenvectors of \(D^2 w(x)\) and is equal to the product of the respective eigenvalues. We can discretize the above formula in various ways, employing different polynomial spaces and approximations for the directional derivatives given by \(v_j^T D^2 w v_j\). These choices lead to schemes with different theoretical properties and levels of accuracy.

Based on the discretization of the above shcems, we implement the two scale methods given in the following references.

### References

1. R. H. Nochetto, D. Ntogkas, and W. Zhang, "Two-scale method for the Monge-Ampère equation: Convergence to the viscosity solution," *Mathematics of Computation*, vol. 88, no. 316, pp. 637-664, May 2018. 
2. R. H. Nochetto and D. Ntogkas, "Convergent Two-Scale Filtered Scheme for the Monge–Ampère Equation," *SIAM Journal on Scientific Computing*, vol. 41, no. 2, pp. B295-B319, 2019. SIAM.






