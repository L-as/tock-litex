{ fetchgit, python3Packages }:

with python3Packages;

buildPythonPackage rec {
  pname = "litex";
  rev = "0a98ebc59df44a"; # litex master of Mar 12, 2021, 9:49 PM
                          # GMT+1, patched to support RVFI tracing and
                          # including TockSecureIMC and
                          # TockSecureIMCFormal CPU variants
  version = "git-${rev}";

  src = fetchgit {
    url = "https://git.currently.online/leons/litex";
    rev = rev;
    sha256 = "07s8ad41fiah6400wyywh6p7xcsrwcj7fwmr3z8wsx8ci4yzx7sg";
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
