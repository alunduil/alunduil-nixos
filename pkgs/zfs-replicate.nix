{ buildPythonApplication, click, fetchPypi, hypothesis, mypy, pytest
, pytestcov, pytestrunner, stdenv, stringcase
}:

buildPythonApplication rec {
  pname = "zfs-replicate";
  version = "1.1.3";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0fmm8611x9f6lwmghyphignd0a6i5d1cr7w3vgali2xjdwqq1j7a";
  };

  checkInputs = [
    hypothesis
    mypy
    pytest
    pytestcov
  ];

  buildInputs = [
    pytestrunner
  ];

  propagatedBuildInputs = [
    click
    stringcase
  ];

  doCheck = false;

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
