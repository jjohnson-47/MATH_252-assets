# 📘 Section 5.3: Riemann Sums – Reference Guide

## 🧭 Purpose of the Section

This section addresses how to **approximate definite integrals** (i.e., signed areas under curves) when the shape under the curve is not simple. It introduces **Riemann sums** — sums of rectangle areas — and connects them to the exact value of a definite integral using **limits**.

---

## 🚀 Strategy: Approximate → Refine → Take the Limit

1. **Start with an approximation** (e.g., a single rectangle).
2. **Refine** the approximation using **more rectangles**.
3. Use **limits** to define the **exact area** under the curve (the definite integral).

---

## 📐 Step 1: Visualizing Rectangular Approximations

* Consider $f(x)$ on an interval $[a, b]$.
* Use rectangles to estimate the area under the curve.
* More rectangles = better approximation.

🔗 [Figure 5.3.1 – Estimating area under a parabola](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#fig_rie1)
🔗 [Figure 5.3.2 – Single rectangle approximation](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#fig_rie2)

---

## 🧊 Step 2: Rectangle Height Rules

For dividing $[a, b]$ into $n$ equal parts:

| Rule                      | Description                                        |
| ------------------------- | -------------------------------------------------- |
| **Left Hand Rule (LHR)**  | Use left endpoint of each subinterval for height.  |
| **Right Hand Rule (RHR)** | Use right endpoint of each subinterval for height. |
| **Midpoint Rule (MPR)**   | Use midpoint of each subinterval for height.       |

🔗 [Figure 5.3.3 – Comparing LHR, RHR, MPR](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#fig_rie3)
🔗 [Example 5.3.4 – Estimating area using LHR, RHR, MPR](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#ex_rie4)

---

## 🔢 Step 3: Introducing Summation Notation

Summation notation simplifies the expression of sums:

$$
\sum_{i=1}^n a_i = a_1 + a_2 + a_3 + \cdots + a_n
$$

| Term   | Meaning                           |
| ------ | --------------------------------- |
| $\sum$ | Summation symbol ("add")          |
| $i$    | Index of summation                |
| $a_i$  | Expression being summed (summand) |
| $m, n$ | Lower and upper bounds of the sum |

🔗 [Equation (5.3.1) – Summation components](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#eq_summation)

---

## 📘 Theorem 5.3.7: Properties of Summations

Summation rules for simplifying expressions:

![Theorem 5.3.7 Image](attachment:/mnt/data/b48046ab-2459-470c-a7a6-fe427cdf90cb.png)
🔗 [View Theorem 5.3.7 – Properties of Summations](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#thm_summation)

These include:

* Constants can factor out.
* Sums of linear combinations split.
* Special formulas:

  * $\sum_{i=1}^n i = \frac{n(n+1)}{2}$
  * $\sum_{i=1}^n i^2 = \frac{n(n+1)(2n+1)}{6}$
  * $\sum_{i=1}^n i^3 = \left( \frac{n(n+1)}{2} \right)^2$

🔗 [Example 5.3.8 – Using these rules](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#ex_rie8)

---

## 📏 Step 4: Riemann Sums – Formal Definitions

### 📘 Definition 5.3.12 – Partition

A **partition** of $[a, b]$ is a set:

$$
P = \{x_0, x_1, \dots, x_n\} \text{ where } a = x_0 < x_1 < \dots < x_n = b
$$

* Subinterval lengths: $\Delta x_i = x_i - x_{i-1}$
* If subintervals are equal: $\Delta x = \frac{b - a}{n}$
* **Size of partition**: $\|P\| = \max \Delta x_i$

🔗 [Definition 5.3.12 – Partition](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#def_partition)

---

### 📘 Definition 5.3.13 – Riemann Sum

Given $f$ on $[a, b]$, partitioned as above, and a sample point $x_i^* \in [x_{i-1}, x_i]$, the **Riemann sum** is:

$$
\sum_{i=1}^{n} f(x_i^*) \Delta x_i
$$

If $\Delta x_i = \Delta x$, this becomes:

$$
\sum_{i=1}^{n} f(x_i^*) \Delta x
$$

🔗 [Definition 5.3.13 – Riemann Sum](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#def_rie_sum)

---

## 💡 Key Idea 5.3.15 – Riemann Sum Concepts

Given $\int_a^b f(x)\,dx$, and $n$ equal-width intervals $\Delta x = \frac{b - a}{n}$:

* **LHR**:

  $$
  \sum_{i=0}^{n-1} f(a + i\Delta x) \cdot \Delta x
  $$
* **RHR**:

  $$
  \sum_{i=1}^{n} f(a + i\Delta x) \cdot \Delta x
  $$
* **MPR**:

  $$
  \sum_{i=0}^{n-1} f\left(a + \left(i + \tfrac{1}{2}\right)\Delta x\right) \cdot \Delta x
  $$

🔗 [Key Idea 5.3.15 – Summary of Riemann Rules](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#idea_riemann)

---

## 🧪 Worked Examples

### 📊 [Example 5.3.10](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#ex_rie10): RHR with 16 and 1000 intervals

* Uses summation formulas to approximate $\int_0^4 (4 - x^2) dx$

### 📊 [Example 5.3.18](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#ex_rie9): General RHR with $n$ intervals

* Derives a general formula in terms of $n$
* Then takes the **limit** as $n \to \infty$

---

## ♾ Step 5: Taking the Limit

### 📘 Theorem 5.3.21 – Riemann Sums and Definite Integrals

Let $f$ be continuous on $[a, b]$, then:

$$
\int_a^b f(x)\,dx = \lim_{n \to \infty} \sum_{i=1}^{n} f(x_i^*) \Delta x_i
$$

Where:

* Subinterval widths $\Delta x_i$ may vary.
* Sample points $x_i^*$ may be chosen arbitrarily.
* If $\|P\| \to 0$, then the sum approaches the integral.

🔗 [Theorem 5.3.21 – Definite Integral as Limit of Riemann Sum](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#thm_riemann_sum)

---

## ✅ Summary: What You Should Know

* A **definite integral** represents signed area under a curve.
* A **Riemann sum** is a method of approximating this area using rectangles.
* Common rules: **Left Hand, Right Hand, Midpoint**.
* Using **summation formulas** simplifies computation.
* The **limit of a Riemann sum** gives the exact value of a definite integral, under mild conditions.
* **The Fundamental Theorem of Calculus** (next section) connects this process to antiderivatives, streamlining calculations.

---

## 📚 Quick Reference Links

| Topic                                   | Link                                                                                      |
| --------------------------------------- | ----------------------------------------------------------------------------------------- |
| Section Home                            | [5.3 – Riemann Sums](https://opentext.uleth.ca/apex-calculus/sec_riemann.html)            |
| Theorem 5.3.7 – Summation Properties    | [View Theorem](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#thm_summation)    |
| Definition 5.3.12 – Partition           | [View Definition](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#def_partition) |
| Definition 5.3.13 – Riemann Sum         | [View Definition](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#def_rie_sum)   |
| Key Idea 5.3.15 – Riemann Concepts      | [View Summary](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#idea_riemann)     |
| Theorem 5.3.21 – Limit of Riemann Sums  | [View Theorem](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#thm_riemann_sum)  |
| Example 5.3.18 – Approximation with RHR | [View Example](https://opentext.uleth.ca/apex-calculus/sec_riemann.html#ex_rie9)          |

