{channels, ...}: final: prev: {
  # TODO: remove this overlay when screen sharing if fixed in 6.1.15+
  inherit (channels.stable) zoom-us;
}
