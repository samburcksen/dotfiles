# Dotfiles
An ever growing collection of my personal linux dofiles.

* [Git](git/.config/git): Configurations and useful aliases

## Stow
The dotfiles are installed into the home directory using [GNU Stow](https://www.gnu.org/software/stow/).
Each subdirectory of this repository therefore acts as a Stow package with the name of the package being the directory name.
The directory structure inside a package is replicated when installing a package.

**Example:**
The directory `git` contains a config file in it's subdirectory `.config/git/`.
When installing the `git` package, a link to this config file is then created under `~/.config/git/`.


### Installing
Installing all packages at once:
```
stow -vt ~ */
```

Installing specific packages:
```
stow -vt ~ pkg1 pkg2 ...
```


### Deleting
Deleting all packages at once:
```
stow -Dvt ~ */
```

Deleting specific packages:
```
stow -Dvt ~ pkg1 pkg2 ...
```
