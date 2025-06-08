# 📘 Section 5.2: The Definite Integral – Reference Guide

## 🧭 Overview

This section introduces the **definite integral** as a tool for computing **signed area** under a function. While **indefinite integrals** represent families of antiderivatives, **definite integrals** compute numerical values: **net area** between the curve $f(x)$ and the $x$-axis on an interval $[a, b]$.

---

## ✨ Motivation Through Motion

### 📊 Graphical Representation of Displacement

* **Constant Velocity Example**:

  * If an object moves at **5 ft/s** for **10 seconds**, the total distance is:

    $$
    \text{Distance} = \text{Rate} \times \text{Time} = 5 \times 10 = 50 \text{ ft}
    $$
  * This is also the **area under the velocity graph**, a rectangle of height 5 and width 10.

* **Reversed Motion Example**:

  * 5 ft/s for 10 s, then -2 ft/s for 4 s:

    $$
    \text{Displacement} = (5)(10) + (-2)(4) = 50 - 8 = 42 \text{ ft}
    $$
  * The **total displacement** is the **area above the x-axis minus area below** it.

See:
🔗 [Figure 5.2.1 – Area under constant velocity](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#fig_defint1)
🔗 [Figure 5.2.2 – Reversed motion and signed area](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#fig_defint2)

---

## 🧮 Example 5.2.3 – Using Velocity to Find Position

> Velocity function: $v(t) = -32t + 48$, object starts at height 0 at $t = 0$

Find:

1. **Initial velocity**: $v(0) = 48 \, \text{ft/s}$
2. **Maximum height**: Set $v(t) = 0$:

   $$
   -32t + 48 = 0 \Rightarrow t = 1.5
   $$

   Displacement:

   $$
   s(1.5) = \int_0^{1.5} (-32t + 48)\,dt = \left[-16t^2 + 48t\right]_0^{1.5} = 36 \, \text{ft}
   $$
3. **Height at $t = 2$**:

   $$
   s(2) = \int_0^2 (-32t + 48)\,dt = \left[-16t^2 + 48t\right]_0^2 = 32 \, \text{ft}
   $$

This illustrates the **connection between area under velocity and change in position**.

---

## 📐 Definition 5.2.5: The Definite Integral

> **Total Signed Area** from $x = a$ to $x = b$ under $f(x)$ is:

$$
\text{Area under } f(x) \text{ and above } x\text{-axis} - \text{Area above } f(x) \text{ and under } x\text{-axis}
$$

This is formalized as:

$$
\int_a^b f(x)\,dx
$$

* $a$, $b$: bounds of integration
* Result: **net or signed area**

📷 See definition image or use:
🔗 [Definition 5.2.5 – Total Signed Area](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#def_defint)

---

## 📘 Theorem 5.2.9: Properties of the Definite Integral

Let $f$, $g$ be functions on a closed interval $[a, b]$, and let $k$ be a constant:

1. **Zero-width interval**:

   $$
   \int_a^a f(x)\,dx = 0
   $$
2. **Additivity over intervals**:

   $$
   \int_a^b f(x)\,dx + \int_b^c f(x)\,dx = \int_a^c f(x)\,dx
   $$
3. **Reversing bounds**:

   $$
   \int_b^a f(x)\,dx = -\int_a^b f(x)\,dx
   $$
4. **Linearity (Sum/Difference Rule)**:

   $$
   \int_a^b (f(x) \pm g(x))\,dx = \int_a^b f(x)\,dx \pm \int_a^b g(x)\,dx
   $$
5. **Constant Multiple Rule**:

   $$
   \int_a^b k\cdot f(x)\,dx = k \cdot \int_a^b f(x)\,dx
   $$

📷 See summary:
![Definite Integral Properties Image](attachment:/mnt/data/e2776a36-2121-48f4-8430-ef9b314d8083.png)
🔗 [Full Theorem 5.2.9 in context](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#thm_defintprop)

---

## 🧪 Example 5.2.6 – Signed Area with Geometry

Uses a piecewise graph to demonstrate how to compute net area.

🔗 [Figure 5.2.7 – Evaluating $\int_a^b f(x)\,dx$](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#fig_defint4)

---

## 🧠 Conceptual Insights

* **Signed area** can be positive or negative depending on the position of the curve relative to the x-axis.
* If you scale the function vertically (multiply by a constant), you scale the area by the same constant.
* Splitting the interval doesn’t change the total integral—just sum the parts.
* Reversing bounds introduces a sign change.

---

## 🧪 Example 5.2.12 – Evaluate Definite Integrals Using Geometry

Evaluate using area formulas for rectangles/triangles where possible.

---

## 🚀 Example 5.2.15 – Motion and Velocity

A graphical velocity function with regions labeled by area:

* **Displacement** = Signed sum of all areas.
* **Maximum displacement** = Largest positive area minus any negative areas.
* **Speed** = Max absolute value of velocity.

---

## 🔍 Not All Shapes Are Nice

When the area under the curve doesn’t correspond to basic geometric shapes (e.g., $f(x) = \sqrt{x}$ on $[0, 3]$), we need **numerical methods** or the **Fundamental Theorem of Calculus** to compute the integral. These will be covered in later sections.

🔗 [Figure 5.2.17 – Irregular area under curve](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#fig_defint7)

---

## 🔗 Key Figures and Links

| Topic                                        | Link                                                                                            |
| -------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| Section Home                                 | [Section 5.2 – The Definite Integral](https://opentext.uleth.ca/apex-calculus/sec_def_int.html) |
| Total Signed Area Definition                 | [Definition 5.2.5](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#def_defint)         |
| Properties of Definite Integrals             | [Theorem 5.2.9](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#thm_defintprop)        |
| Example: Evaluating Geometry-Based Integrals | [Figure 5.2.7](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#fig_defint4)            |
| Motion Under Gravity Example                 | [Example 5.2.3](https://opentext.uleth.ca/apex-calculus/sec_def_int.html#ex_defint3)            |

---

## ✅ Summary

* **Definite integrals** calculate the **net area under a curve**, interpreting it as **displacement**, **accumulated quantity**, or **total change**.
* These are central to connecting geometry (area) and calculus (change).
* The **Fundamental Theorem of Calculus** will formalize the connection between definite and indefinite integrals in the next section.

