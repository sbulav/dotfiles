# Changelog

## [5.1.0](https://github.com/sbulav/dotfiles/compare/v5.0.1...v5.1.0) (2025-05-04)


### Features

* **comments:** migrate to mini.comment ([2da66f1](https://github.com/sbulav/dotfiles/commit/2da66f1a2d11d44a854fbbf11e3692fd005e8201))
* **fish:** add tea completions ([f5579dc](https://github.com/sbulav/dotfiles/commit/f5579dc83db52edaae45ae9f6ac7b431e705c330))
* **nvim:** add mapping to delete current resource ([e32d69c](https://github.com/sbulav/dotfiles/commit/e32d69cbfd79f2417b53dcbd7fa8000e531fcf19))
* **nvim:** add new plugin Typr ([f9fd9c4](https://github.com/sbulav/dotfiles/commit/f9fd9c402ae5559d82b5b084655e2c71ecdef41e))
* **nvim:** add tofu_fmt formatter for TF ([8556608](https://github.com/sbulav/dotfiles/commit/8556608261ce979a1c042b649d316b8a8835f2e7))
* **nvim:** optimize startup time ([b64345e](https://github.com/sbulav/dotfiles/commit/b64345e9687208bdc639c1e5e7db8168a33abf1c))
* **picker:** switch from telescope to snacks picker ([8f3fb8d](https://github.com/sbulav/dotfiles/commit/8f3fb8d0d7c5fe8c647e89bc7ec89355f6f3bf0c))
* **quickfix:** replace deprecated qf_helper with quicker.nvim ([a6f85d2](https://github.com/sbulav/dotfiles/commit/a6f85d2cb2c061ee752edea28080e6f56f27dc0e))
* restore telescope mappings ([4e69ad0](https://github.com/sbulav/dotfiles/commit/4e69ad08be4f88d791c79b9f7b6d1f3fcb3afea2))
* snacks picker ([6cf37c6](https://github.com/sbulav/dotfiles/commit/6cf37c6858e78a6dcf8957bb271f6ba2d70db3f1))
* **snacks:** add more mappings ([afd3825](https://github.com/sbulav/dotfiles/commit/afd38250eb79c63a0095ad18f02d163285d69859))
* **snacks:** use snacks for notifications and dashboard ([8aea39e](https://github.com/sbulav/dotfiles/commit/8aea39ed5745aa95924355702cbbe555fa920027))
* **telescope:** enable fzf native ([c6dc2d2](https://github.com/sbulav/dotfiles/commit/c6dc2d2b3ea85f96853e2de61241bd3551abc348))


### Bug Fixes

* **fish:** allow posix-source to handle env values with = ([6642f10](https://github.com/sbulav/dotfiles/commit/6642f106477a8be929c30f3ed721a7aca7198b45))
* **fish:** allow posix-source to read secrets with= ([5921747](https://github.com/sbulav/dotfiles/commit/5921747dfa99c53cf958166d945d9948e1141da2))
* **indent:** disable treesitter indentation for now ([b492e8e](https://github.com/sbulav/dotfiles/commit/b492e8e18f704cb5bd7fb8c11260282f47d56960))
* **lazydev:** add libuv ([270a67e](https://github.com/sbulav/dotfiles/commit/270a67eadf6c3558a70e7f342f165d683c3f2449))
* mapping ([63209be](https://github.com/sbulav/dotfiles/commit/63209be75851a9dc4641c2d69770f6c610889017))
* **nvim:** restore search nixfiles ([1af2388](https://github.com/sbulav/dotfiles/commit/1af238836eb1021c1f4e678d42d15d03c185f2b5))
* re-add missing search mapping ([ee07755](https://github.com/sbulav/dotfiles/commit/ee07755b91861b629d7aa3e52fc0ac12e75fb216))
* **snacks.picker:** open selection on CR in all modes ([546dcd5](https://github.com/sbulav/dotfiles/commit/546dcd5457771f3a36d86090676de16dc07b2db7))
* **snacks:** correct pass cwd ([7b3626c](https://github.com/sbulav/dotfiles/commit/7b3626c0ef7571350d5ff12324c169d476a4d988))
* **theme:** disable borderless telescope ([8d7c9e3](https://github.com/sbulav/dotfiles/commit/8d7c9e3fe91948d514ad92d8c82fb2aaf716753a))

### [5.0.1](https://www.github.com/sbulav/dotfiles/compare/v5.0.0...v5.0.1) (2024-12-04)


### Bug Fixes

* use correct path in cdd ([7070c49](https://www.github.com/sbulav/dotfiles/commit/7070c49e51631f137f8c2417a4d7215fa97859bb))

## [5.0.0](https://www.github.com/sbulav/dotfiles/compare/v4.5.0...v5.0.0) (2024-12-04)


### ⚠ BREAKING CHANGES

* extract nix config to dotnix

### Features

* add authz ([3f3c888](https://www.github.com/sbulav/dotfiles/commit/3f3c8884356b2a7c3f1dd4081bfb49f2d19681dd))
* add examples of using sops ([c42b4a2](https://www.github.com/sbulav/dotfiles/commit/c42b4a2e4416bd26e94f623d4619b946fe234569))
* add local serverz ([3195a6c](https://www.github.com/sbulav/dotfiles/commit/3195a6c0e8994a2b31e9f67b859235edf772efa1))
* add sops-nix as home-manager ([89a5c81](https://www.github.com/sbulav/dotfiles/commit/89a5c81be5e4cbe92c58bb5e0c75b80f109623be))
* **aerospace:** add mappings to move nodes between monitors ([66b94c8](https://www.github.com/sbulav/dotfiles/commit/66b94c8c41029bf5f43154d3e226da1adf817f37))
* **aerospace:** pin anyconnect to wsp 6 ([94927da](https://www.github.com/sbulav/dotfiles/commit/94927dadfc12347233976b9da7429b7db4da0824))
* extract nix config to dotnix ([355f44b](https://www.github.com/sbulav/dotfiles/commit/355f44b0c4d01a52d63c0a21322d7a76ebcac139))
* **hyprland:** enable hyprcursor ([1901bb8](https://www.github.com/sbulav/dotfiles/commit/1901bb8379166700f117e6c7c8d7d8dda195c2ec))
* **hyprland:** pin obsidian to wsp 3 ([7ee5b23](https://www.github.com/sbulav/dotfiles/commit/7ee5b23d25da80439aed6c51834de4d98441a8c1))
* install myvpn on nz ([81e8909](https://www.github.com/sbulav/dotfiles/commit/81e8909c3125a7af0d4e82aa216d02931d32b4b8))
* **jellyfin:** working oidc client secrets injection ([c26bf77](https://www.github.com/sbulav/dotfiles/commit/c26bf775e90740caa73680288ecbb5748f6d2822))
* **jellyfin:** working sso ([5c023a6](https://www.github.com/sbulav/dotfiles/commit/5c023a62247811937c977faae42eb2be1b856434))
* **nix:** add adguard flood modules ([1b5c88c](https://www.github.com/sbulav/dotfiles/commit/1b5c88c799fdf702f40e657800c3bc722f1d582d))
* **nix:** add authelia and homepage ([41284fe](https://www.github.com/sbulav/dotfiles/commit/41284fe2eab8d3eece17a284afb4d6e1cd1b8de1))
* **nix:** add authelia TOTP, require auth for all domains ([199526f](https://www.github.com/sbulav/dotfiles/commit/199526f88bdc6737dd43ffcb10f8e8cda71d4781))
* **nix:** add basic jellyfin ([0bf2420](https://www.github.com/sbulav/dotfiles/commit/0bf2420e6f461c42ebdb31825a8d38ae068f7a09))
* **nix:** add cachix for wezterm ([adeba93](https://www.github.com/sbulav/dotfiles/commit/adeba93cae37e4c92b92803b759e0aafc1a9439d))
* **nix:** add dynamic dns rewrites ([cdfcd45](https://www.github.com/sbulav/dotfiles/commit/cdfcd45fe4de33fe807cf93060d16c414b295a7d))
* **nix:** add homepage module ([777e769](https://www.github.com/sbulav/dotfiles/commit/777e769167bafc862d8ba01bfd15c04b807b2e90))
* **nix:** Add LSP documentation on nixpkgs and flake ([8004c7a](https://www.github.com/sbulav/dotfiles/commit/8004c7acb9e3bfd45ab48019b0c8320b224e001e))
* **nix:** add new zanoza host ([f990192](https://www.github.com/sbulav/dotfiles/commit/f990192c4ee5c876b90165cb0cda06572575a6b7))
* **nix:** add nextcloud module ([4ff57e1](https://www.github.com/sbulav/dotfiles/commit/4ff57e1df5897cbcf2aa412f06e39a954b410a9c))
* **nix:** add openconnect hm module ([18328f0](https://www.github.com/sbulav/dotfiles/commit/18328f03cec00e72073fa032ed6e0f0ae94f8de4))
* **nix:** add parametrized homepage widgets ([e10c877](https://www.github.com/sbulav/dotfiles/commit/e10c8775603cbf69a3769ba34656901767dc915c))
* **nix:** add server suite ([b5a6c7d](https://www.github.com/sbulav/dotfiles/commit/b5a6c7d2b6af06201c90d8c2b096b1dea3ecda68))
* **nix:** add traefik module ([9156894](https://www.github.com/sbulav/dotfiles/commit/91568940c5d77a9b7abac7b9500085243d089b3e))
* **nix:** auth nextcloud via oidc ([38ca6bb](https://www.github.com/sbulav/dotfiles/commit/38ca6bbe1e27f9f060c561d35b09234f69f586b6))
* **nix:** bump snowfall-lib to 3.0.3, remove unused templates ([72ed681](https://www.github.com/sbulav/dotfiles/commit/72ed681289ff9d8c3e646b9f75f3cff3a006c1ef))
* **nix:** conditional adguard rewrite ([8da1ec0](https://www.github.com/sbulav/dotfiles/commit/8da1ec0ac6d52c7ff16ee219ba34daafac24c2a8))
* **nix:** deploy on remote via deploy-rs ([6d5c6ed](https://www.github.com/sbulav/dotfiles/commit/6d5c6edf65c4e3db0bb0dabfe9bf6fde2c61d9cf))
* **nix:** enable atuin on serverz ([50e0ed1](https://www.github.com/sbulav/dotfiles/commit/50e0ed17ca2116a07bfcb939cfae416e8d98249f))
* **nix:** enable chachix on darwin ([738e775](https://www.github.com/sbulav/dotfiles/commit/738e775a81fd67a5b5618b3526e53a0a71ba758d))
* **nix:** enable sops in homes on serverz ([6bbbe24](https://www.github.com/sbulav/dotfiles/commit/6bbbe2480fb0189a5fad8ad7e443781d9fc9c2d8))
* **nix:** enable sops on serverz ([747fbe9](https://www.github.com/sbulav/dotfiles/commit/747fbe9e4f1d2468d2f9fa65f87633bf23ca5010))
* **nix:** enable zfs on serverz ([8e52e14](https://www.github.com/sbulav/dotfiles/commit/8e52e145b411a6a8ff84efc42eb93c1e7170dd09))
* **nix:** extract traefik config to shared module ([6c0aa82](https://www.github.com/sbulav/dotfiles/commit/6c0aa8287465eed0a2f30a1e4cb6e28a2ef85525))
* **nix:** make dns rewrites in module ([297a286](https://www.github.com/sbulav/dotfiles/commit/297a286318c2128d2a00fc382b99a979f52c2a43))
* **nix:** set oidc content to implicit for nextcloud ([5677047](https://www.github.com/sbulav/dotfiles/commit/567704790149064b9b4dc6611b9a0a3b8e833381))
* **nix:** start working on jellyfin ([586eae8](https://www.github.com/sbulav/dotfiles/commit/586eae8c902ecb66ea3b1aed6e0d78152b918aa9))
* **nix:** switch from nil_ls to nixd ([14b6504](https://www.github.com/sbulav/dotfiles/commit/14b65045cf6886bf65eef535abb49a7cc157a334))
* **nix:** switch serverz to efi ([e7ac346](https://www.github.com/sbulav/dotfiles/commit/e7ac3462720e078e498d9198c5f169c9eb052936))
* **nix:** switch to sops env secrets ([5598627](https://www.github.com/sbulav/dotfiles/commit/559862798dd14b57e3a5c781e24cecb37bf646a2))
* **nix:** update serverz to use zfs ([c3ab9c9](https://www.github.com/sbulav/dotfiles/commit/c3ab9c9a3ababb76874ed8a18284d82351f910f9))
* **nix:** use correct cookie parameter ([a2fd512](https://www.github.com/sbulav/dotfiles/commit/a2fd51285c106fbab72185b373d3d725ec1b3d1d))
* **nix:** use correct fs on serverz ([65d0c2f](https://www.github.com/sbulav/dotfiles/commit/65d0c2f50db314f7909cdb12dac08ef3c8d621ee))
* **nix:** use fetchzip in jellyfin module to get plugin ([88842b3](https://www.github.com/sbulav/dotfiles/commit/88842b3319bafcbdbdfbc039fa23cd9efab875c3))
* **nvim:** dial.nvim - add enabled/disabled to cycle ([1f85701](https://www.github.com/sbulav/dotfiles/commit/1f85701707708b469d5e4bac0ec595f6a50ae719))
* restructure secrets, make them work on darwin ([0666ccc](https://www.github.com/sbulav/dotfiles/commit/0666ccc97d2a0fe3edee4397b6fb23dc8ff9283d))
* **sops:** add keys for serverz ([732b0b9](https://www.github.com/sbulav/dotfiles/commit/732b0b914c54c1b1debe91486505f771107634ae))
* **sops:** add serverz secrets ([c111964](https://www.github.com/sbulav/dotfiles/commit/c1119641ee2d83510a43c0a2231a6f6693584679))
* **sops:** make atuin use key from sops ([43cc1c3](https://www.github.com/sbulav/dotfiles/commit/43cc1c310cbbb75dc6b44282232024a83b8172a5))
* **sops:** make secrets optional in homes ([f9dffc8](https://www.github.com/sbulav/dotfiles/commit/f9dffc84c933126e656e37dc208cf1b1d9ef8706))
* **sops:** manage atuin config and key ([2605f54](https://www.github.com/sbulav/dotfiles/commit/2605f54002856b31c43d1c9621564d258ab1d67f))
* **sops:** working sops! ([a96f511](https://www.github.com/sbulav/dotfiles/commit/a96f5118528590d287fe8bcc95a1a5dd6fd93195))
* **wallpapers:** add more wallpapers, change default ([981b49b](https://www.github.com/sbulav/dotfiles/commit/981b49b74c7c6873c615f18c236292e46494cdbd))
* **waypaper:** switch to waypaper from nixpkgs ([403d9be](https://www.github.com/sbulav/dotfiles/commit/403d9bee10a77899404cf693a449f2a1450aa66a))
* **wezterm:** add quick_select_patterns ([63f4cf1](https://www.github.com/sbulav/dotfiles/commit/63f4cf1bee0a2d0e7b114477b7eca2844285bf02))
* **yazi:** switch to cyberdream theme ([396385a](https://www.github.com/sbulav/dotfiles/commit/396385adab7a7d2c8f52d0b42e6c767f3aa19ba8))


### Bug Fixes

* **aerospace:** update wezterm launch ([ed3d249](https://www.github.com/sbulav/dotfiles/commit/ed3d2490cc90f2cf91a69e93d76e937a8d81ce19))
* **authelia:** forward-auth ([16513bc](https://www.github.com/sbulav/dotfiles/commit/16513bc8965f8f6a12fbe19b3f9b621d6e939dd3))
* **nix:** add more params to traefik module ([9255bf9](https://www.github.com/sbulav/dotfiles/commit/9255bf9e66a0c002bd7bf676ae96e3615aa21d10))
* **nix:** add nz specific route to work under VPN ([d54f1b8](https://www.github.com/sbulav/dotfiles/commit/d54f1b80d42158b8003ba309f602d1e397e0d322))
* **nix:** avoid mounting via internet on VPN ([1111fcb](https://www.github.com/sbulav/dotfiles/commit/1111fcb68284527bd83e7a00e448e94eb8f97e5b))
* **nix:** remove following wezterm nixpkgs ([380ae64](https://www.github.com/sbulav/dotfiles/commit/380ae64fbca8a4e087b8c7f076547277d8ff6fd2))
* **nix:** use correct icons in homepage ([a693979](https://www.github.com/sbulav/dotfiles/commit/a6939794bb19ee18a7d2a355cf37b01bf5f9c053))
* **nix:** with lib required ([1422fee](https://www.github.com/sbulav/dotfiles/commit/1422fee06025f98e3e6682101229710bb66dc431))
* **openconnect:** use correct name in check ([8b8adab](https://www.github.com/sbulav/dotfiles/commit/8b8adab8b018bec502174a748ccf98db7d032d8e))
* **vpn:** remove lan routes from vpn ([c5dcebc](https://www.github.com/sbulav/dotfiles/commit/c5dcebc7624f4e4a38eb95daa953690e5a016a54))
* **wallpapers:** typo ([e531f3c](https://www.github.com/sbulav/dotfiles/commit/e531f3c6477541c5d0529c34ff61f99fd01cb845))

## [4.5.0](https://www.github.com/sbulav/dotfiles/compare/v4.4.0...v4.5.0) (2024-10-10)


### Features

* **fish:** add gpm function ([aeb7ae9](https://www.github.com/sbulav/dotfiles/commit/aeb7ae9166583b282bc12258b419d61d87c89769))

## [4.4.0](https://www.github.com/sbulav/dotfiles/compare/v4.3.0...v4.4.0) (2024-10-02)


### Features

* add helm_ls ([aebb538](https://www.github.com/sbulav/dotfiles/commit/aebb5380e847940691ce82ee0b5da46a2c44aad3))
* add helm-ls to darwin ([cf3e358](https://www.github.com/sbulav/dotfiles/commit/cf3e358e25a525117ffa1b120d015d889b8f7eb3))
* add mbp16 ([b575ab5](https://www.github.com/sbulav/dotfiles/commit/b575ab5a2313e68c9ece4393fcb2251ce5f563b3))
* add obsidian modules and mount for it ([531c125](https://www.github.com/sbulav/dotfiles/commit/531c12556ddf20f4d431fa8aed071f576f7c77ae))
* enable obsidian in mac16 ([e263477](https://www.github.com/sbulav/dotfiles/commit/e2634772486517b64b9607567ccb753c9a2f49e2))
* **nix:** add aerospace module ([4285b7a](https://www.github.com/sbulav/dotfiles/commit/4285b7aa31a00998ea3b02ba576c212d9b8e48ce))
* **nix:** add dock settings ([eab9d74](https://www.github.com/sbulav/dotfiles/commit/eab9d746287445b92a02cf1fb2e079e88c76f7e9))
* **nix:** add more default darwin options ([2977ced](https://www.github.com/sbulav/dotfiles/commit/2977ced02d07e54ba82598998660c0dcf0633cd5))
* **nix:** add system security darwin touchid module ([ba2880d](https://www.github.com/sbulav/dotfiles/commit/ba2880d554b30bb322e776254ffafee3214073ce))
* **nix:** add waypaper module ([d7fb7f7](https://www.github.com/sbulav/dotfiles/commit/d7fb7f723a7f5ca9ed26c3793939f2a5314e1dde))
* **nix:** add waypaper with hyprpaper support ([077f8ec](https://www.github.com/sbulav/dotfiles/commit/077f8ec7dbb85b0951604fce421f9e472d72ecae))
* **nix:** add zoom-us home module ([4cdada2](https://www.github.com/sbulav/dotfiles/commit/4cdada2e45b34fce0b96045d1ab7e0734854293f))
* **nix:** bump flakes with couple workarounds related to rust1.80 ([4a64342](https://www.github.com/sbulav/dotfiles/commit/4a64342a5c56f63bc0fd7ac0ffcaa6b4ff9bf9b2))
* **nix:** switch to wezterm nightly ([801a5cd](https://www.github.com/sbulav/dotfiles/commit/801a5cd8c0f414ec1350f8262bddce97458b2342))
* **nix:** tune aerospace bindings ([f20dd47](https://www.github.com/sbulav/dotfiles/commit/f20dd477cf015b93ab63bc29544b5846f9529a87))
* **nix:** tune aerospace keybindings ([c3fbbe4](https://www.github.com/sbulav/dotfiles/commit/c3fbbe4aca793396e09e5db65c366a7419a70794))
* **nix:** tune input, disable yabai on mbp16 ([66886d3](https://www.github.com/sbulav/dotfiles/commit/66886d3533c41fe4d9bd4df6e670ae8c59e9ef47))
* **nix:** use show app window in br aerospace ([5ea5161](https://www.github.com/sbulav/dotfiles/commit/5ea51616da7e273b75d9a6a6f38224a9a7d128af))
* **nvim:** add explicit yazi keymaps ([075d2ab](https://www.github.com/sbulav/dotfiles/commit/075d2ab05d08e497328e38430c6e7833fa047343))
* **nvim:** add mapping to copy current branch ([1c693b9](https://www.github.com/sbulav/dotfiles/commit/1c693b9bbd11e78064fe89b1d8f0552ec0dfae71))
* replace web-devicons with mini.icons ([7ade5e5](https://www.github.com/sbulav/dotfiles/commit/7ade5e51a5856605c7e00ee967561fab18c0d250))
* **vault:** switch to vault from github ([32dd1c2](https://www.github.com/sbulav/dotfiles/commit/32dd1c260b78c39f9a05ad3ea295ac2d960b060b))
* **wezterm:** flake now generates application on mac ([4e36242](https://www.github.com/sbulav/dotfiles/commit/4e36242996b6612a1231fa2f27dff04d39becb45))
* **yabai:** reorder windows on startup ([c298317](https://www.github.com/sbulav/dotfiles/commit/c2983172db25b651296e88188c2abc3d7256a2ac))


### Bug Fixes

* avoid messages each time when yazi is opened ([620d7bd](https://www.github.com/sbulav/dotfiles/commit/620d7bdbb15ff6f6f021c54276ed0e2906e69726))
* **nix:** add missing comma ([b5befdf](https://www.github.com/sbulav/dotfiles/commit/b5befdfee706506d9ceb51448ede9f42bb8e500d))
* **nix:** aerospace module and default config ([7fa3021](https://www.github.com/sbulav/dotfiles/commit/7fa302139d0cf8de64188f68f0fe828a63f7f38d))
* **nix:** function keys work as f on darwin ([4eed7c0](https://www.github.com/sbulav/dotfiles/commit/4eed7c0de07b0a93428ff34f18c106012f545eff))
* **nix:** hyprland cursor ([dd471b9](https://www.github.com/sbulav/dotfiles/commit/dd471b979e67ddee4030602fc70cdaffec831439))
* **nix:** pin zoom until sharing is fixed ([368e2fc](https://www.github.com/sbulav/dotfiles/commit/368e2fcb533b5e5b4fe1a7021ec8577186ce6103))
* **nix:** use correct mnt path ([f3c63b0](https://www.github.com/sbulav/dotfiles/commit/f3c63b08557aba6058579f0d00a044832bf10893))
* **nix:** use correct username for aerospace ([991c169](https://www.github.com/sbulav/dotfiles/commit/991c169850688f6ac9828639f5eaac0f66186787))
* **nix:** use int regreet option ([586fa18](https://www.github.com/sbulav/dotfiles/commit/586fa18578504f89df5e51539e23b09f6540a82b))
* **nix:** wrong spelling ([eafd6fa](https://www.github.com/sbulav/dotfiles/commit/eafd6faae3cef678f9ce09fdd6f5f853a4043c7c))
* **nix:** yazi 3.x shell block ([281b841](https://www.github.com/sbulav/dotfiles/commit/281b84129c3a31beefff84b2578ec8e591e9dc55))
* **nix:** zoom startup workspace ([1e4ab11](https://www.github.com/sbulav/dotfiles/commit/1e4ab11d57fc046eb78e3dbd47176c093b20ae42))
* **wezterm:** rendering and gpu fixed in master ([9a2a778](https://www.github.com/sbulav/dotfiles/commit/9a2a77845bb15b9d24d5a5530d49e3a00be8a8b1))
* **wezterm:** use correct colorscheme for k8s status ([9d58087](https://www.github.com/sbulav/dotfiles/commit/9d58087c8616bac3a4219516411f665e0640132d))

## [4.3.0](https://www.github.com/sbulav/dotfiles/compare/v4.2.0...v4.3.0) (2024-07-05)


### Features

* **fish:** change l to ls -la ([8472ec9](https://www.github.com/sbulav/dotfiles/commit/8472ec928b6d9c8e4dcaadffaddd0f8f18f13b6f))
* **nix:** add gcc to nixos for treesitter ([a44da2c](https://www.github.com/sbulav/dotfiles/commit/a44da2c56c653e9a917b81b9cd15a3a113088807))
* **nix:** add podman module ([1fa31ed](https://www.github.com/sbulav/dotfiles/commit/1fa31ed7f931de42d3ccfc669242714ef3bd73a7))
* **nix:** hyprpaper from hm ([10eb0f9](https://www.github.com/sbulav/dotfiles/commit/10eb0f9c7ef0308359a26e16337d5c68d74e55a8))
* **nvim:** add dial.nvim ([9c8deb3](https://www.github.com/sbulav/dotfiles/commit/9c8deb37218f92bf954cb75464052a8d4e845222))
* **nvim:** cyberdream for lualine ([f4634a9](https://www.github.com/sbulav/dotfiles/commit/f4634a9c41eab87bbc1c4b4b14c400a84023cb86))
* **nvim:** move to new yazi plugin ([09d4282](https://www.github.com/sbulav/dotfiles/commit/09d4282738f0ccea0ea71f4853ba0ba606b4e3d2))
* **nvim:** replace neodev with lazydev ([0f9d292](https://www.github.com/sbulav/dotfiles/commit/0f9d29234baa574ee2373a88723c630bfe9da27f))
* **nvim:** switch to cyberdream for now ([5878716](https://www.github.com/sbulav/dotfiles/commit/58787164d0bb29beb8bf681007baa1692b9a184e))
* **nvim:** update yamls capabilities ([06df9af](https://www.github.com/sbulav/dotfiles/commit/06df9afecc3e3b216426e3ab6976cdf3b0993a0c))


### Bug Fixes

* **hyprpaper:** use correct option ([26d3338](https://www.github.com/sbulav/dotfiles/commit/26d3338db4c0368ffbb588de732cc1c7da226574))
* **nix:** update flake and use openconnect_ssl ([cb9cf2f](https://www.github.com/sbulav/dotfiles/commit/cb9cf2f1688f9582b5dfbe83b21ddfc2ef27dbe7))

## [4.2.0](https://www.github.com/sbulav/dotfiles/compare/v4.1.0...v4.2.0) (2024-05-08)


### Features

* **lsp:** update node lsp to 22 ([e8c8dfd](https://www.github.com/sbulav/dotfiles/commit/e8c8dfd92dd3f897f08d650f3339181c298af1b2))
* **nix:** add bottom ([bd902d3](https://www.github.com/sbulav/dotfiles/commit/bd902d34933483f7bc3a9380bfaa25a47001caa4))
* **nix:** add brightnessctl ([927f3c7](https://www.github.com/sbulav/dotfiles/commit/927f3c7221c147f8c569feab9912a9b401d206e4))
* **nix:** enable argocd client ([b11b573](https://www.github.com/sbulav/dotfiles/commit/b11b573583f2ccaf6eab776476ac5187fbf67793))
* **nix:** enable xnviewmp cask ([93e2ebb](https://www.github.com/sbulav/dotfiles/commit/93e2ebb44c479115a1fac7a4fe9d09dc7e703812))
* **nix:** rework hyprpaper ([3533738](https://www.github.com/sbulav/dotfiles/commit/35337384015776c2f739e7b39a9ab7ee9db1b75a))
* **nix:** switch to nixfmt-rfc-style ([69e09bf](https://www.github.com/sbulav/dotfiles/commit/69e09bfa9512908fb371cecf8f0c6a3e5bc99f18))
* **nix:** use my own github based wallpapers ([7218897](https://www.github.com/sbulav/dotfiles/commit/72188977700f2a8c313a31ee7226d5d7c5e17d4d))
* **nvim:** add bash nredir cmd ([98f07ef](https://www.github.com/sbulav/dotfiles/commit/98f07ef37dad4173e131111aee2b69b7ef0eb9fd))
* **nvim:** add my plugin to validate gitlabCI ([3c95459](https://www.github.com/sbulav/dotfiles/commit/3c9545931553c81d26395798fb1b9c0df510648c))
* **nvim:** add neodev plugin ([c6fe658](https://www.github.com/sbulav/dotfiles/commit/c6fe658826d40d65900c135261c850fd640110bf))
* **nvim:** add TS exclusions ([1a60995](https://www.github.com/sbulav/dotfiles/commit/1a60995ef94420056ebe72d2c78e1d4b579c37b6))
* **nvim:** live grep in cwd by default ([7956e91](https://www.github.com/sbulav/dotfiles/commit/7956e915fd6f3faf53caeacc0b4f669c0f27a1fc))
* replace rnix with nil_ls as its deprecated ([7783331](https://www.github.com/sbulav/dotfiles/commit/778333144252af5e5b7093d56b1661159bd57b89))
* update flakes and use latest nixpackages ([bb4a37e](https://www.github.com/sbulav/dotfiles/commit/bb4a37e80338de8cba6d72b708f98cc7729aed32))


### Bug Fixes

* **nix:** disable font-manager until it compiles ([97236a2](https://www.github.com/sbulav/dotfiles/commit/97236a2d7ac90213fee24ce35b741b4621ebe295))
* **nix:** move pinentry to correct folder ([a8c21a4](https://www.github.com/sbulav/dotfiles/commit/a8c21a49bd7ab34a9eb62b0dbb42d439b64ecfd5))
* **rbw:** use gnome3 pinentry ([4b94e3c](https://www.github.com/sbulav/dotfiles/commit/4b94e3cef67a8cd48a988f8a218f5aa6ae1c759c))
* **rofi:** remove rofi-calc as its broken now ([599872d](https://www.github.com/sbulav/dotfiles/commit/599872dbe3642ee438b7bb0e131430b2724cba15))
* **wezterm:** add workaround for starting rofi ([e919242](https://www.github.com/sbulav/dotfiles/commit/e919242ac389bd86b723be8f6af16d2b6250f24e))
* **wezterm:** amend font until issue with wayland ([3cbd3cc](https://www.github.com/sbulav/dotfiles/commit/3cbd3cce8c8706045604bda0005acbc92da7811a))

## [4.1.0](https://www.github.com/sbulav/dotfiles/compare/v4.0.0...v4.1.0) (2024-03-14)


### Features

* **Nix:** add bitwarden-cli on darwin ([64f5483](https://www.github.com/sbulav/dotfiles/commit/64f548354c6d6d9b4c4a7c2b7885d398600e0ad0))
* **nix:** add darwin k8s and linters ([1de7b3a](https://www.github.com/sbulav/dotfiles/commit/1de7b3a83636f8a6c774e1fe12296eac6654fb5f))
* **nix:** add darwin wezterm module ([d320470](https://www.github.com/sbulav/dotfiles/commit/d3204704de23947847cb89d9714eb1ed715abf81))
* **nix:** add gh and direnv home modules ([422e2ec](https://www.github.com/sbulav/dotfiles/commit/422e2ec5264b81f55e84108959d0ea758f19270d))
* **nix:** add gh module ([b501863](https://www.github.com/sbulav/dotfiles/commit/b501863cf8801febe23f823d493fd073eda52e8e))
* **nix:** add virt manager darwin module ([b2eb6df](https://www.github.com/sbulav/dotfiles/commit/b2eb6df5f5a75d2658fc99e35e6dfeaf71ac3c62))
* **nix:** add virt-manager and kvm modules ([d2faf5a](https://www.github.com/sbulav/dotfiles/commit/d2faf5ac59fe76af942c0680b06a8656bc5e447d))
* **nix:** add vm hyprland rewrite rule ([92ca853](https://www.github.com/sbulav/dotfiles/commit/92ca853b68e725f08074bdb7c2ae1370a7ff9359))
* **nix:** add zoxide and build aliases for darwin ([690803e](https://www.github.com/sbulav/dotfiles/commit/690803e69dfff46287a3beacbe67739eb1d17bd9))
* **nix:** another wave of moving modules to hm ([d810d52](https://www.github.com/sbulav/dotfiles/commit/d810d5228b361cba506b1f952ee6bef0a5576490))
* **nix:** enable homebrew on darwin ([060a656](https://www.github.com/sbulav/dotfiles/commit/060a6569f8e316c2be728689010ff8c160448a80))
* **nix:** enable nvd diff output ([8aff530](https://www.github.com/sbulav/dotfiles/commit/8aff5306fc91f664ce302dc2981cf98463beb623))
* **nix:** finally working darwin config ([6535462](https://www.github.com/sbulav/dotfiles/commit/653546290007b39801f0bd6ff7c0c7f26012517c))
* **nix:** install vault on darwin ([01400bb](https://www.github.com/sbulav/dotfiles/commit/01400bbf55c130fffc0f3618aea743581d25997d))
* **nix:** install vault on nz ([049c79c](https://www.github.com/sbulav/dotfiles/commit/049c79c132f07d8365137735cdf9ca9a42540a76))
* **nix:** more modules migrated to hm ([c496a2f](https://www.github.com/sbulav/dotfiles/commit/c496a2ffb04852b62fa1fcecbf300e07ef850e9b))
* **nix:** move hyprland to hm ([ba3d1e2](https://www.github.com/sbulav/dotfiles/commit/ba3d1e25bc86d2d1b30aac502728fa3696ee0b02))
* **nix:** move rbw to hm ([87a974a](https://www.github.com/sbulav/dotfiles/commit/87a974a92cb3fc1abc64ca78a14bdee7f45565f6))
* **nix:** remove tmux on darwin/fish ([b05265f](https://www.github.com/sbulav/dotfiles/commit/b05265f80c75e94d0c054ada09c7777a8289b29b))
* **nix:** start migrating home manager modules ([9dcca4b](https://www.github.com/sbulav/dotfiles/commit/9dcca4b0c21c6b146994ce5c4bbebed2540aad6c))
* **nix:** switch from neofetch to fastfetch ([47708fb](https://www.github.com/sbulav/dotfiles/commit/47708fb8eb3330f61427443ca910edc7d6b93fb9))
* **nix:** switch hyprland via hm ([c6de3e0](https://www.github.com/sbulav/dotfiles/commit/c6de3e01a1d3937ebb268355db88759463624924))
* **nix:** switch to hypridle ([d9b2a51](https://www.github.com/sbulav/dotfiles/commit/d9b2a5158902ac783754250dcf9c52b500d6de7d))
* **nix:** wip on nix darwin ([e7dab69](https://www.github.com/sbulav/dotfiles/commit/e7dab691d59b266993fc4430299ad6eab5f175b5))
* **nvim:** rework mark utils, add quickfix marks ([22f46a3](https://www.github.com/sbulav/dotfiles/commit/22f46a3b999eed8133ccb413de7ec407a6e5bacb))
* **wayland:** tune hyprland module ([df7f836](https://www.github.com/sbulav/dotfiles/commit/df7f8369ea54f8e7fdb126f7c42c9e24000ccdc6))


### Bug Fixes

* **hypr:** clean up and restore swaylock bind ([4d936af](https://www.github.com/sbulav/dotfiles/commit/4d936afb7aabd963e482d0a0e2b2e99a4acbc140))
* **nix:** correctly create wgetrc ([97cf03c](https://www.github.com/sbulav/dotfiles/commit/97cf03c432f0581460a982be68b757518dc4ae82))
* **nix:** fix wezterm on darwin ([e112e5d](https://www.github.com/sbulav/dotfiles/commit/e112e5dee9aa615278fe0cd1e133b89dcc508c67))
* **swayidle:** enable check empty pwd as it's required for fingerprint ([b1052dd](https://www.github.com/sbulav/dotfiles/commit/b1052dd53255c9cccbcfb65909b3018e23ec8c7a))
* **waybar:** add zoom icon ([f947355](https://www.github.com/sbulav/dotfiles/commit/f947355e8b4ddfc0bb529aa8cc11aac04fac1281))
* **waybar:** use correct icon for zoom ([4e867e2](https://www.github.com/sbulav/dotfiles/commit/4e867e2cd16805b03197ea61621b2ef668bc5d61))

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
