## Test environments

- Local
    - Debian GNU/Linux 10 (buster), R version 3.6.3 (2020-02-29)
- Rhub
    - Ubuntu Linux 16.04 LTS, R-release, GCC
    - Fedora Linux, R-devel, clang, gfortran
    - Windows Server 2008 R2 SP1, R-devel, 32/64 bit
- GitHub Actions
    - {os: macOS-latest,   r: 'devel'}
    - {os: macOS-latest,   r: '4.0'}
    - {os: windows-latest, r: '4.0'}
    - {os: ubuntu-16.04,   r: '4.0', rspm: "https://packagemanager.rstudio.com/cran/__linux__/xenial/latest"}
    - {os: ubuntu-16.04,   r: '3.6', rspm: "https://packagemanager.rstudio.com/cran/__linux__/xenial/latest"}
    - {os: ubuntu-16.04,   r: '3.5', rspm: "https://packagemanager.rstudio.com/cran/__linux__/xenial/latest"}
    - {os: ubuntu-16.04,   r: '3.4', rspm: "https://packagemanager.rstudio.com/cran/__linux__/xenial/latest"}
    - {os: ubuntu-16.04,   r: '3.3', rspm: "https://packagemanager.rstudio.com/cran/__linux__/xenial/latest"}

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
