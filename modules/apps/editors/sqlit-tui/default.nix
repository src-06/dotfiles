{
  # sqlit-tui with mssql-python driver to manage Microsoft SQL Server
  flake.nixosModules.apps = {pkgs, ...}: let
    pythonPackages = pkgs.python314Packages;
    msodbcDriver = pkgs.unixodbcDrivers.msodbcsql18;

    mssqlBuildInputs = with pkgs; [
      krb5
      openssl
      stdenv.cc.cc.lib
      unixodbc
      msodbcDriver
      zlib
    ];

    mssql-python-odbc = pythonPackages.buildPythonPackage {
      pname = "mssql-python-odbc";
      version = "18.6.2.1";
      format = "wheel";

      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/35/1f/6cdb575549fbbe6f49bcadb505768649c43226bd83ec57a53a934d48e459/mssql_python_odbc-18.6.2.1-py3-none-manylinux_2_28_x86_64.whl";
        hash = "sha256-uKrYIfO4Y3sObUY39Lcw7ZiXxGZfqZ1H5E6X/Rx5x3o=";
      };

      nativeBuildInputs = [pkgs.autoPatchelfHook];
      autoPatchelfIgnoreMissingDeps = ["libc.musl-x86_64.so.1"];
      buildInputs = mssqlBuildInputs;
    };

    mssql-python = pythonPackages.buildPythonPackage {
      pname = "mssql-python";
      version = "1.15.0";
      format = "wheel";

      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/c7/bf/50d2e0911f383038e59cda0730c52a82a1fcd0763d084ebefd6b3f5387cd/mssql_python-1.15.0-cp314-cp314-manylinux_2_28_x86_64.whl";
        hash = "sha256-aWQPjqdybpwde2cwmLrsS3tje7WxRHZOLmiMreZkBk0=";
      };

      nativeBuildInputs = [pkgs.autoPatchelfHook];
      propagatedBuildInputs = [pythonPackages.azure-identity] ++ [mssql-python-odbc];
      buildInputs = mssqlBuildInputs;
    };
  in {
    environment = {
      systemPackages = [
        ((pkgs.sqlit-tui.override {
            python3Packages = pythonPackages;
          }).overridePythonAttrs (old: {
            dependencies = old.dependencies ++ [pythonPackages.pymysql] ++ [mssql-python];
          }))
      ];

      unixODBCDrivers = [msodbcDriver];
    };

    persistence.cache.dirs = [
      ".config/sqlit"
    ];
  };
}
