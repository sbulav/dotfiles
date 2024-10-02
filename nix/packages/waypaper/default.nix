{
  lib,
  python3,
  fetchFromGitHub,
  gobject-introspection,
  wrapGAppsHook,
  killall,
}:
python3.pkgs.buildPythonApplication rec {
  pname = "waypaper";
  version = "2.2";

  src = fetchFromGitHub {
    owner = "anufrievroman";
    repo = "waypaper";
    rev = "refs/tags/${version}";
    hash = "sha256-QrxDRlqjYErBpv1OwN3eDke4+e/dhTyLOD5qUt/apkM=";
  };

  nativeBuildInputs = [
    gobject-introspection
    wrapGAppsHook
  ];

  propagatedBuildInputs = [
    python3.pkgs.pygobject3
    python3.pkgs.platformdirs
    python3.pkgs.importlib-metadata
    python3.pkgs.pillow
    killall
  ];

  # has no tests
  doCheck = false;

  dontWrapGApps = true;

  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';

  meta = with lib; {
    changelog = "https://github.com/anufrievroman/waypaper/releases/tag/${version}";
    description = "GUI wallpaper setter for Wayland-based window managers";
    longDescription = ''
      GUI wallpaper setter for Wayland-based window managers that works as a
      frontend for popular backends like hyprpaper, swaybg and swww.

      If wallpaper does not change, make sure that IPC is enabled;
    '';
    homepage = "https://github.com/anufrievroman/waypaper";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [totalchaos];
    platforms = platforms.linux;
  };
}
