provider "googlecalendar" {}

resource "googlecalendar_event" "CH" {
  summary       = "Change execution"
  location      = "AWS"
  start         = "2022-10-30T18:00:00-08:00"
  end           = "2022-10-30T18:00:00-08:00"
  attendee {
    email       = "marcelo.lavor@gmail.com"
  }

}