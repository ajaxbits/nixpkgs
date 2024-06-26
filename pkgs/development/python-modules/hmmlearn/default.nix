{
  lib,
  fetchPypi,
  buildPythonPackage,
  numpy,
  scikit-learn,
  pybind11,
  setuptools-scm,
  cython,
  pytestCheckHook,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "hmmlearn";
  version = "0.3.2";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7a9IX9seqI2prGQrIAbGPZlQ3RXU0TL3IFMF04Pm90U=";
  };

  buildInputs = [
    setuptools-scm
    cython
    pybind11
  ];

  propagatedBuildInputs = [
    numpy
    scikit-learn
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "hmmlearn" ];

  pytestFlagsArray = [
    "--pyargs"
    "hmmlearn"
  ];

  meta = with lib; {
    description = "Hidden Markov Models in Python with scikit-learn like API";
    homepage = "https://github.com/hmmlearn/hmmlearn";
    license = licenses.bsd3;
    maintainers = with maintainers; [ abbradar ];
  };
}
