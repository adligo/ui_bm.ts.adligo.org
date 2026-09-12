


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

# Setup the c8 code coverage tool globally

Install [TypeScript](https://www.typescriptlang.org/docs/handbook/typescript-from-scratch.html) and [c8](https://github.com/bcoe/c8) globally.  

```
# Note you will want something other than @typescript/typescript-win32-x64 for unix systems
npm install -g typescript c8 @typescript/typescript-win32-x64
```

Add tsc and c8 to your path

```
PATH=$PATH:~/AppData/Roaming/npm/node_modules/c8/bin:~/AppData/Roaming/npm/node_modules/typescript/bin
# Or Unix
export PATH=$PATH:/usr/local/lib/node_modules/c8/bin:/usr/local/lib/node_modules/typescript/bin
```

```
# Also if you need the Windows path, for Jenkins, it's something like this;
C:\Users\<your_username/>\AppData\Roaming\npm\node_modules\c8\bin
C:\Users\<your_username/>\AppData\Roaming\npm\node_modules\typescript\bin
```

### [Install SLink and add it to your Path](https://www.npmjs.com/package/@ts.adligo.org/slink)

Note this is somewhat counter intuitive [@see note](https://github.com/adligo/slink_bm.ts.adligo.org/tree/main?tab=readme-ov-file#slink-historical-notes);

```
npm install -g @ts.adligo.org/slink
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

# Install the Dependencies

```
cd ui_bm.ts.adligo.org/ui-group/ui_group_deps.ts.adligo.org
npm install
```


# Setup the Projects

This step creates a symbolic link between each ts.adligo.org project's node_modules and ui_bm.ts.adligo.org/ui-group/ui_group_deps.ts.adligo.org/node_modules.  Also, when the ts.adligo.org projects are built, they are installed into the ui_bm.ts.adligo.org/ui-group/ui_group_deps.ts.adligo.org/node_modules directory so that down stream projects can see their code.

```
cd ui_bm.ts.adligo.org/ui-group/ui_group.ts.adligo.org
npm install
```
