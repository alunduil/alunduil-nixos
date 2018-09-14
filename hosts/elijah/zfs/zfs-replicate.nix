{ buildPythonApplication, click, fetchPypi, hypothesis, mypy, pytest
, pytestcov, pytestrunner, stdenv, stringcase
}:

buildPythonApplication rec {
  pname = "zfs-replicate";
  version = "1.0.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "021c2b3ck8l1idk0pr67nkch2vsakalp18bydkgckyvg03c2pyb8";
  };

  checkInputs = [
    hypothesis
    mypy
    pytest
    pytestcov
    pytestrunner
  ];

  buildInputs = [];

  propagatedBuildInputs = [
    click
    stringcase
  ];

  /*
  postPatch = ''
    patchShebangs bin
  '';
  */

  doCheck = true;

  checkPhase = ''
    pytest --doctest-modules
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/alunduil/zfs-replicate;
    description = "ZFS Snapshot Replication";
    license = licenses.bsd2;
    maintainers = with maintainers; [ alunduil ];
  };
}
