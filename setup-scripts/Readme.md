## Setting up userChrome.css

```
    chmod +x setup-firefox.sh
   ./setup-firefox.sh
```

Running this script will link userChrome.css to profile folder in firefox. 
userChrome.css provides a for [Customising](https://www.userchrome.org/how-create-userchrome-css.html) mozilla firefox. 
file in this repository hides tabs and adress bars, even in non-full screen mode
Original authors and links are kept intact
####  Note
You might have to manually change a setting in :about config in firefox for Firefox version > 69. 
```
  set toolkit.legacyUserProfileCustomizations.stylesheets to True
  
```


## Setting up neovim

```
    chmod +x setup-nvim.sh
   ./setup-nvim.sh
```

Changed to vim-lsp for completion suggestions
Key Features
  * auto completeion               - [ncm2](https://github.com/ncm2/ncm2) (buffer, path, languages)
  * python code style enforcement  - pylint
  * Multiple language support      - [vim-lsp](https://github.com/prabirshrestha/vim-lsp) and [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)
  * Semantic highlighting          - [Semshi](https://github.com/numirias/semshi) (python) , vim-lsp (for supported languages)
  * check for errors as you type   - neomake
  
You can use  [this script](setup-scripts/setup-nvim.sh) for setting up neovim on debian based OS.
It will take care of installing and setting up dependencies 
 - pynvim
 - node version > 10
 - neovim > 0.4
 - pylint
 - python-language-server

and link configuration file in the directory to actual conf files
 

Also take care you python environment using 
`python3_host_prog`. It takes care of my conda env.
or `python_host_prog` for python 2.7


For getting completion for supported languages, run 
```
:LspInstallServer <server-name>
```
see [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings) for more information

#### Themeing, colors, and visual appearence
Was having trouble with vim devicons and vim airline.. 
after using patched fonts in alacritty terminal emulator,
finally i got it working. The patched font, alacritty config and init.vim are 
given in the repo 

Theme in picture - material


personal favourites
  - gruvbox-material
  - badwolf
  - termschool
  - desert


Goyo and Limelight gives an experience similar to Zen mode of modern editors 
