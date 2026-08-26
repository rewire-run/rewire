{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, makeWrapper
, udev
, vulkan-loader
, libGL
, libxkbcommon
, wayland
, libx11
, libxcursor
, libxi
, libxrandr
}:

let
  # Regenerated from the release assets by mirror.yaml. The copy alongside this file is the last
  # released snapshot, kept so the derivation can be built and tested from this repo.
  sources = builtins.fromJSON (builtins.readFile ./sources.json);

  inherit (sources) version;

  source = sources.platforms.${stdenv.hostPlatform.system}
    or (throw "rewire: no release published for ${stdenv.hostPlatform.system}");

  isLinux = stdenv.hostPlatform.isLinux;

  # The viewer reaches these through dlopen, so autoPatchelf cannot see them and they have to be
  # on the runtime path instead.
  viewerLibs = lib.makeLibraryPath [
    vulkan-loader
    libGL
    libxkbcommon
    wayland
    libx11
    libxcursor
    libxi
    libxrandr
  ];
in
stdenv.mkDerivation {
  pname = "rewire";
  inherit version;

  src = fetchurl {
    url = "https://github.com/rewire-run/rewire/releases/download/v${version}/rewire-${version}-${source.platform}.tar.gz";
    inherit (source) sha256;
  };

  # The archive holds the binaries flat, with no wrapping directory.
  sourceRoot = ".";

  nativeBuildInputs = [ makeWrapper ] ++ lib.optionals isLinux [ autoPatchelfHook ];
  buildInputs = lib.optionals isLinux [ (lib.getLib stdenv.cc.cc) udev ];

  # A release may ship without the viewer: it is copied in from a separate repo's artifact and the
  # release job tolerates its absence, as does install.sh.
  installPhase = ''
    runHook preInstall

    install -Dm755 rewire $out/bin/rewire
    if [ -f rewire-viewer ]; then
      install -Dm755 rewire-viewer $out/bin/rewire-viewer
    fi

    runHook postInstall
  '';

  postFixup = lib.optionalString isLinux ''
    if [ -e $out/bin/rewire-viewer ]; then
      wrapProgram $out/bin/rewire-viewer --prefix LD_LIBRARY_PATH : ${viewerLibs}
    fi
  '';

  meta = {
    description = "Drop-in ROS 2 bridge for Rerun";
    longDescription = ''
      Stream live ROS 2 topics to the Rerun viewer for real-time visualization.
      No ROS 2 runtime or build required — rewire speaks DDS and Zenoh natively.
    '';
    homepage = "https://rewire.run";
    downloadPage = "https://github.com/rewire-run/rewire/releases";
    license = lib.licenses.unfree;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    mainProgram = "rewire";
    platforms = builtins.attrNames sources.platforms;
  };
}
