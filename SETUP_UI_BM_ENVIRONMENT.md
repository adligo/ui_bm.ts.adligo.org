


# Setup GitBash 2.55 +

[https://git-scm.com/install](https://git-scm.com/install)

# Setup Node JS 26+

[https://nodejs.org](https://nodejs.org/en)

##### Add your bash path to npm

```
npm config set script-shell bash
```

Alternativly this can be done from the ui_group.ts.adligo.org's root with

```
npm run setup-npm-global-with-your-bash-path
```

# Setup Bun 3.3+

Run this command from Gitbash

```
curl -fsSL https://bun.sh/install | bash -s "bun-v1.3.3"
```

# Clone this project with Https

```
git clone https://github.com/adligo/ui_bm.ts.adligo.org.git
```

# Clone the main subprojects

##### ui_group 

UI_group contains build code for all of the ts.adligo.org project related to Typescript user interface components.

##### ui_group_deps

UI_group contains the dependencies (which must match) for all of the ts.adligo.org project related to Typescript user interface components.

```
cd ui_bm.ts.adligo.org/ui-group
./setup_from_github_https.sh

# Or alternativly
git clone git@github.com:adligo/ui_group.ts.adligo.org.git
git clone git@github.com:adligo/ui_group_deps.ts.adligo.org.git
```