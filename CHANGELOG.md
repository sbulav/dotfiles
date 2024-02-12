# Changelog

## [4.0.0](https://www.github.com/sbulav/dotfiles/compare/v3.2.0...v4.0.0) (2024-02-12)


### ⚠ BREAKING CHANGES

* start moving darwin to snowfall

### Features

* add kitty opacity ([2772f12](https://www.github.com/sbulav/dotfiles/commit/2772f129cf46f7cfd08a181f0378e11df7e15e56))
* **fish:** add zoxide ([39a4ecf](https://www.github.com/sbulav/dotfiles/commit/39a4ecf10bd3c041b9a84d23b9bdf30ea4c26a6a))
* **fish:** update fish plugins ([8b9eea7](https://www.github.com/sbulav/dotfiles/commit/8b9eea7af010aa77233d7300dcaff589e4a91082))
* **fish:** use alt+t for fzf file search ([0be2b81](https://www.github.com/sbulav/dotfiles/commit/0be2b815b5a44f6173e152ed5a9dee38c84aa08f))
* **kitty:** add mouse copy paste ([525f197](https://www.github.com/sbulav/dotfiles/commit/525f19740cff6aff4472996ae921c2a5f540a4d0))
* **l2tp:** add l2tp module ([6b72bfd](https://www.github.com/sbulav/dotfiles/commit/6b72bfd9af8571572f9166a1e390212943f117d4))
* more nix modules ([511d8f3](https://www.github.com/sbulav/dotfiles/commit/511d8f347c09fa1c5a62ce632881263c9e6c4a72))
* **nix:** add develop suite ([9790397](https://www.github.com/sbulav/dotfiles/commit/979039781575d1beab9bda9672551e4c18eda32f))
* **nix:** add git and gnupg ([0e5f94b](https://www.github.com/sbulav/dotfiles/commit/0e5f94b41871f5c3247fe106e80e0e931a059dde))
* **nix:** add gtk cursorTheme ([09cb1e1](https://www.github.com/sbulav/dotfiles/commit/09cb1e1900d7f451a6e761a71c271695f8daff2f))
* **nix:** add more apps and add MIME ([f779cd3](https://www.github.com/sbulav/dotfiles/commit/f779cd36b164eb5c511b5079b5f9a032db0f3e4d))
* **nix:** add more desktop modules ([ff34ffc](https://www.github.com/sbulav/dotfiles/commit/ff34ffcf4aab442de2dfa0085b10f4792be1f90d))
* **nix:** add more modules ([962cf00](https://www.github.com/sbulav/dotfiles/commit/962cf00f7a2f66a6a1fb2c714b51534ed2fe708c))
* **nix:** add nfs fileshare ([7263a82](https://www.github.com/sbulav/dotfiles/commit/7263a82875733eb874c15ae16dca3818531c571d))
* **nix:** add rofi search shortcut ([0400426](https://www.github.com/sbulav/dotfiles/commit/04004266faa1e81d61883a0487371319dfb7aa8a))
* **nix:** add rofi-calc ([bd5a818](https://www.github.com/sbulav/dotfiles/commit/bd5a8182795ce4080e36287a6dacca5d99c34ccf))
* **nix:** add sudo and clean up ([17e7118](https://www.github.com/sbulav/dotfiles/commit/17e7118014324c557fdb2d4e373f95cbcd11e6e3))
* **nix:** add swaylock,lf, etc ([673d857](https://www.github.com/sbulav/dotfiles/commit/673d85736a30890cc0f5ab340965a1c617d8d3e9))
* **nix:** add vpn selector rofi ([993cf05](https://www.github.com/sbulav/dotfiles/commit/993cf0591358abbcc869178ea8c57e5721e86a25))
* **nix:** add wezterm module ([cb7f8f3](https://www.github.com/sbulav/dotfiles/commit/cb7f8f31a09b51cc84ba2c630236f8fd7a398a01))
* **nix:** add yazi module ([8026fff](https://www.github.com/sbulav/dotfiles/commit/8026fff21b6df1dc56c917fea9d0f507ecb0cf51))
* **nix:** allow close window wo confirmation ([08edcf7](https://www.github.com/sbulav/dotfiles/commit/08edcf71936a39cb4ffe3af331692229529ed173))
* **nix:** auto mount nfs share ([0ae76bf](https://www.github.com/sbulav/dotfiles/commit/0ae76bfd5c03fd38f63c8287bec3740caa186022))
* **nix:** change wp & update rbw lock timeout ([ae3f33e](https://www.github.com/sbulav/dotfiles/commit/ae3f33e515a86a673fd8c76ebfe3cef98c9e7d89))
* **nix:** control hyprland via home-manager ([f6c6971](https://www.github.com/sbulav/dotfiles/commit/f6c6971a8dbbd088a623dd6be3a9c287d45a1ec8))
* **nix:** disable fprint auth as it's not unlocking keyring ([89e4dcd](https://www.github.com/sbulav/dotfiles/commit/89e4dcd10297b4e5261fd2e839b0fc492f656dc5))
* **nix:** enable fontconfig and install telegram ([a97492b](https://www.github.com/sbulav/dotfiles/commit/a97492b7059f6330a2929f345c3719eb9258cbf9))
* **nix:** enable gnome-keyring to store passwords ([845b553](https://www.github.com/sbulav/dotfiles/commit/845b55306ea056eb18a205e67367cbabda1f4e01))
* **nix:** enable libnotify to send messages via notify-send ([0bf74f5](https://www.github.com/sbulav/dotfiles/commit/0bf74f5f060f402ee4cbe05b6d002c2fdb6a0ee3))
* **nix:** enable yazi for testing ([a44ae83](https://www.github.com/sbulav/dotfiles/commit/a44ae83f267f639e9b209accb818441e88fa1bae))
* **nix:** fix rbw ([6e1f439](https://www.github.com/sbulav/dotfiles/commit/6e1f43987b7c7b43bc361c17736184a65de45e1b))
* **nix:** fix swayidle module ([8fabc1f](https://www.github.com/sbulav/dotfiles/commit/8fabc1f0c37b4a0fa2648fde62ab08e1514965f4))
* **nix:** handle hdmi monitors ([b403afc](https://www.github.com/sbulav/dotfiles/commit/b403afcafff223845e32feaf0e043e5f344733bb))
* **nix:** keep tuning wezterm ([27a7b05](https://www.github.com/sbulav/dotfiles/commit/27a7b050a915bc7016c6299f2f01bf95110ac3c2))
* **nix:** Manage gtk fonts and themes via config ([27dcbb8](https://www.github.com/sbulav/dotfiles/commit/27dcbb818d4e6f0fb96ac8ac3437d91598713cea))
* **nix:** manage pyright and black with nix ([abb4a3e](https://www.github.com/sbulav/dotfiles/commit/abb4a3e63cb3de2abe955e752708602a2d0eef47))
* **nix:** more changes ([6d02f94](https://www.github.com/sbulav/dotfiles/commit/6d02f94ecc98d9a960b768f5708f48bee25dc9c6))
* **nix:** nixos run home manager as module ([d84cec1](https://www.github.com/sbulav/dotfiles/commit/d84cec133bcd584f1cbf7cf35032e6c4a6274364))
* **nix:** optimize user pass ([6928dd2](https://www.github.com/sbulav/dotfiles/commit/6928dd247d4fabc7e17d5caf9f3f08f20ffb9769))
* **nix:** re-enable fingerprint on nz ([6b7c4fb](https://www.github.com/sbulav/dotfiles/commit/6b7c4fbe62e7f37c4a030ffbbd2ea5857dd82640))
* **nix:** remove regreet patch ([f131601](https://www.github.com/sbulav/dotfiles/commit/f1316012d4b73c479c145866363622c8d2ba6f47))
* **nix:** remove unneeded module ([d7cbd38](https://www.github.com/sbulav/dotfiles/commit/d7cbd3880d20a49e7c3d124b3d7a4c80aff302e3))
* **nix:** remove unused dev shells ([ba13395](https://www.github.com/sbulav/dotfiles/commit/ba133951d24da8871a8d09f67bce5ec49faf9f3d))
* **nix:** replace lf with yazi ([93c0c2d](https://www.github.com/sbulav/dotfiles/commit/93c0c2dc2221b1be4ce41e45caa6f31bb13e2a33))
* **nix:** set up screenshot to clipboard ([784597e](https://www.github.com/sbulav/dotfiles/commit/784597eaf8040624e37561b2dc01807fb7b3254b))
* **nix:** start migrating to snowfall-lib ([d06802e](https://www.github.com/sbulav/dotfiles/commit/d06802e9ba3f81a2e40f1e740f3e9e5160f40aa0))
* **nix:** switch default terminal to nix ([423d6eb](https://www.github.com/sbulav/dotfiles/commit/423d6eb56bbb225509a1d851c94081d8e7ad0057))
* **nix:** switch layout with caps ([7373b9d](https://www.github.com/sbulav/dotfiles/commit/7373b9db03063ac65ea295dbc871d21a03d09a4c))
* **nix:** switch rofi to combi mode ([765c89f](https://www.github.com/sbulav/dotfiles/commit/765c89f9f6a1407aca00548797c8ed07cd0aa2be))
* **nix:** switch to wayland rofi ([4be761e](https://www.github.com/sbulav/dotfiles/commit/4be761e42a91c0cd0f6cc95a0df15fc8541a4295))
* **nix:** update readme ([feb0aac](https://www.github.com/sbulav/dotfiles/commit/feb0aac5b17c9cd25519847ffe480165fd2ea348))
* **nix:** update waybar widgets ([85d3f06](https://www.github.com/sbulav/dotfiles/commit/85d3f06a80a9f771fbccabae95e1d336f6df771f))
* **nix:** use cliphist and rofi for copying ([fbdf1fd](https://www.github.com/sbulav/dotfiles/commit/fbdf1fdb9b70f5d2da176dbe4bed3c658b0f8756))
* **nix:** use rbw to paste bitwarden pw from rofi ([e952749](https://www.github.com/sbulav/dotfiles/commit/e9527499970e86c439a663204c49cae6492ec4a0))
* **nix:** use swayidle as service ([a2fff28](https://www.github.com/sbulav/dotfiles/commit/a2fff2871d0e03904ddad5eb6df42e69fabc5a7e))
* **nvim:** don't manage stylua in Mason ([62f13cd](https://www.github.com/sbulav/dotfiles/commit/62f13cde844968a8756f4b1a04ac54b5c139256c))
* **nvim:** make cheat.sh work with one line words ([1f2d00c](https://www.github.com/sbulav/dotfiles/commit/1f2d00c28b265bd52606a5e23f48e7446630683d))
* **nvim:** replace lsp icons ([daf935e](https://www.github.com/sbulav/dotfiles/commit/daf935ed63ae3b93cc3e2cfb31f9b5c1db84a780))
* **nvim:** switch back to "Oceanic-Next" ([38260c9](https://www.github.com/sbulav/dotfiles/commit/38260c97a962ea9654a83a46acd335b896e2f031))
* **nvim:** Telescope search in cwd by default ([da49bbd](https://www.github.com/sbulav/dotfiles/commit/da49bbd3b0e6aad59db73e9c90656ea4384d99a5))
* **nvim:** use tab for luasnip over the text ([f243c0e](https://www.github.com/sbulav/dotfiles/commit/f243c0e2c1f3ce854498b57079ae6f32f114ad46))
* start moving darwin to snowfall ([ece60d8](https://www.github.com/sbulav/dotfiles/commit/ece60d814928b4382ace46482d5bb7a169509fdc))
* **tmux:** don't auto start session ([65b1a56](https://www.github.com/sbulav/dotfiles/commit/65b1a5673c70f3ace87b80fc2bf4b84dc7aaefdd))
* **wezterm:** add more wezterm config ([2124235](https://www.github.com/sbulav/dotfiles/commit/21242350cd1bf14e15d34a5205ea3955b5bf28ab))
* **wezterm:** finally fix fonts, clean config ([c61a406](https://www.github.com/sbulav/dotfiles/commit/c61a406d1748749c5fd82de561b803eebb3ba077))
* **wezterm:** move events to separate file ([2aefdfa](https://www.github.com/sbulav/dotfiles/commit/2aefdfadd30cae281f5ea7ab6da32b3cc081855f))
* **wezterm:** split config and set tmux-like maps ([6a75d04](https://www.github.com/sbulav/dotfiles/commit/6a75d041f78d3dc5bf9b119a2c9b0cb79889ca7c))
* **zoom:** add zoom module ([96c03df](https://www.github.com/sbulav/dotfiles/commit/96c03dfe13ed585c1fb50274c692884b4438153e))


### Bug Fixes

* **nix:** correct hyprland mappings ([5b20a25](https://www.github.com/sbulav/dotfiles/commit/5b20a254169f3790b568036aa2bc21ffecb680eb))
* **nix:** leave only one hyprland portal ([a86675e](https://www.github.com/sbulav/dotfiles/commit/a86675e171cf6d42064faa401b2be77cb9c29818))
* **nix:** mako startup ([34b86e6](https://www.github.com/sbulav/dotfiles/commit/34b86e63df01e76af1b89a65325087e9a84fd7bb))
* **nix:** use pinentry-gnome for rbw ([618cacc](https://www.github.com/sbulav/dotfiles/commit/618cacc4936591aae9ba1a8f273c39c95e8fe528))
* **swayidle:** enable monitors after sleep ([26bab16](https://www.github.com/sbulav/dotfiles/commit/26bab163ccd415293760079bc76f2278462db1aa))

## [3.2.0](https://www.github.com/sbulav/dotfiles/compare/v3.1.0...v3.2.0) (2024-01-15)


### Features

* **fish:** add cdd function ([aca6e0d](https://www.github.com/sbulav/dotfiles/commit/aca6e0d8645e71b43e51e8401891cd88d9d9b3e1))
* **nix:** add example hosts ([a2fd917](https://www.github.com/sbulav/dotfiles/commit/a2fd91719ed46c1924eb9d519acde1b224977252))
* **nix:** override default l function in nix ([305d523](https://www.github.com/sbulav/dotfiles/commit/305d523505de8554f358d405451df0e741f7fc83))
* **nix:** pin yabai apps to spaces ([cf9ee45](https://www.github.com/sbulav/dotfiles/commit/cf9ee451c1b6a67e498c2289bbb83e867605c3a8))
* **nix:** replace imv with feh ([1b9d333](https://www.github.com/sbulav/dotfiles/commit/1b9d333ceb0cea8028214b3736b8a516b6ea927e))
* **nix:** yabai ([2175bee](https://www.github.com/sbulav/dotfiles/commit/2175bee3e82c3a38ea320dbb0a5625ec21c865ea))
* **nvim:** fix sg.nvim setup ([7dfbea7](https://www.github.com/sbulav/dotfiles/commit/7dfbea7789012a5ce7e3241d5397e77a386df919))
* **nvim:** switch colorscheme to monet.nvim ([a82ca43](https://www.github.com/sbulav/dotfiles/commit/a82ca433e205fc1d69f5b19d077fbd4db102ff1d))
* **tmux:** enable osc52 yank ([d8c89d9](https://www.github.com/sbulav/dotfiles/commit/d8c89d9bed2e753aa17bc8af4bc2629cae5da3f3))


### Bug Fixes

* **nix:** enable 2 ways of auth in swaylock ([ecc0af0](https://www.github.com/sbulav/dotfiles/commit/ecc0af055643c4282f874a71acefdff30bef81eb))
* **nix:** reorder nixos programs ([1d11306](https://www.github.com/sbulav/dotfiles/commit/1d113068e28ec920f37b2c6aa843f681c17d8db9))
* **nvim:** don't run treesitter on fugitives ([8664d6f](https://www.github.com/sbulav/dotfiles/commit/8664d6f9ade8470fc05abfaf35a66152c58dcf05))

## [3.1.0](https://www.github.com/sbulav/dotfiles/compare/v3.0.0...v3.1.0) (2023-12-05)


### Features

* **fish:** load all ssh keys ([793f7ec](https://www.github.com/sbulav/dotfiles/commit/793f7ec91eb1f4ed6a1a089260b122b9c7b042e1))
* **nix:** add bluetooth manager, service and waybar ([e1961f4](https://www.github.com/sbulav/dotfiles/commit/e1961f4c50183acb522f3e7ff5391fff02372bdb))
* **nix:** add dig for troubleshooting ([da975fa](https://www.github.com/sbulav/dotfiles/commit/da975fa34599d7b3d6e9f0af1aa863c73c60af0f))
* **nix:** add grim and slurp for screenshots ([1fce79c](https://www.github.com/sbulav/dotfiles/commit/1fce79c80b54e9bc00fbe2d02b68e9862c9342f3))
* **nix:** add nfs utils ([6f5f7ee](https://www.github.com/sbulav/dotfiles/commit/6f5f7ee1a015d7fd3d6f6f03b5e38beb4f7e55c9))
* **nix:** add zoom-us ([3c1fc82](https://www.github.com/sbulav/dotfiles/commit/3c1fc82f13147b406d086293713ec4e27fac0d66))
* **nix:** auth with fingerprint ([370fb65](https://www.github.com/sbulav/dotfiles/commit/370fb6554856d670f35fe98ec18ad703ea8f762e))
* **nix:** bump flakes and add atuin ([29f4e8d](https://www.github.com/sbulav/dotfiles/commit/29f4e8d0d44d1e13af13f161cdc80604ab43c6a6))
* **nix:** enable wireguard ([bec5f20](https://www.github.com/sbulav/dotfiles/commit/bec5f20c6e3f5657e99d1ce4de1438cee2d17ba5))
* **nvim:** add sg.nvim ([8e8fb6c](https://www.github.com/sbulav/dotfiles/commit/8e8fb6ced628a6eee60a7874dd3505152f5a75d6))
* **nvim:** correctly detect ansible ft ([a06fa88](https://www.github.com/sbulav/dotfiles/commit/a06fa88478bc1570f4c2e986ae2607adb0fb433a))


### Bug Fixes

* **lf:** properly handle deletion files with spaces ([714030a](https://www.github.com/sbulav/dotfiles/commit/714030a97fcd0e0b796b1ed7bc5015e1533d912f))
* **tmux:** fix shebang for nix k8s status ([73fe2f4](https://www.github.com/sbulav/dotfiles/commit/73fe2f408a1b1c2694b82b29e1c37dc40d0f10dd))

## [3.0.0](https://www.github.com/sbulav/dotfiles/compare/v2.3.0...v3.0.0) (2023-10-03)


### ⚠ BREAKING CHANGES

* migrate darwin to nix

### Features

* add nix autoclean ([2a9c993](https://www.github.com/sbulav/dotfiles/commit/2a9c9930476a040391a79766020e04bea998c857))
* **fish:** add mysql bin to PATH ([bed12d8](https://www.github.com/sbulav/dotfiles/commit/bed12d82f103e4295b9184c97118d4612c9c2343))
* **kitty:** allow window closing ([f16eec5](https://www.github.com/sbulav/dotfiles/commit/f16eec5dd1a3ac382af5135ebfab37a385cd840e))
* migrate darwin to nix ([620d0cd](https://www.github.com/sbulav/dotfiles/commit/620d0cd3678328afd1292703aae5c40db1b2eca8))
* **nix:** add build scripts ([29814df](https://www.github.com/sbulav/dotfiles/commit/29814df4da227d95db9cb82b6c695e79008c0fcc))
* **nix:** add copyq ([99d36fc](https://www.github.com/sbulav/dotfiles/commit/99d36fcc58874728b99dd1eb5061e2a9ff2f7b65))
* **nix:** add file manager, XF86 mic key ([a3e1319](https://www.github.com/sbulav/dotfiles/commit/a3e1319b2c02734aeafc8ba7ee44d7c621dad475))
* **nix:** add home-manager, rofi ([0b07ffc](https://www.github.com/sbulav/dotfiles/commit/0b07ffcf20d4d72d18ff0f153d48db597e0efd6a))
* **nix:** add swaylock ([a2606bf](https://www.github.com/sbulav/dotfiles/commit/a2606bf5f8dc1e78a5efd606ae73502610150bbf))
* **nix:** allow sudo via touchID ([01829cb](https://www.github.com/sbulav/dotfiles/commit/01829cb1b11e9b92083f804c17a4e6ec76ffe00f))
* **nix:** fix hidpi scaling, add swayidle ([561fbef](https://www.github.com/sbulav/dotfiles/commit/561fbef29cdb353c0874c5476bf9e83e74adea9f))
* **nix:** fix hyprland deps and startup time ([1efc0ee](https://www.github.com/sbulav/dotfiles/commit/1efc0eec6c59b19663884c9e2e20d8ef1285056b))
* **nix:** fix nixos rofi;add file ([49e436d](https://www.github.com/sbulav/dotfiles/commit/49e436dc33f8e5a48e8bb1f14af2d4c837cbfe08))
* **nix:** Install alejandro formatter ([12d7fed](https://www.github.com/sbulav/dotfiles/commit/12d7fedff82aecfd2363e3c786f9d54d23ab624c))
* **nixos:** work on packages ([1160744](https://www.github.com/sbulav/dotfiles/commit/1160744dc8d766775e73a246a23bdf7a1deb4b2b))
* **nix:** reorganize file structure ([d3e9cfb](https://www.github.com/sbulav/dotfiles/commit/d3e9cfbbdfc29146fbe8e5df7609dd3b59119e1f))
* **nix:** set up hyprpaper for wallpapers ([98db9a5](https://www.github.com/sbulav/dotfiles/commit/98db9a5ca2aff373c76be8979f1003b20eb7969a))
* **nix:** start working on waybar ([82323c6](https://www.github.com/sbulav/dotfiles/commit/82323c61861ab8465b64dc7b17892794efc52f65))
* **nix:** stop using GTK portal; set up mime associations ([58cc62d](https://www.github.com/sbulav/dotfiles/commit/58cc62d37f74d60504169015f3ce13563d295835))
* **nix:** switch to greetd+regreet ([76ae341](https://www.github.com/sbulav/dotfiles/commit/76ae341cf0e28d63da16def0e950401c02926ea3))
* **nix:** switch to unstable, add waybar ([b8648cd](https://www.github.com/sbulav/dotfiles/commit/b8648cd72e2b730a1df161aedc4bda0a449c8538))
* **nix:** use master for home-manager and shared packages ([62befbb](https://www.github.com/sbulav/dotfiles/commit/62befbb0154c5c92a2d9b568488f81024f50f460))
* **nix:** use nix flakes ([6008a74](https://www.github.com/sbulav/dotfiles/commit/6008a74d2667818e7356cff16e97344975bdd861))
* **nix:** work on kb switching ([89260e8](https://www.github.com/sbulav/dotfiles/commit/89260e8d76e3ff379c07dbe81cf45e88f2e14a23))
* **nvim:** add highlight ([075a2da](https://www.github.com/sbulav/dotfiles/commit/075a2da2c1d5212b2a8ab454c86a8a8a800b18d5))
* **nvim:** add mapping to paste above/below ([595c02e](https://www.github.com/sbulav/dotfiles/commit/595c02e737982e3633055cd5bd67e8a705549ce8))
* **nvim:** migrate to blankline v3 ([e3d12a4](https://www.github.com/sbulav/dotfiles/commit/e3d12a476cace3bfc3a958882289890d0d8b84b3))
* **nvim:** migrate to conform for formatting ([91e830e](https://www.github.com/sbulav/dotfiles/commit/91e830eec7c534850a9596c88457d7f0a1aeda2a))
* **nvim:** remap yanking cmd, add hunk_preview ([0b41a29](https://www.github.com/sbulav/dotfiles/commit/0b41a29ac2b4c0392304645e0a7809d8a7090084))
* **nvim:** use lsp managed by nix ([0b81336](https://www.github.com/sbulav/dotfiles/commit/0b813368e0b30245044d9781444e586c6b7101df))


### Bug Fixes

* fix lf previewer(works in tmux!) ([2b5a86f](https://www.github.com/sbulav/dotfiles/commit/2b5a86f418fbe65ab2dbb62137cc06ee9902e758))
* **lf:** correct script for the preview ([95959eb](https://www.github.com/sbulav/dotfiles/commit/95959eb08ed46f7fcfc388e163eda48ef6684948))
* **lf:** fix video preview in lf ([98650e1](https://www.github.com/sbulav/dotfiles/commit/98650e1db85485c18e150df8c24a07ce71d09070))
* **nvim:** lf now requires setup ([b906e40](https://www.github.com/sbulav/dotfiles/commit/b906e4058aaff0a2517a2eebfbe135b4d0d481af))
* **nvim:** pin lf.nvim as latest commits broke its start ([345633a](https://www.github.com/sbulav/dotfiles/commit/345633a21d86d702627eedb93b912922143a3d66))
* **nvim:** remove lightbulb sign as it shakes screen on marksman ([01899d1](https://www.github.com/sbulav/dotfiles/commit/01899d1380d01dba988ff45608b617d108e98c06))
* **nvim:** use correct lspsaga function for symbols ([6100f96](https://www.github.com/sbulav/dotfiles/commit/6100f9614ed12565f3c9728be812fc58ed8d7e3f))

## [2.3.0](https://www.github.com/sbulav/dotfiles/compare/v2.2.0...v2.3.0) (2023-08-03)


### Features

* add mini.hipatterns to highlight words/hex colors ([0c32fdc](https://www.github.com/sbulav/dotfiles/commit/0c32fdce48f9acd94fa6bb9c4bdea15ae8c3365c))
* migrate to mini.surround ([cd51466](https://www.github.com/sbulav/dotfiles/commit/cd51466aef08506978fede48704cec9de3f03c06))
* migrate to mini.trailspace ([d460f6a](https://www.github.com/sbulav/dotfiles/commit/d460f6abf164a7242c1c9e66e54b8addba303c12))
* move to mini.splitjoin ([4f1686c](https://www.github.com/sbulav/dotfiles/commit/4f1686c61a087011d43964fd9c8f3bc7f2d5b5f7))
* **nvim:** switch to use main mini repo ([3396b27](https://www.github.com/sbulav/dotfiles/commit/3396b27069d794276f18ea049a9a9240e5c54974))


### Bug Fixes

* **lf:** update icons to new format ([bd937a8](https://www.github.com/sbulav/dotfiles/commit/bd937a8a058930861ef25d19e8b454c3087e7929))
* **nvim:** small fixes to yamlls ([b07a1ed](https://www.github.com/sbulav/dotfiles/commit/b07a1edb6891e63bdc80de4b6beb6d96c4c99276))
* remove help filetype from treesitter ([3ffa533](https://www.github.com/sbulav/dotfiles/commit/3ffa533c090bcf74e09577ad353c3de00b2d5fc7))
* use correct autocommand name to avoid conflicts ([179e58a](https://www.github.com/sbulav/dotfiles/commit/179e58a03a890e6af094e909df9cd025a9e6c33d))

## [2.2.0](https://www.github.com/sbulav/dotfiles/compare/v2.1.0...v2.2.0) (2023-07-03)


### Features

* add treesj plugin ([66d0a4d](https://www.github.com/sbulav/dotfiles/commit/66d0a4dfb383014011b39fe69e01c0951c03ba20))
* **nvim:** add lspsaga outline keymap ([851869c](https://www.github.com/sbulav/dotfiles/commit/851869c35f45d4f3f6693eb9e2335fb21db6e3fd))
* **nvim:** switch to maintained HiPhish/nvim-ts-rainbow2 ([6e5b74e](https://www.github.com/sbulav/dotfiles/commit/6e5b74e5e77189b71e8fef4c22e69ae3a205c92d))
* replace hop with flash.nvim ([2d727b3](https://www.github.com/sbulav/dotfiles/commit/2d727b319d5ce4c34405d9a080af94e37fb7d709))


### Bug Fixes

* disable jenkinsfile linker for now ([f90b6bf](https://www.github.com/sbulav/dotfiles/commit/f90b6bf7cfb25bdfa1ac5c23e921728afcc7c397))
* I prefer 2 chars for markdown ([09480b5](https://www.github.com/sbulav/dotfiles/commit/09480b52c0ad67e2ceb350b2d89b6bae62ebb2ec))
* **lf:** work on files with speces ([bf89f0b](https://www.github.com/sbulav/dotfiles/commit/bf89f0b5ffd5a0ff2c44e5b7bef7bddecfb4bca7))
* new lf.nvim width/height ([3a25349](https://www.github.com/sbulav/dotfiles/commit/3a2534986aa1250230e0aa9a60ace424dfbc561f))
* **nvim:** tabnine setup call ([b3a11e3](https://www.github.com/sbulav/dotfiles/commit/b3a11e3a587920bfd883e8f57e976598c26ad277))

## [2.1.0](https://www.github.com/sbulav/dotfiles/compare/v2.0.0...v2.1.0) (2023-02-02)


### Features

* add marksman language server ([6ba07ed](https://www.github.com/sbulav/dotfiles/commit/6ba07ed3debc92a0d30727f9b076e24b31a26ca9))
* migrate to glepnir's lsp saga ([19e96e2](https://www.github.com/sbulav/dotfiles/commit/19e96e26d0fff523a905271690dba4c8e4945cc8))
* **nvim:** add k8s snippets ([95a2fe0](https://www.github.com/sbulav/dotfiles/commit/95a2fe07c1ab1a8af5b4e986caf48ec015a8d372))
* **nvim:** use code actions provided by lspsaga ([e04f9fe](https://www.github.com/sbulav/dotfiles/commit/e04f9fe12d602699f5a79e1def8d675d212e25e3))
* **nvim:** use jsonstore to load yaml schemas ([4f77cf3](https://www.github.com/sbulav/dotfiles/commit/4f77cf34c3ee88f22a9526341fb812aec72534dd))
* **nvim:** use lspsaga in statusline ([51da9c3](https://www.github.com/sbulav/dotfiles/commit/51da9c375a3711414bf5a04f18aa9e6b7d7e39f4))
* yaml path and mappings ([b595178](https://www.github.com/sbulav/dotfiles/commit/b595178a82a8e3470c7049a11ba196ed9ef6f34e))


### Bug Fixes

* alpha edit plugins hotkey ([d33595f](https://www.github.com/sbulav/dotfiles/commit/d33595fa6bd9219caae2ee28dd335b626fb90f25))
* **nvim:** add more fugitive commands on load ([8927ffb](https://www.github.com/sbulav/dotfiles/commit/8927ffb602e9c9b6c80bff6532ae872eb8d8684b))
* **nvim:** bump k8s schema ([abaeda7](https://www.github.com/sbulav/dotfiles/commit/abaeda7a21f843a69bc80315fd37c15225d5accb))

## [2.0.0](https://www.github.com/sbulav/dotfiles/compare/v1.30.0...v2.0.0) (2023-01-13)


### ⚠ BREAKING CHANGES

* migrate to lazy.nvim

### Features

* add base64 plugin and mappings ([1ba1a20](https://www.github.com/sbulav/dotfiles/commit/1ba1a201b09e19ff03fe265bad8863df5385aa6e))
* migrate to lazy.nvim ([cfe56b9](https://www.github.com/sbulav/dotfiles/commit/cfe56b99d740e344e086eee327e284fe33b01e7f))


### Bug Fixes

* **nvim:** add terraformls to LSP servers ([2c90e4f](https://www.github.com/sbulav/dotfiles/commit/2c90e4fcadbede8a918fd7afb1ec7243fa9153b8))
* **nvim:** update spell list ([ab653bd](https://www.github.com/sbulav/dotfiles/commit/ab653bdba9110800dae294b7970d169504adc102))

## [1.30.0](https://www.github.com/sbulav/dotfiles/compare/v1.29.1...v1.30.0) (2022-11-24)


### Features

* **git:** add autoSetupRemote ([f81ed0f](https://www.github.com/sbulav/dotfiles/commit/f81ed0fec9df0e5ced85f83785a9a4692f95ab39))
* **kubectl:** add k wrapper for kubectl ([50729d5](https://www.github.com/sbulav/dotfiles/commit/50729d517a615e9a34e8dee2e854be2cacc8af12))
* **nvim:** add function to yank current filename ([6a12403](https://www.github.com/sbulav/dotfiles/commit/6a12403642b2597db44cc0d9c282eb69d572e078))
* **nvim:** add indentscope for hl and textobj ([0597981](https://www.github.com/sbulav/dotfiles/commit/0597981d9b6b4b3af77fae572542001f7fd41f19))


### Bug Fixes

* disable indentoscope some filetypes ([229992d](https://www.github.com/sbulav/dotfiles/commit/229992de8c1ba3ac8a80bb411030861d5c1eca87))
* remove lspcontainers, use mason ([217f078](https://www.github.com/sbulav/dotfiles/commit/217f078b1c3771fa4b16a0bf48e99b9659253b8d))

### [1.29.1](https://www.github.com/sbulav/dotfiles/compare/v1.29.0...v1.29.1) (2022-10-28)


### Bug Fixes

* Makefile missing endif ([e529c23](https://www.github.com/sbulav/dotfiles/commit/e529c23751e5843ef2a664b97b2328c7e28c774e))

## [1.29.0](https://www.github.com/sbulav/dotfiles/compare/v1.28.0...v1.29.0) (2022-10-28)


### Features

* bump apps vers, fix fonts/colemak, symlinks ([aede110](https://www.github.com/sbulav/dotfiles/commit/aede1108a017795b903a407e8501ac963c7fb535))
* switch to lf.nvim ([4e9aee0](https://www.github.com/sbulav/dotfiles/commit/4e9aee07607e6b9c6cb91e98e5900b197012820f))


### Bug Fixes

* correct custom filetype detection ([9a8a0b0](https://www.github.com/sbulav/dotfiles/commit/9a8a0b0563cecd345140b38ee08efec487720626))
* K9S mappings ([5929d30](https://www.github.com/sbulav/dotfiles/commit/5929d30fea13b1a33f60bcdc4ed4aba2d04aa58b))
* lua docs and includes ([ef1280d](https://www.github.com/sbulav/dotfiles/commit/ef1280dae37240384a70927817b9b73019550a61))
* **nvim:** fix nvim urlopen search string ([34cd639](https://www.github.com/sbulav/dotfiles/commit/34cd6393021ba4f1db682f91f2f6519efd2a1ff2))
* **nvim:** Format command use vim.lsp.buf.format ([9d35a5c](https://www.github.com/sbulav/dotfiles/commit/9d35a5c4b19b9ed2349244da2c95f49d0da2ac6a))
* **nvim:** open urls with _ in repo name ([1e599b6](https://www.github.com/sbulav/dotfiles/commit/1e599b61807ea32ac22e157f921b1b7dc1c94948))
* user acync ([a9af3ed](https://www.github.com/sbulav/dotfiles/commit/a9af3edb53b7887e6f0c9563fdb8c349306d104b))

## [1.28.0](https://www.github.com/sbulav/dotfiles/compare/v1.27.0...v1.28.0) (2022-10-12)


### Features

* **lf:** add more commands ([8e0bb0d](https://www.github.com/sbulav/dotfiles/commit/8e0bb0d1b2a43639fcccbd8738f911b749ea7b90))
* **lf:** use G to open nvim Fugitive ([0b0817e](https://www.github.com/sbulav/dotfiles/commit/0b0817e069ed39b241ed6ac297eda2f27d57b1e2))
* **nvim:** switch to vim.lsp.buf.format ([a493269](https://www.github.com/sbulav/dotfiles/commit/a4932690e97b35df17a6b1d8d4bd1743afd00928))
* **nvim:** use default filetype detect in 0.8 ([0e3b7ab](https://www.github.com/sbulav/dotfiles/commit/0e3b7abc2d6f934b95ea7de9f32307ffb9dbb073))
* **nvim:** use jsonpath in lualine for json ([4e216e0](https://www.github.com/sbulav/dotfiles/commit/4e216e04a26121fa119ac94a225224e25a020916))


### Bug Fixes

* **lf:** add more mappings ([0dede7d](https://www.github.com/sbulav/dotfiles/commit/0dede7df1975489761d5e976d0f40a0182d6911c))
* **nvim:** add more words to spell ([b221be3](https://www.github.com/sbulav/dotfiles/commit/b221be3b23b45a8a127395290ed9e04998d9f9d6))
* **nvim:** pin alpha to have MRU starting at 0 ([2ec394f](https://www.github.com/sbulav/dotfiles/commit/2ec394f256e9909d3a13efbc8a54ca203aa02e76))

## [1.27.0](https://www.github.com/sbulav/dotfiles/compare/v1.26.0...v1.27.0) (2022-09-22)


### Features

* **lf:** try to use lf file manager ([1caa897](https://www.github.com/sbulav/dotfiles/commit/1caa8972020cfc5bcc8bbfc0d1032fe2f1c59b84))
* **nvim:** rework gx to open git repos ([a0baeb8](https://www.github.com/sbulav/dotfiles/commit/a0baeb87a82f3f61f72da99c6725526feb8d717f))
* **nvim:** start LSP on InsertEnter ([ba51e73](https://www.github.com/sbulav/dotfiles/commit/ba51e73b0456ee677bb5a972132ff3e6ad9e9e6d))
* **nvim:** use native filetype detection ([722086d](https://www.github.com/sbulav/dotfiles/commit/722086ddd866619295a9d0584ffb615a2a03f433))


### Bug Fixes

* **lf:** comment the comments if the lf ([60a90f5](https://www.github.com/sbulav/dotfiles/commit/60a90f547d8946410e313c8a920eec63cbddf79f))
* **nvim:** always start treesitter ([acae014](https://www.github.com/sbulav/dotfiles/commit/acae01404c7f21cef68915cf34e5aa3e6c283560))
* **nvim:** fix pwd snip, add filename ([a0dfcc0](https://www.github.com/sbulav/dotfiles/commit/a0dfcc0978c1eddf032aadadda05e2cfb422c2fb))
* **nvim:** lsp capabilities for linux ([b00bb38](https://www.github.com/sbulav/dotfiles/commit/b00bb38fd987f7561f393c9f616aa0a2f8131390))

## [1.26.0](https://www.github.com/sbulav/dotfiles/compare/v1.25.0...v1.26.0) (2022-07-25)


### Features

* **nvim:** migrate from nvim-gps to nvim-navic ([4c1d6fa](https://www.github.com/sbulav/dotfiles/commit/4c1d6fa8ce5bdbb9e401f6e341dc1a7df952df14))
* **nvim:** remove copilot ([3043f21](https://www.github.com/sbulav/dotfiles/commit/3043f21f1c0a631341d66fa6586ed27b4d4d6d1f))


### Bug Fixes

* **fish:** check if tmux is run from interactive ([46de25c](https://www.github.com/sbulav/dotfiles/commit/46de25c7ef7846a3c0836cb4455ae316b86d73a5))

## [1.25.0](https://www.github.com/sbulav/dotfiles/compare/v1.24.0...v1.25.0) (2022-06-09)


### Features

* **git:** use work email and sign it ([fbdbf3a](https://www.github.com/sbulav/dotfiles/commit/fbdbf3a7ea5c483e7307a369b58a57061b230261))
* **nvim:** allow CR to next line w/o completion ([f981724](https://www.github.com/sbulav/dotfiles/commit/f9817245f174991ad8e652f00dd468a059b53872))
* **nvim:** use terraform-ls for formatting ([4315c61](https://www.github.com/sbulav/dotfiles/commit/4315c6121be58377f9e6776f9a65745f5553f7c4))
* use proper function to detect client capabilities ([930cc95](https://www.github.com/sbulav/dotfiles/commit/930cc95c5f5efa6d5ac0a0da1f3045152df17c58))


### Bug Fixes

* **nvim:** add mappings to surround on ' ([20cbeb9](https://www.github.com/sbulav/dotfiles/commit/20cbeb94fd4b46e110d6cebc6c3ad3fe8b3724c1))
* **nvim:** re-enable tab to swap windows ([24d5cc2](https://www.github.com/sbulav/dotfiles/commit/24d5cc28612b8a3c244d014c828bb9e9ff080b5f))

## [1.24.0](https://www.github.com/sbulav/dotfiles/compare/v1.23.0...v1.24.0) (2022-05-05)


### Features

* **nvim:** add delete marks shortcut ([152e352](https://www.github.com/sbulav/dotfiles/commit/152e3529706004ac8dfd20cc5e39cedf39fe4704))
* **nvim:** add pp alias to new vim.pretty_print ([59bfbc5](https://www.github.com/sbulav/dotfiles/commit/59bfbc51f42b55a92d2984d6c6a6243f7fc47acd))

## [1.23.0](https://www.github.com/sbulav/dotfiles/compare/v1.22.0...v1.23.0) (2022-05-04)


### Features

* **nvim:** add opt to don't continue comments ([f006451](https://www.github.com/sbulav/dotfiles/commit/f006451f7871a0026d627fce4cea7197e3f9beff))
* **nvim:** add packages status to alpha ([0cf540d](https://www.github.com/sbulav/dotfiles/commit/0cf540d31bfda6f267a8b010389f86866b6c1fd7))
* **nvim:** display attached LSP clients ([c5728eb](https://www.github.com/sbulav/dotfiles/commit/c5728eb9529b60ad694fd6b1715340c4ca7d5314))
* **nvim:** try to improve work with marks ([c434c4a](https://www.github.com/sbulav/dotfiles/commit/c434c4a2fa85e104b633d4822f86f3d14540d468))


### Bug Fixes

* **nvim:** don't trigger err if no emply eof ([ed1c9a9](https://www.github.com/sbulav/dotfiles/commit/ed1c9a926650c72b440686e4d32cbee807d363c3))
* **nvim:** fix gf broken by wildignore ([51252b8](https://www.github.com/sbulav/dotfiles/commit/51252b8595789c980b1c1d1fcfb2ae7cad657b79))
* **nvim:** sync autoformat to avoid double save ([62af92c](https://www.github.com/sbulav/dotfiles/commit/62af92ce3c95bf7999237706926e9c6c5197f300))
* **nvim:** use correct diag mapping ([9532eae](https://www.github.com/sbulav/dotfiles/commit/9532eae55e8a8abe9dcab2647682ddf678cdb2a3))
* **nvim:** use only null-ls for formatting ([f28174b](https://www.github.com/sbulav/dotfiles/commit/f28174b24567750d8752f8e590f14a0d663938e3))

## [1.22.0](https://www.github.com/sbulav/dotfiles/compare/v1.21.0...v1.22.0) (2022-04-22)


### Features

* **nvim:** Enable global statusline ([d8d0c63](https://www.github.com/sbulav/dotfiles/commit/d8d0c63ea871f1b23b84ecfd4a771ab1e7c0d3ee))
* **nvim:** migrate strip_trailing_spaces to lua ([29eb110](https://www.github.com/sbulav/dotfiles/commit/29eb110e614356ee3de152197808a95aab4ae1bf))
* **nvim:** migrate suffixes to lua ([af59250](https://www.github.com/sbulav/dotfiles/commit/af59250947884e0187505e939714ad92a013ef70))
* **nvim:** migrate to stevearc/qf_helper.nvim ([9bc07f3](https://www.github.com/sbulav/dotfiles/commit/9bc07f35bff0c0e3ba9a1c66c84264dc28b3e84a))
* **nvim:** migrate wildmenu opts to lua ([163334f](https://www.github.com/sbulav/dotfiles/commit/163334fa6caf21573dc47e0ea85c2c77f163d0f5))
* **nvim:** optimize cmp, select 1 entry on cr ([4aa4934](https://www.github.com/sbulav/dotfiles/commit/4aa4934490c31d55ca28db85cadf7866d1a6037c))

## [1.21.0](https://www.github.com/sbulav/dotfiles/compare/v1.20.0...v1.21.0) (2022-04-21)


### Features

* **nvim:** migrate to indent-blankline ([b6009d4](https://www.github.com/sbulav/dotfiles/commit/b6009d404576a8931fdb73d6dd3bf1cde72234fd))
* **nvim:** reorder plugins ([01ef0f1](https://www.github.com/sbulav/dotfiles/commit/01ef0f1c82f8ed8f4556017803552ffed79fa97e))

## [1.20.0](https://www.github.com/sbulav/dotfiles/compare/v1.19.0...v1.20.0) (2022-04-19)


### Features

* **git:** sign commits with GPG ([b644dd4](https://www.github.com/sbulav/dotfiles/commit/b644dd4f0dfe16d149c7a0dc32a0cac154fc37f2))
* **gpg:** configure gpg agent compatible with nvim ([5e75873](https://www.github.com/sbulav/dotfiles/commit/5e758735481391247be3cb5a8a91e023f84df826))


### Bug Fixes

* **gpg:** tty is not required for loopback ([ddda3e3](https://www.github.com/sbulav/dotfiles/commit/ddda3e33a3d6b51bff05a97427171806cf98fa15))

## [1.19.0](https://www.github.com/sbulav/dotfiles/compare/v1.18.0...v1.19.0) (2022-04-19)


### Features

* **nvim:** add terraform_doc and mappings ([943f201](https://www.github.com/sbulav/dotfiles/commit/943f201cce3836b4cd38a51598eab8886a644f1c))
* **nvim:** add treesitter cmp source ([9b18f29](https://www.github.com/sbulav/dotfiles/commit/9b18f296550e33e22eff989766bf4d368164ede8))
* **nvim:** set up cmp suggestions sorting ([4225a27](https://www.github.com/sbulav/dotfiles/commit/4225a27417f377a0e62cf5b6094845f058e4eb9b))

## [1.18.0](https://www.github.com/sbulav/dotfiles/compare/v1.17.1...v1.18.0) (2022-04-18)


### Features

* **nvim:** first autocommands to 0.7 syntax ([16df934](https://www.github.com/sbulav/dotfiles/commit/16df9346dd6583f2c42182b1cfd7b02aadb580a4))
* **nvim:** second wave of updated autocommands ([200989e](https://www.github.com/sbulav/dotfiles/commit/200989ef6d0455ca3eb136d0295b25425118aecd))

### [1.17.1](https://www.github.com/sbulav/dotfiles/compare/v1.17.0...v1.17.1) (2022-04-14)


### Bug Fixes

* **nvim:** disable copilot for markdown ([a7f9b2f](https://www.github.com/sbulav/dotfiles/commit/a7f9b2f86a2892b403655a0ce4eb8c36ef65767e))

## [1.17.0](https://www.github.com/sbulav/dotfiles/compare/v1.16.0...v1.17.0) (2022-04-06)


### Features

* add copilot.lua ([96fe7e2](https://www.github.com/sbulav/dotfiles/commit/96fe7e2238b2109f82be48bc1727ed40a56aec95))


### Bug Fixes

* **nvim:** correct tf filetype detection ([1c2314c](https://www.github.com/sbulav/dotfiles/commit/1c2314c370700280bf952a3a2a4976cb152f9fa6))
* **nvim:** move detection to filetype.nvim ([fea9104](https://www.github.com/sbulav/dotfiles/commit/fea9104bb71eb878a3fed8f30dd39dc5335402da))
* **nvim:** vim-terraform replaced by ts+null-ls ([474df61](https://www.github.com/sbulav/dotfiles/commit/474df612f16a53c256f9bb11890253fe244085fa))

## [1.16.0](https://www.github.com/sbulav/dotfiles/compare/v1.15.0...v1.16.0) (2022-04-04)


### Features

* **nvim:** add color parenthesis ([085ac7f](https://www.github.com/sbulav/dotfiles/commit/085ac7f0540568e21f73a87cf3fe115bf3b75a63))

## [1.15.0](https://www.github.com/sbulav/dotfiles/compare/v1.14.2...v1.15.0) (2022-03-31)


### Features

* **nvim:** add nvim-jenkinsfile-linter ([45affcd](https://www.github.com/sbulav/dotfiles/commit/45affcd0b5ba82952689dd12b5feb19dd5f46bec))


### Bug Fixes

* remove obsolete nvim-tree auto-close ([9846ba9](https://www.github.com/sbulav/dotfiles/commit/9846ba912c98accadd93233671863ad5443a40ae))

### [1.14.2](https://www.github.com/sbulav/dotfiles/compare/v1.14.1...v1.14.2) (2022-03-10)


### Bug Fixes

* cmp path completions ([7599e4e](https://www.github.com/sbulav/dotfiles/commit/7599e4eeeb6c682ea0e0af6cffac49c4daec02c3))
* k9s mappings ([8fc01c1](https://www.github.com/sbulav/dotfiles/commit/8fc01c16946034c237fb678c40379cf11c3921a4))

### [1.14.1](https://www.github.com/sbulav/dotfiles/compare/v1.14.0...v1.14.1) (2022-02-18)


### Bug Fixes

* fix Makefile fonts for linux ([52f1d50](https://www.github.com/sbulav/dotfiles/commit/52f1d50f6b2dafa40d9f4ee4ddbe6f2ca0288655))
* **nvim:** change k9s mapping to allow usage of _ ([37187b9](https://www.github.com/sbulav/dotfiles/commit/37187b963a4508877933c71554558fc7f36355f3))
* **nvim:** fix alt-e command triggering toggleterm ([d07d8ec](https://www.github.com/sbulav/dotfiles/commit/d07d8ece5f46abeb1bcae922ff110b776eca3689))

## [1.14.0](https://www.github.com/sbulav/dotfiles/compare/v1.13.0...v1.14.0) (2022-02-16)


### Features

* **fish:** Update fish plugins ([213b51b](https://www.github.com/sbulav/dotfiles/commit/213b51b808521f9ab3500c336c318f686535ec17))
* use my fork of base16 coloschemes ([2cb565b](https://www.github.com/sbulav/dotfiles/commit/2cb565b984d3bd82ad314abf20be33be30898652))

## [1.13.0](https://www.github.com/sbulav/dotfiles/compare/v1.12.0...v1.13.0) (2022-02-15)


### Features

* **nvim:** add new startup mapping ([1243e3c](https://www.github.com/sbulav/dotfiles/commit/1243e3c2c6f510b5ee28b914dad102adcb7a75ad))


### Bug Fixes

* **nvim:** pin tami5 to get my colorscheme ([e840ee2](https://www.github.com/sbulav/dotfiles/commit/e840ee20461e07f277ef44856cbae9066468040e))

## [1.12.0](https://www.github.com/sbulav/dotfiles/compare/v1.11.0...v1.12.0) (2022-02-02)


### Features

* **nvim:** Use lualine for statusline ([a486b18](https://www.github.com/sbulav/dotfiles/commit/a486b182ed3a7fc425cd4237d5b71dfeeef0b567))

## [1.11.0](https://www.github.com/sbulav/dotfiles/compare/v1.10.0...v1.11.0) (2022-02-01)


### Features

* **fish:** source env creds ([dda0686](https://www.github.com/sbulav/dotfiles/commit/dda0686de7ba3e321e45b0c0947e041bf372747e))
* **nvim:** vertical term on c-\,float on | ([fce5d0c](https://www.github.com/sbulav/dotfiles/commit/fce5d0c60c01d5204d565f872b4938203c0f0cc3))


### Bug Fixes

* **nvim:** fix nredir mappings ([5142eea](https://www.github.com/sbulav/dotfiles/commit/5142eea6d27d35ea4370ecfe05bcfedd8481d947))

## [1.10.0](https://www.github.com/sbulav/dotfiles/compare/v1.9.1...v1.10.0) (2022-01-31)


### Features

* **nvim:** "migrate" to surround.nvim ([3a6140f](https://www.github.com/sbulav/dotfiles/commit/3a6140f67f5d9123a04bbe3360846b7f085c2df5))
* **nvim:** Use toggleterm ([e09d55f](https://www.github.com/sbulav/dotfiles/commit/e09d55f22d845ba9844004096bab987ce1dcd5ef))


### Bug Fixes

* missing link to kube-tmux ([83a1eff](https://www.github.com/sbulav/dotfiles/commit/83a1effb29000c0698515c40f8e4e01de25d4dd4))
* **nvim:** add filetypes disabled with nathom plug ([16c52a7](https://www.github.com/sbulav/dotfiles/commit/16c52a791741215f646a648f08ebf87c12363e50))
* **nvim:** fix f5-6 commands expand ([c345593](https://www.github.com/sbulav/dotfiles/commit/c345593461ab500c61d499a1b34024002ecbaaa8))

### [1.9.1](https://www.github.com/sbulav/dotfiles/compare/v1.9.0...v1.9.1) (2022-01-26)


### Bug Fixes

* tune notify timeout to 1000 ([a712b70](https://www.github.com/sbulav/dotfiles/commit/a712b70be74db405ef20fc55da089f6ed283a7c3))

## [1.9.0](https://www.github.com/sbulav/dotfiles/compare/v1.8.0...v1.9.0) (2022-01-26)


### Features

* new keymap for Telescope branches ([8e3bf8f](https://www.github.com/sbulav/dotfiles/commit/8e3bf8fa76719e1c31c601a7d49c02ab656d30e7))
* use patched font in Kitty ([26dad92](https://www.github.com/sbulav/dotfiles/commit/26dad926ff7f53ace8169a5b5b3b1a1fb8def4cb))

## [1.8.0](https://www.github.com/sbulav/dotfiles/compare/v1.7.1...v1.8.0) (2022-01-20)


### Features

* **nvim:** move to base16-oceanicnext colorscheme ([82bc8f0](https://www.github.com/sbulav/dotfiles/commit/82bc8f0c72144ce3b4c868361dfb5c1d7576e4bf))

### [1.7.1](https://www.github.com/sbulav/dotfiles/compare/v1.7.0...v1.7.1) (2022-01-18)


### Bug Fixes

* escape backquotes in workflows ([c1b0b5d](https://www.github.com/sbulav/dotfiles/commit/c1b0b5d18e08eb45b936b87959846e4998c165b3))

## [1.7.0](https://www.github.com/sbulav/dotfiles/compare/v1.6.1...v1.7.0) (2022-01-18)


### Features

* **kitty:** add kitty config ([1550db4](https://www.github.com/sbulav/dotfiles/commit/1550db41b10144818aba2a9424bd771f966b048b))

### [1.6.1](https://www.github.com/sbulav/dotfiles/compare/v1.6.0...v1.6.1) (2022-01-14)


### Bug Fixes

* install missing plugins ([7400a36](https://www.github.com/sbulav/dotfiles/commit/7400a3600993269bf6649b380d84e376364e57a5))

## [1.6.0](https://www.github.com/sbulav/dotfiles/compare/v1.5.0...v1.6.0) (2022-01-13)


### Features

* **nvim:** Add lightbulb to hl code_action ([2fc4174](https://www.github.com/sbulav/dotfiles/commit/2fc41740523b01deaef1d3a7a9e48c29536cc5f5))


### Bug Fixes

* **nvim:** Remove null-ls code_action ([87467a0](https://www.github.com/sbulav/dotfiles/commit/87467a0a84843fef83c8498bca5b4496fd81f9b2))

## [1.5.0](https://www.github.com/sbulav/dotfiles/compare/v1.4.0...v1.5.0) (2022-01-12)


### Features

* **nvim:** properly init telescope plugins ([c98e5d3](https://www.github.com/sbulav/dotfiles/commit/c98e5d3d0eb915610066a688361f9f784ee9425b))

## [1.4.0](https://www.github.com/sbulav/dotfiles/compare/v1.3.2...v1.4.0) (2021-12-27)


### Features

* **nvim:** Use my fork of telescope-github ([abae865](https://www.github.com/sbulav/dotfiles/commit/abae865774efbb540957884bb6f4675a44328c74))

### [1.3.2](https://www.github.com/sbulav/dotfiles/compare/v1.3.1...v1.3.2) (2021-12-22)


### Bug Fixes

* **nvim:** correctly remap goto definition ([2a70038](https://www.github.com/sbulav/dotfiles/commit/2a70038dc3cddf1ed133d8a7c889712ee3a24cef))

### [1.3.1](https://www.github.com/sbulav/dotfiles/compare/v1.3.0...v1.3.1) (2021-12-22)


### Bug Fixes

* **nvim:** no numbers in terminal ([9d120d2](https://www.github.com/sbulav/dotfiles/commit/9d120d2a18ccb5363bb096b9c67d6bdabbadbefb))

## [1.3.0](https://www.github.com/sbulav/dotfiles/compare/v1.2.1...v1.3.0) (2021-12-20)


### Features

* **nvim:** use nvim-notify ([09e4c3c](https://www.github.com/sbulav/dotfiles/commit/09e4c3cfd9f9c290263045c30f9d61cf033a6b60))

### [1.2.1](https://www.github.com/sbulav/dotfiles/compare/v1.2.0...v1.2.1) (2021-12-13)


### Bug Fixes

* use new null-ls syntax ([3c6bb96](https://www.github.com/sbulav/dotfiles/commit/3c6bb9622c29fbdced24c248ef54852ffd248827))

## [1.2.0](https://www.github.com/sbulav/dotfiles/compare/v1.1.0...v1.2.0) (2021-12-06)


### Features

* **nvim:** add go snippets ([0dabd39](https://www.github.com/sbulav/dotfiles/commit/0dabd397ca572f4a4e354fac5f0e161936c189df))

## [1.1.0](https://www.github.com/sbulav/dotfiles/compare/v1.0.0...v1.1.0) (2021-12-06)


### Features

* **nvim:** add cheat sh wrapper ([658bd72](https://www.github.com/sbulav/dotfiles/commit/658bd72af47e843bd48eb794f3bc967fa7bd7316))

## 1.0.0 (2021-12-01)


### Features

* amend settings for neovim 0.6 ([6b3067b](https://www.github.com/sbulav/dotfiles/commit/6b3067b109ac91f30aeb1f1785a31d4991db63c1))
* speed up neovim filetype detection ([869abeb](https://www.github.com/sbulav/dotfiles/commit/869abeb7e9d4d154e1c4b2748164141c976a6548))
* Try to use conventional commits ([4ad335c](https://www.github.com/sbulav/dotfiles/commit/4ad335c181360406881c5c11dac43765e5a0c2f3))


### Bug Fixes

* no et on golang ([7ecda51](https://www.github.com/sbulav/dotfiles/commit/7ecda5157d1e187ac91e1c880da347faa688aa6b))
* Remove if for please_release ([e3850bd](https://www.github.com/sbulav/dotfiles/commit/e3850bd5f9c68dce3eae2bc6b3d747c10f531857))
