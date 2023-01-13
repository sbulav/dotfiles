# Changelog

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
