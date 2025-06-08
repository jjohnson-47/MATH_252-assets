Here is a structured and complete **Reference Guide** for *Section 5.1: Antiderivatives and Indefinite Integration*, suitable for student review and instruction. It includes summaries, terminology, theorems, examples, and direct links to supporting resources from *APEX Calculus*.

---

# 📘 Section 5.1 Reference Guide: Antiderivatives and Indefinite Integration

## 🧠 Key Concepts

### What is a Differential Equation?

A **differential equation** involves a function and its derivatives. Solving one means finding a function that satisfies the given derivative relationship.

Example:

> Find a function $f(x)$ such that $f'(x) = x^2$.
> Possible solutions:
> • $f(x) = \frac{1}{3}x^3$
> • $f(x) = \frac{1}{3}x^3 + 2$
> • $f(x) = \frac{1}{3}x^3 - 7$

This highlights the **family of solutions** differing by a constant.

---

### 📘 Definition 5.1.1: Antiderivative and Indefinite Integral

Let $f(x)$ be a function.

* An **antiderivative** of $f(x)$ is a function $F(x)$ such that $F'(x) = f(x)$.
* The **indefinite integral** is the collection of all antiderivatives of $f(x)$, written:

  $$
  \int f(x)\,dx = F(x) + C
  $$

  where $C$ is the constant of integration.

---

### 📘 Theorem 5.1.2: Antiderivative Forms

If $F(x)$ and $G(x)$ are antiderivatives of a continuous function $f(x)$ on an interval $I$, then:

$$
G(x) = F(x) + C
$$

for some constant $C$. This means **all antiderivatives differ by a constant**.

---

### 🔣 Integral Notation Overview

Notation:

$$
\int f(x)\,dx
$$

* $f(x)$: the **integrand**
* $dx$: indicates the variable of integration
* $\int$: elongated “S” for “sum,” indicating an inverse derivative process
* The result is **a family of functions**, not just one.

Visual explanation:
🔗 [Figure 5.1.3 – Indefinite Integral Notation](https://opentext.uleth.ca/apex-calculus/sec_antider.html#fig_anti1)

---

## 🧮 Working with Indefinite Integrals

### 🧪 Example 5.1.4:

Evaluate:

$$
\int x^2\,dx = \frac{1}{3}x^3 + C
$$

Explanation: You're solving $F'(x) = x^2$, and verifying by differentiating.

---

### 🧪 Example 5.1.5:

Evaluate:

$$
\int (3x^2 + 4x - 7)\,dx = x^3 + 2x^2 - 7x + C
$$

Key insight: Integration can be done term-by-term.

---

## 📜 Theorem 5.1.6: Common Antiderivative Rules

A restatement of key derivative/antiderivative pairs:
🔗 [Theorem 5.1.6 – Table of Rules](https://opentext.uleth.ca/apex-calculus/sec_antider.html#thm_indef_alg)
🔗 [Related Derivative Glossary – Theorem 2.7.11](https://opentext.uleth.ca/apex-calculus/sec_deriv_inverse_function.html#thm_deriv_glossary)

Key rules:

| Function          | Derivative       | Indefinite Integral                     |   |       |
| ----------------- | ---------------- | --------------------------------------- | - | ----- |
| $x^n$, $n \ne -1$ | $nx^{n-1}$       | $\int x^n dx = \frac{x^{n+1}}{n+1} + C$ |   |       |
| $\frac{1}{x}$     | $-\frac{1}{x^2}$ | ( \int \frac{1}{x} dx = \ln             | x | + C ) |
| $e^x$             | $e^x$            | $\int e^x dx = e^x + C$                 |   |       |
| $\cos x$          | $-\sin x$        | $\int \cos x dx = \sin x + C$           |   |       |
| $\sin x$          | $\cos x$         | $\int \sin x dx = -\cos x + C$          |   |       |

---

## 🧩 Rules of Integration

* **Constant Multiple Rule**:

  $$
  \int a\cdot f(x)\,dx = a \cdot \int f(x)\,dx
  $$

* **Sum/Difference Rule**:

  $$
  \int \left(f(x) \pm g(x)\right)\,dx = \int f(x)\,dx \pm \int g(x)\,dx
  $$

* **Power Rule**:

  $$
  \int x^n\,dx = \frac{x^{n+1}}{n+1} + C, \quad n \ne -1
  $$

* **Log Rule** (important domain note):

  $$
  \int \frac{1}{x}\,dx = \ln|x| + C
  $$

> 🔁 Remember: **Antidifferentiation is the inverse of differentiation.**

---

## 📌 Initial Value Problems

### ❓ What are they?

An **Initial Value Problem (IVP)** is a differential equation together with a known value of the function at a certain point.

> Example:
> Given $a(t) = -32$ ft/s² and $v(0) = -10$ ft/s, find $v(t)$.

Solution:

$$
v(t) = \int a(t)\,dt = -32t + C
$$

Use the initial condition to solve for $C$:

$$
v(0) = -10 = -32(0) + C \Rightarrow C = -10
\Rightarrow v(t) = -32t - 10
$$

---

## 📚 Student Questions and Practice

### 🔍 Terms and Concepts

1. Define "antiderivative" in your own words.
2. Is it more accurate to say *an* antiderivative or *the* antiderivative?
3. Define the indefinite integral of $f(x)$.
4. Fill in: “Inverse operations do the \_\_\_ things in the \_\_\_ order.”
5. What is an initial value problem?
6. The derivative of a position function is a \_\_\_ function.
7. An antiderivative of an acceleration function is a \_\_\_ function.
8. If $F$ and $G$ are antiderivatives of $f$ and $g$, respectively, what is an antiderivative of $f + g$?

---

### ✍️ Exercises (Evaluate)

* $$
  $$

\int x^4,dx, \quad \int (3x - 2),dx, \quad \int e^x,dx, \quad \int \frac{1}{x},dx
]

* Be sure to always include the **constant of integration**, $C$!

---

### 🧮 Exercises (Initial Value Problems)

Solve each IVP:

* $f'(x) = 2x + 3, \quad f(1) = 5$
* $v'(t) = \cos(t), \quad v(0) = 2$
* $a(t) = -9.8, \quad v(0) = 0$
* More practice in Exercises 30–40.

---

## 🔗 Useful Links

* [📘 Section 5.1 Overview](https://opentext.uleth.ca/apex-calculus/sec_antider.html)
* [📈 Figure 5.1.3: Antiderivative Notation](https://opentext.uleth.ca/apex-calculus/sec_antider.html#fig_anti1)
* [📋 Theorem 5.1.6: Common Indefinite Integrals](https://opentext.uleth.ca/apex-calculus/sec_antider.html#thm_indef_alg)
* [🧠 Derivative Glossary from Section 2.7.11](https://opentext.uleth.ca/apex-calculus/sec_deriv_inverse_function.html#thm_deriv_glossary)

---

## ✅ Summary

* An **antiderivative** is the reverse of a derivative.
* The **indefinite integral** represents a family of functions differing by a constant.
* **Rules of integration** closely mirror derivative rules in reverse.
* **Initial value problems** allow us to find specific antiderivatives by solving for $C$.
* These concepts form the foundation for the **Fundamental Theorem of Calculus** explored in later sections.

---

Let me know if you want this guide in printable PDF, HTML, or Markdown format for your class.

