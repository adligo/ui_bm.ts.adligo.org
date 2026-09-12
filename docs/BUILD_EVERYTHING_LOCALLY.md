# Workflow 1) Build Everything Locally

This workflow requires that you setup your machine with node and GitBash;

### Step 1)

 [Install Node.js](https://nodejs.org/en/download) click on the nodejs.org link at the left and follow the installation instructions.  I was on version v26.8.2 when I wrote this but any version after that should work as well.

### Step 2)

[Install GitBash](https://git-scm.com/install/) click on the git-scm.com link at the left and follow the installation instructions.  I was on version v2.55.5 (ReleaseNotes.html where you installed it) when I wrote this but if you install GitBash it will auto update often and keep you on a current version which should work well.

### Step 3)

Install TypeScript and c8 globally

```
npm install -g typescript c8
```

### Step 4)

[Install SLink](https://www.npmjs.com/package/@ts.adligo.org/slink), note this is somewhat counter intuitive [@see note](https://github.com/adligo/slink_bm.ts.adligo.org/tree/main?tab=readme-ov-file#slink-historical-notes);

```
npm install -g @ts.adligo.org/slink
```

### Step 5)

Clone this repository from github.com from the GitBash command prompt with the following command;

```
git clone https://github.com/adligo/ui_bm.ts.adligo.org.git
```

### Step 6)

Download the dependencies, and run the full build and tests

```
cd ui_bm.ts.adligo.org/ui-group/
./setup_from_github_https.sh
```

Make sure you are using the <strong><b>setup_from_github_https.sh</b></strong> script and <strong><b>NOT</b></strong> the <strong><b>setup_from_github.sh</b></strong> script as your not a maintainer of the project.  The above script should take a few minutes as it clones a lot of other repositories, it should look something like the following;

![Picture of Steps 4-5](BuildEveythingSteps4-5.png)

### Step 7)

Now you can run the following build and test commands at any point, from the
ui_bm.ts.adligo.org/ui-group/ui_group.ts.adligo.org directory;

```
npm run setup
npm run build
npm run tests
```

Also note that these command simply call the library projects using the order in [slink-group/slink_group.ts.adligo.org/buildSrc/projects.cjs](https://github.com/adligo/slink_group.ts.adligo.org/blob/main/buildSrc/projects.cjs), you can also work on any of those projects there.  If you want to commit back to github create a fork of the project your working on and work on your fork, then when you have something to review let the [Adligo Discord Community](https://github.com/adligo/overview.adligo.org?tab=readme-ov-file#community) know.

##### Note:

This is used to build (and potentially release) all of the Adligo.org dependencies used by SLink.  This was the way all of the SLink code and dependencies were originally created.
