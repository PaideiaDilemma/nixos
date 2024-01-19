{ config, lib, pkgs, ... }:

let
  wallrnd = pkgs.rustPlatform.buildRustPackage rec {
    name = "wallrnd";
    version = "0.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "PaideiaDilemma";
      repo = "wallrnd";
      rev = "7fa88343c024978e0b4c4091359cf16b71abfe2a";
      hash = "sha256-RVnR39zXUBUy0tvOA4Lr5GrTL4czah3Ipu0rqmb/W8Y=";
    };

    cargoHash = "sha256-6Rj42QW/FgNX2EOFIlvc2HzuiQ8CmCBH7Xu0IGSudN8=";
    cargoBuildFlags = [
      "--release"
      "--features=nice"
    ];
  };
in
{
  home.packages = with pkgs; [
    wallrnd
  ];

  xdg.configFile."wallrnd/wallrnd.toml".text = ''
    [[entry]]
    themes = [ "penumbra_night",]
    span = "0600-1459"
    shapes = [ "all",]
    line_color = "sun"
    weight = 100

    [[entry]]
    themes = [ "penumbra_night",]
    span = "1500-0559"
    shapes = [ "all",]
    weight = 100

    [global]
    deviation = 5
    weight = 5
    size = 40.0

    [lines]
    width = 0.0
    color = "shade"

    [colors]
    sun_p = "#FFFDFB"
    sun = "#FFF7ED"
    sun_m = "#F2E6D4"
    sky_p = "#BEBEBE"
    sky = "#8F8F8F"
    sky_m = "#636363"
    shade_p = "#3E4044"
    shade = "#303338"
    shade_m = "#24272B"
    red = "#CA7081"
    orange = "#C27D40"
    yellow = "#92963A"
    green = "#47A477"
    cyan = "#00A0BA"
    blue = "#6E8DD5"
    purple = "#AC78BD"

    [themes]
    [[themes.penumbra_day]]
    color = "sky"
    weight = 10
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sky_m"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_day.salt]]
    color = "sky_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "sky_p"
    weight = 25
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sun_m"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_day.salt]]
    color = "sky"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "sun"
    weight = 25
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sun_m"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_day.salt]]
    color = "sun_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "sun_m"
    weight = 20
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sky_p"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_day.salt]]
    color = "sun"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "red"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sun_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "orange"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sun_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "yellow"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sun"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "green"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sun_m"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "cyan"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sun_m"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "blue"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sky_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_day]]
    color = "purple"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_day.salt]]
    color = "sky"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "sky"
    weight = 10
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "sky_m"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_night.salt]]
    color = "sky_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "sky_m"
    weight = 25
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade_m"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_night.salt]]
    color = "sky"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "shade"
    weight = 25
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade_m"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_night.salt]]
    color = "shade_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "shade_p"
    weight = 25
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "sky_m"
    likeliness = 0.04
    variability = 0

    [[themes.penumbra_night.salt]]
    color = "shade"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "red"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "sky_m"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "orange"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "yellow"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade_p"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "green"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "cyan"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "blue"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade"
    likeliness = 0.04
    variability = 0


    [[themes.penumbra_night]]
    color = "purple"
    weight = 5
    distance = 0
    variability = 0
    [[themes.penumbra_night.salt]]
    color = "shade_m"
    likeliness = 0.04
    variability = 0


    [shapes]
    all = []

    [data.patterns]
    nb_free_triangles = 15
    nb_free_circles = 15
    nb_free_stripes = 15
    nb_parallel_stripes = 15
    nb_concentric_circles = 13
    nb_crossed_stripes = 13
    nb_free_spirals = 3
    nb_parallel_waves = 10
    nb_parallel_sawteeth = 10
    var_parallel_stripes = 10
    var_crossed_stripes = 10
    width_spiral = 0.2
    width_stripe = 0.2
    width_wave = 0.7
    width_sawtooth = 0.5
    tightness_spiral = 0.3

    [data.tilings]
    size_hex = 10.0
    size_tri = 10.0
    size_hex_and_tri = 10.0
    size_squ_and_tri = 10.0
    size_rho = 14.0
    size_pen = 14.0
    nb_delaunay = 20000
  '';
}