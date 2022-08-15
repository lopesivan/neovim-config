---
title: git
author: Ivan Lopes (ivanlopes.eng.br)
date: 2021-05-07
extensions:
  - image_ueberzug
  - render
---

# How to retrieve a single file from a specific revision in Git?

```bash
git show object
git show $REV:$FILE
git show somebranch:from/the/root/myfile.txt
git show HEAD^^^:test/test.py
```

# How to get just one file from another branch?

```bash
git checkout master               # first get back to master
git checkout experiment -- app.js # then copy the version of app.js
                                  # from branch "experiment"
```
