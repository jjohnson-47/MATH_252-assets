# 📘 Section 5.5: Numerical Integration – Reference Guide

---

## 🧭 Purpose of This Section

The **Fundamental Theorem of Calculus** allows us to evaluate definite integrals using antiderivatives. But in many cases:

1. **An antiderivative cannot be expressed** in elementary terms (e.g., $e^{-x^2}$, $\sin(x^3)$, $\frac{\sin(x)}{x}$).
2. **We do not know the function**, only its values at specific points (e.g., measured data).

📊 In both cases, we need to **approximate** definite integrals using **numerical methods**.

---

## 🎯 What Is Numerical Integration?

It’s the process of **approximating a definite integral** $\int_a^b f(x)\,dx$ using:

* **Tabulated or sampled data**
* **Area approximations**: rectangles, trapezoids, or parabolas

---

## 🔢 Key Methods of Numerical Integration

### 1. **Left and Right Hand Rules (LHR/RHR)**

Partition $[a, b]$ into $n$ subintervals of equal width:

$$
\Delta x = \frac{b - a}{n}
$$

Let $x_i = a + i\Delta x$. Then:

* **Left Hand Rule**:

  $$
  \int_a^b f(x)\,dx \approx \Delta x \sum_{i=0}^{n-1} f(x_i)
  $$
* **Right Hand Rule**:

  $$
  \int_a^b f(x)\,dx \approx \Delta x \sum_{i=1}^{n} f(x_i)
  $$

🔗 [Example 5.5.2 – LHR & RHR with 5 subintervals](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num1)
🔗 [Example 5.5.4 – LHR & RHR with 10 subintervals](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num2)

---

### 2. **Trapezoidal Rule**

Each pair of endpoints forms a **trapezoid**, and area is computed accordingly.

$$
\int_a^b f(x)\,dx \approx \frac{\Delta x}{2} \left[ f(x_0) + 2f(x_1) + 2f(x_2) + \cdots + 2f(x_{n-1}) + f(x_n) \right]
$$

✅ More accurate than LHR/RHR, and easy to implement in code or spreadsheets.

🔗 [Example 5.5.9 – Trapezoidal Rule with 5 subintervals](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num3)
🔗 [Example 5.5.11 – Trapezoidal Rule with 10 subintervals](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num4)

---

### 3. **Midpoint Rule**

Use the midpoint of each subinterval for the height of a rectangle:

Let $\bar{x}_i = \frac{x_{i-1} + x_i}{2}$, then:

$$
\int_a^b f(x)\,dx \approx \Delta x \sum_{i=1}^n f(\bar{x}_i)
$$

✅ Often **more accurate** than the Trapezoidal Rule.

🔗 [Example 5.5.14 – Midpoint Rule](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num4_2)

---

### 4. **Simpson’s Rule**

Approximates the function with a **quadratic (parabola)** on each pair of subintervals. Requires an **even** number of subintervals.

$$
\int_a^b f(x)\,dx \approx \frac{\Delta x}{3} \left[f(x_0) + 4f(x_1) + 2f(x_2) + 4f(x_3) + \cdots + 4f(x_{n-1}) + f(x_n)\right]
$$

✅ More accurate for smooth functions, especially when $f$ is approximately quadratic on small intervals.

🔗 [Example 5.5.18 – Simpson’s Rule with 4 subintervals](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num5)

---

## 📌 Summary Table: Numerical Integration Formulas

🔗 [Key Idea 5.5.23 – Summary of Numerical Integration Rules](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#idea_numerical)

Let $\Delta x = \frac{b - a}{n}$, and define $x_i = a + i\Delta x$:

| Rule            | Approximation Formula                                                                       |
| --------------- | ------------------------------------------------------------------------------------------- |
| **LHR**         | $\Delta x \sum_{i=0}^{n-1} f(x_i)$                                                          |
| **RHR**         | $\Delta x \sum_{i=1}^{n} f(x_i)$                                                            |
| **Trapezoidal** | $\frac{\Delta x}{2} [f(x_0) + 2f(x_1) + \dots + 2f(x_{n-1}) + f(x_n)]$                      |
| **Midpoint**    | $\Delta x \sum_{i=1}^{n} f(\bar{x}_i)$, $\bar{x}_i = \frac{x_{i-1} + x_i}{2}$               |
| **Simpson’s**   | $\frac{\Delta x}{3} [f(x_0) + 4f(x_1) + 2f(x_2) + \cdots + 4f(x_{n-1}) + f(x_n)]$, $n$ even |

---

## 📉 Section 5.5.5: Error Analysis

When exact values are not known, we estimate the **error bounds**.

### 📘 Theorem 5.5.24 – Error Bounds for Numerical Integration

🔗 [Theorem 5.5.24 – Error Bounds](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#thm_numerical_error)

Let $f$ be sufficiently smooth on $[a, b]$, then:

| Rule            | Error Bound                               |            |   |
| --------------- | ----------------------------------------- | ---------- | - |
| **Trapezoidal** | ( E\_T \leq \frac{(b - a)^3}{12n^2} \max  | f''(x)     | ) |
| **Midpoint**    | ( E\_M \leq \frac{(b - a)^3}{24n^2} \max  | f''(x)     | ) |
| **Simpson’s**   | ( E\_S \leq \frac{(b - a)^5}{180n^4} \max | f^{(4)}(x) | ) |

Key takeaways:

* Errors shrink rapidly as $n$ increases.
* Midpoint Rule often has half the error of Trapezoidal Rule.
* Simpson’s Rule gives **exact results** for cubic polynomials.

🔗 [Example 5.5.25 – Computing error bounds](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num7)

---

## 📈 Section 5.5.6: Real-World Application

Sometimes we only have **sampled data**, not a known function.

🧪 [Example 5.5.28 – Distance from recorded speeds](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num8)

> 🚗 Velocity data was recorded every 30 seconds during a drive. Numerical integration approximated the total distance traveled.

---

## ✅ Section Summary

* Use numerical integration when:

  1. An **antiderivative is unavailable**.
  2. The **function is unknown**, and only data is given.
* Simpson’s Rule is **typically the most accurate**, followed by Midpoint and Trapezoidal Rules.
* **Error bounds** allow us to determine how good our approximation is.
* Technology (spreadsheets, code, calculators) makes implementation fast and effective.

---

## 🔗 Quick Access to Examples & Theorems

| Topic                           | Link                                                                                                  |
| ------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Section Home**                | [5.5 – Numerical Integration](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html) |
| Example 5.5.2 – LHR, RHR        | [View](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num1)                |
| Example 5.5.14 – Midpoint Rule  | [View](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num4_2)              |
| Example 5.5.18 – Simpson’s Rule | [View](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num5)                |
| Example 5.5.25 – Error Bounds   | [View](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#ex_num7)                |
| Key Idea 5.5.23 – Rule Summary  | [View](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#idea_numerical)         |
| Theorem 5.5.24 – Error Bounds   | [View](https://opentext.uleth.ca/apex-calculus/sec_numerical_integration.html#thm_numerical_error)    |

---

## 📚 Terms & Concepts Review

| Question                                                    | Concept                                            |
| ----------------------------------------------------------- | -------------------------------------------------- |
| What are the two main reasons to use numerical integration? | No antiderivative or unknown function              |
| Why are LHR and RHR rarely used in practice?                | Less accurate than other methods                   |
| What is Simpson’s Rule based on?                            | Parabolic (quadratic) approximations               |
| T/F: Simpson’s Rule is for approximating antiderivatives    | **False** – It approximates **definite integrals** |

