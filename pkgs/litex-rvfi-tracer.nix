{ fetchgit, python3Packages }:

with python3Packages;

buildPythonPackage rec {
  pname = "litex-rvfi-tracer";
  rev = "025cd77f83ffc4";
  version = "git-${rev}";

  src = fetchgit {
    url = "https://git.currently.online/leons/litex-rvfi-tracer";
    rev = rev;
    sha256 = "1ddms3hqj495nagaizswicfkx5m6im0907xqn7q9k645d31kk561";
  };

  buildInputs = [
    litex migen
  ];

  # TODO: Fix checks
  doCheck = false;
}
