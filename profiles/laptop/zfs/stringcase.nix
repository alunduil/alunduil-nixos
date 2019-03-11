{ buildPythonPackage, fetchPypi, stdenv
}:

buildPythonPackage rec {
  pname = "stringcase";
  version = "1.2.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "023hv3gknblhf9lx5kmkcchzmbhkdhmsnknkv7lfy20rcs06k828";
  };

  checkInputs = [];

  buildInputs = [];

  propagatedBuildInputs = [];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = https://github.com/okunishinishi/python-stringcase;
    description = "Convert string cases between camel case, pascal case, snake case etc…";
    license = licenses.mit;
    maintainers = with maintainers; [ alunduil ];
  };
}

