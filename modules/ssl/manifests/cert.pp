define ssl::cert() {
  $certpath = "${boxen::config::srcdir}/${title}"

  exec { "Generate certificate ${title}":
    command => "openssl req -x509 -newkey rsa:2048 -nodes -keyout ${certpath}.key -out ${certpath}.crt -days 1024 -subj '/C=US/ST=Georgia/O=SalesLoft/localityName=Atlanta/commonName=${title}'",
    creates => "${certpath}.crt",
    notify  => Exec["Add trusted certificate ${title}"],
  }

  exec { "Add trusted certificate ${title}":
    refreshonly => true,
    command     => "security add-trusted-cert -d -r trustRoot -k '/Library/Keychains/System.keychain' ${certpath}.crt",
    user        => root,
  }
}
