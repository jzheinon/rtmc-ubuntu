include apt

$rstudio_version = "2021.09.0-351"
$release_short = "hirsute"

package { 'software-properties-common':
  ensure => 'installed',
}

package { 'dirmngr':
  ensure => 'installed',
}

apt::source { 'cran_40':
  before => Package["r-base"],
  comment  => 'This is the cran-40 repo',
  location => 'https://cloud.r-project.org/bin/linux/ubuntu',
  release  => 'stable',
  repos    => '${release_short}-cran40/',
  key      => {
    'id'     => '298A3A825C0D65DFD57CBB651716619E084DAB9',
    'server' => 'cloud.r-project.org',
  },
  include  => {
    'src' => true,
    'deb' => true,
  },
}

package { 'r-base':
  ensure => 'installed',
}

package { 'libclang-dev':
  ensure => 'installed',
}

package { 'libpq5':
  ensure => 'installed',
}

package { 'libcurl4':
  ensure => 'installed',
}

package { 'xfce4':
  before => Package["r-base"], 
  ensure => 'installed',
}

exec { 'download R Studio':
  before => Exec["install R Studio"],
  require => Package['libpq5','libclang-dev','r-base'],
  creates => '/tmp/rstudio-${rstudio_version}-amd64.deb',
  command => 'wget -O /tmp/rstudio-${rstudio_version}-amd64.deb https://download1.rstudio.org/desktop/bionic/amd64/rstudio-${rstudio_version}-amd64.deb',
  path => ['/bin', '/usr/bin', '/usr/local/bin'],
}

exec { 'install R Studio':
  command => 'dpkg -i /tmp/rstudio-${rstudio_version}-amd64.deb',
}
