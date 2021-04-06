{ fetchgit, python3Packages }:

with python3Packages;

buildPythonPackage rec {
  pname = "litex";
  rev = "f7d26225ec1479"; # litex master of Apr 6, 2021, 12:27 PM
                          # GMT+2, patched to support RVFI tracing and
                          # including TockSecureIMC and
                          # TockSecureIMCFormal CPU variants
  version = "git-${rev}";

  src = fetchgit {
    url = "https://git.currently.online/leons/litex";
    rev = rev;
    sha256 = "01w2pkjavy6vhkj0vh6nlfj541qss1hgz407013v14zs940gq7ry";
  };

  # Already included in the modified upstream
  # patches = [
  #   ./0001-Add-Tock-VexRiscv-cpu-variants.patch
  # ];

  propagatedBuildInputs = [
    # LLVM's compiler-rt data downloaded and importable as a python
    # package
    pythondata-software-compiler-rt

    pyserial migen requests colorama
  ];

  doCheck = false;
}
