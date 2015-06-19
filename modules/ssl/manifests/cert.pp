define ssl::cert() {
  $certpath = "${boxen::config::srcdir}/${title}"

  exec { "Generate certificate ${title}":
    command => "openssl req -x509 -newkey rsa:2048 -nodes -keyout ${certpath}.key -out ${certpath}.crt -days 1024 -subj '/C=US/ST=Georgia/O=SalesLoft/localityName=Atlanta/commonName=${title}'",
    creates => "${certpath}.crt",
  }

  exec { "Add trusted certificate ${title}":
    refreshonly => true,
    command     => "security add-trusted-cert -d -r trustRoot -k '/Library/Keychains/System.keychain' ${certpath}.crt",
    user        => root,
    subscribe   => Exec["Generate certificate ${title}"]
  }

  # Looks through all the ruby versions and install this certificate
  # to each keystore if not already present
  exec { "Add trusted certificate ${title} to rubies":
    refreshonly => true,
    command     => template("ssl/cert/install_rubies.sh.erb"),
    user        => root,
    provider    => "shell",
    subscribe   => Exec["Generate certificate ${title}"],
  }
  # Re-run this if a new ruby version is installed
  Ruby::Version <| |> ~> Exec["Add trusted certificate ${title} to rubies"]
}
