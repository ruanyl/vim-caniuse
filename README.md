vim-caniuse
===========

can i use support for vim

How to install
-----------------------
###Vundle
Put this in your .vimrc

```vim
Bundle 'ruanyl/vim-caniuse'
```

Then restart vim and run `:BundleInstall`.
To update the plugin to the latest version, you can run `:BundleUpdate`.

How to use
----------

first you need to install a node module `caniuse-cli`


      npm install -g caniuse-cmd


For convenience it is recommended that you assign a key for this, like so:


      noremap <Leader>ci :Caniuse<CR>
