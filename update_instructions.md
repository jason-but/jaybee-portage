# Updating Repository Instructions

As this repository is unlikely to updated/modified often, I have provided instructions on making changes

## Adding new ebuild

Create directory for ebuild

```bash
mkdir <category>/<appname>
cd <category>/<appname>
```

Then create the ebuild file

When complete need to create/update the Manifest (see below) and commit/push to github (also see below)

## Adding new version of app

```bash
cd <category>/<appname>
cp <appname>-a.b.c.ebuild <appname>-a.b.d.ebuild>
```

Then create/update the Manifest and commit/push to github

## Deleting ebuilds and/or versions

Delete the necessary files, then update the Manifests and commit/push to github

## Create/Update Manifest

You need to first be in the directory where manifests are to be created. If you have multiple packages to do, do each in turn

```bash
cd <category>/<appname>
```

Creating the manifest will want to write in the portage distfiles directory. To make this work as non-root, you need to tell it to use an alternate location to download files and generate the manifest

```bash
DISTDIR=~/Downloads/ ebuild <appname>-a.b.c.ebuild manifest
```

All required files will be downloaded to `~/Downloads`

## Push changes to git

To push changes back to github, run the following in the top level directory

```bash
git add .
git commit -m "put comment here"
git push -u origin main
```

Once pushed, the next time any other system syncs the portage tree, they should receive the new version

