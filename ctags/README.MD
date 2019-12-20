# Setting up automatic creation of tags in project .git folder

1) Configure GIT to use template
```bash
git config --global init.templatedir '~/.git_template'
```

2) Copy GIT template to $HOME
```bash
cp -R .git_template/ ~/
```

3) (Optional) If you'd like to use universal tags(more languages supported, better python parser:
```bash
sudo yum -y install automake autoconf
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
```

4) Now in any project you can enter `git init` to install new hooks or just clone existing repo, hooks will be installed automatically.

Hooks are triggered on following events:

- post-checkout

- post-commit

- post-merge

Only files tracked by GIT are scanned by ctags

5) Add additional ctags config by copying
```bash
cp -R .ctags.d/ ~/
```
