terraform {
  cloud {
    organization = "patrickalmeida"

    workspaces {
      name = "iac-cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {}

variable "zone_id" {
  type    = string
  default = "5362a9a7db74edfe9f70f554bc582470"
}

resource "cloudflare_record" "record_a_patrickalmeida_com" {
  name    = "patrickalmeida.com"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "199.36.158.100"
  zone_id = var.zone_id
}

resource "cloudflare_record" "record_cname_ftp" {
  name    = "ftp"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "patrickalmeida.com"
  zone_id = var.zone_id
}

resource "cloudflare_record" "record_cname_mail" {
  name    = "mail"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "patrickalmeida.com"
  zone_id = var.zone_id
}

resource "cloudflare_record" "record_cname_webmail" {
  name    = "webmail"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "titan.hostgator.com.br"
  zone_id = var.zone_id
}

resource "cloudflare_record" "record_cname_www" {
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "patrickalmeida.com"
  zone_id = var.zone_id
}

resource "cloudflare_record" "record_mx2_patrickalmeida_com" {
  name     = "patrickalmeida.com"
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mx2.titan.email"
  zone_id  = var.zone_id
}

resource "cloudflare_record" "record_mx1_patrickalmeida_com" {
  name     = "patrickalmeida.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mx1.titan.email"
  zone_id  = var.zone_id
}

resource "cloudflare_record" "record_txt_patrickalmeida_com_titan_email" {
  name    = "patrickalmeida.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:spf.titan.email ~all"
  zone_id = var.zone_id
}

resource "cloudflare_record" "record_txt_patrickalmeida_com_google_site_verification" {
  name    = "patrickalmeida.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "google-site-verification=krupBBtGhAMrRmQpC20SqacE0_O4ghqVu4y3VN2EVOQ"
  zone_id = var.zone_id
}

