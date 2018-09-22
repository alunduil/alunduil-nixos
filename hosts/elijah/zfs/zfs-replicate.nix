{ buildPythonApplication, click, fetchPypi, hypothesis, mypy, pytest
, pytestcov, pytestrunner, stdenv, stringcase
}:

buildPythonApplication rec {
  pname = "zfs-replicate";
  version = "1.1.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0lnppbai1ypal4iwna14kqh7q5nzc3py55qp4ikdrxnm17h1103c";
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
