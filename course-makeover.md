Below is a **field‑tested “lift‑and‑shift” workflow** you can run once for every legacy course you want to modernise.  It assumes you have already proven the pattern with **STAT A253** and you now want to:

1. **Move Calculus II (MATH 252 Summer 2025) and one other course** into the same dual‑repo architecture, and
2. **Position both so they can adopt the full “Course‑as‑Code Ecosystem” master plan later** with *zero* re‑work.

Everything can be done in a weekend of focused work for a single course; add one extra day for each additional course.

---

## 0  Pre‑flight checklist (30 min)

| Item                                                       | Why it matters                            | Quick command / doc                             |
| ---------------------------------------------------------- | ----------------------------------------- | ----------------------------------------------- |
| Personal access token with `org:admin`, `repo`, `workflow` | Needed for automation scripts             | `gh auth status`                                |
| GitHub Education perks active on `open‑stats‑lab`          | Unlimited Actions minutes & private repos | Org → *Settings → Billing*                      |
| Local `course‑ops` helper scripts cloned                   | Re‑use the ones from STAT A253            | `git clone --depth=1 open-stats-lab/course-ops` |

If anything is missing, fix it now—automation later depends on these.

---

## 1  Baseline audit of the legacy repo (½ day each)

```bash
# 1. Clone into a temp folder
git clone jjohnson-47/math252-legacy tmp_math252 && cd tmp_math252

# 2. Run the inventory tool (lists size, licence guess, file type)
../course-ops/scripts/audit_course_repo.sh > ../audit_math252.txt
```

**Checkpoint A1 – pass if:**

* `audit_math252.txt` exists and lists *every* file ≥ 5 MB
* A separate CSV or spreadsheet marks each asset “redistributable” / “private” / “unknown”

If you cannot classify a file, *pause* and decide—mystery assets always bite later.

---

## 2  Create the new dual‑repo pair (15 min)

```bash
COURSE_CODE="MATH_252"
SEM="2025_summer"

# Private “source” repo
gh repo create open-stats-lab/${COURSE_CODE}-${SEM} \
  --private --template course-private-template --description "Calculus II Summer 2025 (private source)"

# Public “assets” repo
gh repo create open-stats-lab/${COURSE_CODE}-assets \
  --public --template course-assets-template --description "Calculus II public assets"
```

Push nothing yet—we’ll rearrange files first.

---

## 3  Stage files locally (1–2 h)

```bash
mkdir -p migrate/${COURSE_CODE}/{private,assets}

# Copy *code*, docs, R/Colab notebooks, metadata → private
rsync -a --prune-empty-dirs \
  --exclude 'images/**' \
  tmp_math252/ migrate/${COURSE_CODE}/private/

# Copy redistributable images, SVGs, JS widgets → assets
rsync -a --include '*/' --include '*.svg' --include '*.png' \
  --include '*.html' --include '*.js' --exclude '*' \
  tmp_math252/ migrate/${COURSE_CODE}/assets/
```

> **Tip** – for any HTML with private student data (grades, answers, answers keys), move it to the private repo even if it looks like “content”.

**Checkpoint B1 – folder diff**

* `diff -qr tmp_math252 migrate/${COURSE_CODE}/private` shows only un‑redistributable assets missing
* `migrate/${COURSE_CODE}/assets` contains **no** `.R`, `.ipynb`, or `.md` files

---

## 4  Commit & push pair (30 min)

```bash
## 4.1 Assets first
cd migrate/${COURSE_CODE}/assets
git init && git remote add origin git@github.com:open-stats-lab/${COURSE_CODE}-assets.git
git add . && git commit -m "Initial asset import (pre‑audit)"
git lfs track "*.mp4" "*.png" "*.jpg"  # if needed
git push -u origin main

## 4.2 Private repo
cd ../private
git init && git remote add origin git@github.com:open-stats-lab/${COURSE_CODE}-${SEM}.git
git submodule add https://github.com/open-stats-lab/${COURSE_CODE}-assets assets
cp ../audit_math252.txt docs/_audit_initial.txt
cp ../course-ops/templates/sample-course.yml course.yml  # edit fields now
git add .
git commit -m "Initial scaffold + assets submodule @$(git -C assets rev-parse --short HEAD)"
git push -u origin main
```

**Checkpoint C1 – GitHub passes**

* Both repos visible on GitHub
* `course.yml` renders correctly in PR diff
* Submodule link is **HTTPS**, not SSH

---

## 5  Wire up automation (45 min)

1. **Secrets**: in *private* repo → *Settings → Secrets and Variables → Actions*

   * `GH_PAGES_PAT` – classic PAT with `public_repo`
2. **Enable Pages** on **assets** repo (Build & Deploy via Actions).

Push again; first run of `pages.yml` should go green.

**Checkpoint D1 – Pages test**

Visit
`https://open-stats-lab.github.io/${COURSE_CODE}-assets/health-check.html`
(which the template ships). 200 OK ⇒ pass.

---

## 6  Directory normalisation (2 h)

Inside the *private* repo:

| Legacy pattern                             | New location                                                                                       | Command        |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------- | -------------- |
| `course-documents/syllabus/*.html`         | `weekly-modules/00‑welcome/`                                                                       | `git mv`       |
| `weekly‑modules/**/module-description.txt` | unchanged                                                                                          | —              |
| Stand‑alone calculators (HTML+JS)          | move to `widgets/` **inside assets repo**, then add as **git submodule** if re‑used across courses | see note below |

For every move, update any relative links (grep for old paths).

**Checkpoint E1 – CI lint**

Run local pre‑commit or push and check that `ci.yml` stays green.

---

## 7  Blackboard Ultra touchpoints (1 h)

```bash
./scripts/build_blackboard_zip.sh --dry-run
```

* Fix warnings about missing files.
* Once clean, re‑run without `--dry-run`; artifact appears under `blackboard-packages/`.

Upload one ZIP to a test Ultra sandbox; iframe links should resolve to Pages URLs.

---

## 8  Progress log & TODO triage (30 min)

Create `docs/PROGRESS_LOG.md`:

```md
## YYYY‑MM‑DD Initial migration completed
- [x] Baseline audit (audit_math252.txt)
- [x] Dual‑repo pair created
- [x] CI/CD green
- [ ] Widget extraction (Riemann calculators) → waiting on CC‑BY assets
- [ ] Section 5.3 Colab to plain HTML
```

Push.  This living checklist keeps “lingering unfinished parts” visible.

---

## 9  Repeat for course #3

*Re‑run steps 1‑8 with a different `$COURSE_CODE`.*
Most time savings come from **Step 3**—reuse your `rsync` include/exclude patterns.

---

## 10  Ready for the full Master Plan

Now both new courses already satisfy *Phase 0–4* of the Master Plan.
When you have bandwidth, “turn on” later phases simply by:

1. **Tagging the widgets repo** and bumping submodules.
2. Enabling the **nightly Blackboard ZIP builder** schedule trigger.
3. Adding the org‑level Project board; repos already carry the required labels.

No restructuring will be needed—the hard part is finished.

---

### Summary of Checkpoints

| ID             | Goal                                        | Blocking?        |
| -------------- | ------------------------------------------- | ---------------- |
| **A1**         | Complete asset & licence inventory          | yes              |
| **B1**         | Clean separation between code & assets dirs | yes              |
| **C1**         | Repos & submodule live on GitHub            | yes              |
| **D1**         | GitHub Pages site returns 200               | yes              |
| **E1**         | CI passes after directory moves             | yes              |
| **Ultra Test** | Blackboard ZIP imports & iframes load       | no (can iterate) |

Treat any “red” checkpoint as a **stop‑signal** before moving on.

---

#### Script Library Reference

| Script                    | Purpose                                |
| ------------------------- | -------------------------------------- |
| `audit_course_repo.sh`    | size/licence inventory with CSV output |
| `migrate_course.sh`       | wrapper for Step 3 `rsync` moves       |
| `parse_course_yml`        | exposes YAML keys to Actions           |
| `build_blackboard_zip.sh` | reproducible LMS packaging             |

All shipped in **course‑ops** helper repo cloned earlier.

---

**You now have a repeatable, checklist‑driven path to bring every course in line with `stat253‑summer2025` *and* future‑proof them for the full Course‑as‑Code vision.**  Once two more courses are live you can demo the org‑level metrics and widget reuse to any stakeholder—every step is logged, automated, and easy to audit.

