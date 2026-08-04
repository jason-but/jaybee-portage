# jaybee-portage

This repository stores my local Gentoo ebuild repository for applications to install that are not included in the normal
Gentoo portage tree

Typically used to manage installation of my own programs/libraries, and any dependencies that are not available in Gentoo

## Using the portage tree

> [!NOTE]
> You need to first install both the git application `dev-vcs/git` and `app-eselect/eselect-repository`

Install the repository:

```bash
eselect repository add jaybee-portage git https://github.com/jason-but/jaybee-portage
```

Sync the repository

```bash
eix-sync
```
