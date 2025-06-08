# 📘 Section 5.4: The Fundamental Theorem of Calculus – Reference Guide

---

## 🧭 Overview

This section reveals the **deep connection between antiderivatives and definite integrals**, establishing that:

* **Definite integrals** (areas under a curve) can be evaluated using **antiderivatives**.
* This powerful result is known as the **Fundamental Theorem of Calculus (FTC)**.

---

## 🔄 Area Functions and Variable Bounds

Let $f$ be continuous on $[a, b]$. Define the **area-so-far function** as:

$$
A(x) = \int_a^x f(t)\,dt
$$

This represents the **signed area** from $a$ to $x$ under the curve $f(t)$.
🔗 [Figure 5.4.1 – Area under curve from a to x](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#fig_ftc1)

🧪 [Example 5.4.2 – Deriving area-so-far formula from graph](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc1)

---

## 🧩 5.4.1: The Fundamental Theorem of Calculus – Parts 1 and 2

### 📘 Theorem 5.4.6: FTC Part 1

If $f$ is continuous on $[a, b]$ and:

$$
F(x) = \int_a^x f(t)\,dt
$$

then:

* $F$ is continuous on $[a, b]$
* $F$ is differentiable on $(a, b)$
* $F'(x) = f(x)$

$$
\frac{d}{dx} \left( \int_a^x f(t)\,dt \right) = f(x)
$$

🔗 [Theorem 5.4.6 – FTC Part 1](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_FTC1)
🔗 [Example 5.4.7 – Applying FTC Part 1](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc2)

---

### 📘 Theorem 5.4.8: FTC Part 2

If $f$ is continuous on $[a, b]$, and $F$ is any antiderivative of $f$, then:

$$
\int_a^b f(x)\,dx = F(b) - F(a)
$$

🔗 [Theorem 5.4.8 – FTC Part 2](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_FTC2)
🔗 [Example 5.4.9](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc3), [Example 5.4.10](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc4)

### 📌 Evaluation Notation

Instead of writing $F(b) - F(a)$, we often use:

$$
\left. F(x) \right|_a^b = F(b) - F(a)
$$

✅ The constant of integration $C$ cancels out in definite integrals, so we may choose $C = 0$.

---

## 🚀 5.4.2: Interpreting Motion with the FTC

* Let $v(t)$ = velocity function, then:

$$
\int_a^b v(t)\,dt = \text{displacement over } [a, b]
$$

* Let $|v(t)|$ = speed. Then:

$$
\int_a^b |v(t)|\,dt = \text{total distance traveled}
$$

* Let $a(t)$ = acceleration:

$$
\int_a^b a(t)\,dt = \text{change in velocity}
$$

🧪 [Example 5.4.11 – Displacement and distance from velocity](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc6)

---

## 🔗 5.4.3: Chain Rule and the FTC

If:

$$
F(x) = \int_a^{g(x)} f(t)\,dt
$$

Then using the **Chain Rule**:

$$
F'(x) = f(g(x)) \cdot g'(x)
$$

🧪 [Example 5.4.14](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc11), [Example 5.4.15](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc12)

---

## 🟰 5.4.4: Area Between Curves

Let $f(x) \geq g(x)$ on $[a, b]$, both continuous. Then the area between them is:

$$
\text{Area} = \int_a^b [f(x) - g(x)]\,dx
$$

🔗 [Theorem 5.4.17 – Area Between Curves](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_area_between)
🧪 [Example 5.4.18](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc7)

---

## 📏 5.4.5: Mean Value Theorem and Average Value

### 📘 Theorem 5.4.22: Mean Value Theorem for Integrals

If $f$ is continuous on $[a, b]$, then there exists $c \in [a, b]$ such that:

$$
\int_a^b f(x)\,dx = f(c)(b - a)
$$

🔗 [Theorem 5.4.22 – Mean Value Theorem](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_mvt2)
🧪 [Example 5.4.23 – Finding c guaranteed by MVT](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc8)

---

### 📘 Definition 5.4.26: Average Value of a Function

If $f$ is continuous on $[a, b]$, its **average value** is:

$$
f_{\text{avg}} = \frac{1}{b - a} \int_a^b f(x)\,dx
$$

🧪 [Example 5.4.27 – Average velocity](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc9)

---

## ✅ Section Summary

* The **Fundamental Theorem of Calculus** connects:

  * **Derivatives** (instantaneous rate of change),
  * **Antiderivatives** (indefinite integrals), and
  * **Definite integrals** (accumulated area).
* The **FTC Part 1** tells us: The derivative of the area-so-far function is the original function.
* The **FTC Part 2** gives us a way to **evaluate definite integrals** using antiderivatives.
* Applications include:

  * **Displacement**
  * **Total distance traveled**
  * **Average value of a function**
  * **Area between curves**

---

## 🔗 Key Links and Resources

| Topic                        | Link                                                                                                                                                          |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Section Overview**         | [Section 5.4 – The Fundamental Theorem of Calculus](https://opentext.uleth.ca/apex-calculus/sec_FTC.html)                                                     |
| FTC Part 1                   | [Theorem 5.4.6](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_FTC1)                                                                                |
| Example: FTC Part 1          | [Example 5.4.7](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc2)                                                                                 |
| FTC Part 2                   | [Theorem 5.4.8](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_FTC2)                                                                                |
| Examples: FTC Part 2         | [Example 5.4.9](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc3), [Example 5.4.10](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc4) |
| Chain Rule + FTC             | [Example 5.4.14](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#ex_ftc11)                                                                               |
| Area Between Curves          | [Theorem 5.4.17](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_area_between)                                                                       |
| Mean Value Theorem           | [Theorem 5.4.22](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#thm_mvt2)                                                                               |
| Average Value                | [Definition 5.4.26](https://opentext.uleth.ca/apex-calculus/sec_FTC.html#def_avgval)                                                                          |
| Related: MVT for Derivatives | [Theorem 3.2.3](https://opentext.uleth.ca/apex-calculus/sec_mvt.html#thm_mvt)                                                                                 |

