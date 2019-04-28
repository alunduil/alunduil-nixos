{ buildPythonApplication, click, fetchPypi, hypothesis, mypy, pytest
, pytestcov, pytestrunner, stdenv, stringcase
}:

buildPythonApplication rec {
  pname = "zfs-replicate";
  version = "1.1.4";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1cyxiplwyi1yr0cpn7f8a72ladcwrm2i1dhwwsf9dyrhlig9ynkz";
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
